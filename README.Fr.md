# SCCMCheckCmdletChanges

Vérifie les cmdlets modifiés après une migration de la console SCCM.

Vérifie dans les fichiers source la présence d'un nom de commande à l'aide d'une expression régulière.
Les occurrences d'une commande dans les commentaires sont prises en compte, car l'utilisation de l'AST de Powershell ne permet plus de rechercher dans les fichiers sources en C# par exemple.

Chaque release notes de SCCM précise diverses modifications concernant ses cmdlets.
Une commande peut-être supprimée, dépréciée, son contrat changé avec ou sans breaking change ou encore livré avec un bug irrésolu.

Pour référencer les modifications d'une release de SCCM ce module utilise une hashtable hébergée dans un fichier .psd1.
Chaque nom de clé de cette hashtable précise un type de modification et est associé à un tableau de nom de commande ou un tableau vide.

Exemple pour les breaking change de la [release note 2013]( https://docs.microsoft.com/en-us/powershell/sccm/2103-release-notes?view=sccm-ps) :

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
isDeprecated               : False
isUnResolvedBug            : False
isChanged                  : True
isBreakingChange           : True

Version                    : 2006
Name                       : Set-CMScriptDeploymentType
Type                       : Cmdlet
Path                       : .\Examples\Test.ps1
isRemoved                  : False
isDeprecated               : False
isUnResolvedBug            : False
isChanged                  : True
isBreakingChange           : False
```

Une commande peut être présente dans plusieurs release note et pour des raisons différentes.

