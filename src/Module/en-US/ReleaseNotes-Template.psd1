#This SCCM release note template is used by the module to control mandatory keys
#All keys are mandatory, if one of the keys is not used it must be associated with an empty array.

@{
   #Release note version
   LibraryChangesForVersion=''

   #Url of the release note
   Url=''

   #New cmdlets are not registered because they do not exist in the source code.
   #The control of new cmdlets, in case of modification, will be supported by the next release,

    #Deleted Cmdlet
    #The source code using them needs to be corrected. These commands are considered breaking changes
   RemovedCmdletNames=@()

    #Alias supprimés
    #The source code using them needs to be corrected. These commands are considered breaking changes
   RemovedAliasNames=@()

    #This cmdlets only supports the ".NET Framework" runtime.
    #From release 2103 
   UnsupportedPSCoreCommandNames=@()

    #Deprecated cmdlet 
    #The source code using them is not impacted, it is recommended to stop using them and to adapt the code.
   DeprecatedCommandNames=@()

    #The following cmdlet have known issues with the Cmdlet Library that are not fixed in this release.
    #The source code using them may need to be corrected if the bug was not known during development.
   UnresolvedBugCommandNames=@()

    #The following changes have been made to existing cmdlets in this release.
    #They can be new features, bug fixes or deprecation.
    #Review the changes carefully to understand how they may affect your use.
    #The source code using them may need to be corrected if the bug was not known during development.
   ChangedCommandNames=@()

    #The following changes are marked as breaking changes.
    #Command behavior has been changed
    #The source code using them needs to be corrected.
   BreakingChangesCommandNames=@()
}
