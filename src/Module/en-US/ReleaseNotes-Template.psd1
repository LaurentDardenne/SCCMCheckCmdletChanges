#Ce Template de release note SCCM est utilisé par le module afin de contrôler les clés obligatoires
#Toutes les clés le sont, si une des clés n'est pas utilisée elle doit être associées à un tableau vide.

@{
   #Version de la release note
   LibraryChangesForVersion=''

   #Url de la release note
   Url=''

   #Les nouveaux cmdlets ne sont pas recensés car ils n'existent pas dans le code source.
   #Le contrôle des nouveaux cmdlets, en cas de modification, sera prise en charge par la prochaine release,

    #Cmdlet supprimés
    #Le code les utilisant est à corriger. Ces commandes sont considéré comme des breaking change
   RemovedCmdletNames=@(
   )

    #Alias supprimés
    #Le code les utilisant est à corriger. Ces commandes sont considéré comme des breaking change
   RemovedAliasNames=@(
   )

    #cmdlet obsolète (déconseillés)
    #Le code les utilisant n'est pas impacté, il est recommandé de ne plus les utiliser et d'adapter le code.
   DeprecatedCommandNames=@()

    #Les éléments suivants ont des problèmes connus de la bibliothèque d'applets de commande qui ne sont pas résolus dans cette version.
    #Le code les utilisant est peut-être à corriger si le bug n'était pas connu lors du développement.
   UnresolvedBugCommandNames=@(
   )

    #Les modifications suivantes ont été apportées aux applets de commande existantes dans cette version.
    #Elles peuvent être de nouvelles fonctionnalités, des correctifs de bogues ou la dépréciation.
    #Examinez attentivement les modifications pour comprendre comment elles peuvent affecter votre utilisation.
    #Le code les utilisant est peut-être à corriger si le bug n'était pas connu lors du développement.
   ChangedCommandNames=@(
   )

    #Les modifications suivantes sont indiquées comme étant des breaking change.
    #Le comportement de la commande a été modifié
    #Le code les utilisant est à corriger.
   BreakingChangesCommandNames=@(
   )
}
