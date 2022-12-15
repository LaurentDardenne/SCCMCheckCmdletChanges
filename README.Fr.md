# SCCMCheckCmdletChanges

Vérifie les cmdlets modifiés après une migration de la console SCCM.

Vérifie dans les fichiers source la présence d'un nom de commande à l'aide d'une expression régulière.
Les occurrences d'une commande dans les commentaires sont prises en compte, car l'utilisation de l'AST de Powershell ne permet plus de rechercher dans les fichiers sources en C# par exemple.

Chaque release notes de SCCM précise diverses modifications concernant ses cmdlets.
Une commande peut-être supprimée, dépréciée, son contrat changé avec ou sans breaking change ou encore livré avec un bug irrésolu.

Pour référencer les modifications d'une release de SCCM ce module utilise une hashtable hébergée dans un fichier .psd1.
Chaque nom de clé de cette hashtable précise un type de modification et est associé à un tableau de nom de commande ou un tableau vide.

Exemple pour les breaking change de la [release note 2103]( https://docs.microsoft.com/en-us/powershell/sccm/2103-release-notes?view=sccm-ps) :

```Powershell
   BreakingChangesCommandNames=@(
      'New-CMSoftwareUpdateAutoDeploymentRule'
      'Set-CMSoftwareUpdateAutoDeploymentRule'
   )
```

## Détails des clés de la hashtable

### LibraryChangesForVersion

Précise la version de la release note concernée.

### Url

Précise l'url de la release note sur le site de documentation de l'éditeur (Microsoft)

### RemovedCmdletNames

Liste les Cmdlets supprimés
Le code les utilisant est à corriger. Ces suppressions sont considérées dans le résultat d'analyse comme étant des breaking change.

### RemovedAliasNames

Liste des alias supprimés.
Le code les utilisant est à corriger. Ces suppressions sont considérées dans le résultat d'analyse comme étant des breaking change.

### UnsupportedPSCoreCommandNames

Depuis la [release 2103](https://learn.microsoft.com/en-us/powershell/sccm/2103-release-notes?view=sccm-ps#cmdlets-that-dont-support-powershell-version-7) les cmdlets SCCM peuvent être utilisés avec Powershell 7, exceptés quelques-uns.

La recherche de ces cmdlets est activée via le paramètre -VerifyCoreCLR de la fonction Find-CommandName.

### DeprecatedCommandNames

Liste les cmdlet obsolète (déconseillés)
Le code les utilisant n'est pas impacté, il est recommandé de ne plus les utiliser et d'adapter le code.

### UnresolvedBugCommandNames

Les éléments listés ont des problèmes connus qui ne sont pas résolus dans cette version.
Le code les utilisant est peut-être à corriger si le bug n'était pas connu lors du développement.

### ChangedCommandNames

TODO Les modifications suivantes ont été apportées aux applets de commande existantes dans cette version.
Elles peuvent être de nouvelles fonctionnalités, des correctifs de bogues ou la dépréciation.
Examinez attentivement les modifications pour comprendre comment elles peuvent affecter votre utilisation.
Le code les utilisant est peut-être à corriger si le bug n'était pas connu lors du développement.

### BreakingChangesCommandNames

Liste les modification de commandes ayant des breaking change.
Le comportement de la commande a été modifié le code les utilisant est à corriger.

Note :

les nouvelles commandes ne sont pas référencées dans cette hashtable, car on supposes qu'ils n'existent pas dans le code source actuel.
Si nécessaire, les modifications de ces nouveaux cmdlets sera précisé dans la prochaine release.

## Examples

Ensuite le cmdlet Find-CommandName parcourt ces fichiers .psd1.

```Powershell
cd Demo
Find-CommandName -path .\Examples\Test.ps1
```

Retourne pour ce fichier le résultat suivant :

```Powershell
Version                    : 2002
Name                       : Set-CMScriptDeploymentType
Type                       : Cmdlet
Path                       : .\Examples\Test.ps1
isRemoved                  : False
isUnsupportedPSCore        : False
isDeprecated               : False
isUnResolvedBug            : False
isChanged                  : True
isBreakingChange           : True

Version                    : 2006
Name                       : Set-CMScriptDeploymentType
Type                       : Cmdlet
Path                       : .\Examples\Test.ps1
isRemoved                  : False
isUnsupportedPSCore        : False
isDeprecated               : False
isUnResolvedBug            : False
isChanged                  : True
isBreakingChange           : False
```

Une commande peut être présente dans plusieurs release note et pour des raisons différentes.
Par défaut le recherche cible du code pour Powershell v5.1


Si votre code cible Powershell Core ( >= V7) précisez le paramètre VerifyCoreCLR :

```Powershell
cd Demo
Find-CommandName -path .\Examples\TestUnsupportedPSCoreCmdlets.ps1 -VerifyCoreCLR
```

Retourne pour ce fichier le résultat suivant :

Version             : 2111
Name                : Set-CMScriptDeploymentType
Type                : Cmdlet
Path                : .\Examples\TestUnsupportedPSCoreCmdlets.ps1
isRemoved           : False
isUnsupportedPSCore : False
isDeprecated        : False
isUnResolvedBug     : False
isChanged           : True
isBreakingChange    : False

Version             : 2103
Name                : Export-CMPackage
Type                : Cmdlet
Path                : .\Examples\TestUnsupportedPSCoreCmdlets.ps1
isRemoved           : False
isUnsupportedPSCore : True
isDeprecated        : False
isUnResolvedBug     : False
isChanged           : False
isBreakingChange    : False

Version             : 2111
Name                : Export-CMPackage
Type                : Cmdlet
Path                : .\Examples\TestUnsupportedPSCoreCmdlets.ps1
isRemoved           : False
isUnsupportedPSCore : True
isDeprecated        : False
isUnResolvedBug     : False
isChanged           : False
isBreakingChange    : False

Dans ce cas on peut trouver deux entrées pour une même version, ici la 2111, l'une indiquant que le cmdlet n'est pas supporté par Powershell Core, l'autre indiquant les modifications pour Powershell version 5.1.

On peut également filtrer les cmdlets qui ne sont pas supportés :
```powershell
Find-CommandName -path .\Examples\TestUnsupportedPSCoreCmdlets.ps1 -VerifyCoreCLR|
  Where-Object { $_.isUnsupportedPSCore }|
  Select-Object -ExpandProperty Name -Unique
```
ou les regrouper par version :
```powershell
Find-CommandName -path .\Examples\TestUnsupportedPSCoreCmdlets.ps1 -VerifyCoreCLR|
 Group-object isUnsupportedPSCore
```

