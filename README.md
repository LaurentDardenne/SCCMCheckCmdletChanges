# SCCMCheckCmdletChanges

[French version](https://github.com/LaurentDardenne/SCCMCheckCmdletChanges/blob/main/README.Fr.md)

Checks source files for the presence of a command name using a regex.
The occurrences of a command in comments are considered, because if we do use the Powershell AST you can no longer search in the source files in C# for example.

Each SCCM release note specifies various changes to its cmdlets.
An command can be deleted, deprecated, its contract changed with or without breaking change or even delivered with an unresolved bug.

To reference the modifications of a SCCM release this module uses a hashtable hosted in a .psd1 file.
Each key name in this hashtable specifies a type of modification and is associated with an array of command name or an empty array.

Example for the breaking changes of the [release note 2103]( https://docs.microsoft.com/en-us/powershell/sccm/2103-release-notes?view=sccm-ps) :
```Powershell
   BreakingChangesCommandNames=@(
      'New-CMSoftwareUpdateAutoDeploymentRule'
      'Set-CMSoftwareUpdateAutoDeploymentRule'
   )
```

## Hashtable key details

### LibraryChangesForVersion

Specifies the version of the release note concerned.

### Url

Specifies the url of the release note on the publisher's documentation site (Microsoft)

### RemovedCmdletNames

List of deleted Cmdlets The code using them needs to be corrected. These deletions are considered in the analytical result as breaking changes.

### RemovedAliasNames

List of deleted aliases. The code using them needs to be corrected. These deletions are considered in the analytical result as breaking changes.

### DeprecatedCommandNames

List of obsolete (deprecated) cmdlets The code using them is not impacted, it is recommended to stop using them and to adapt the code.

### UnresolvedBugCommandNames

The listed items have known issues that are not resolved in this release. The code using them may need to be corrected if the bug was not known during development.

### ChangedCommandNames

The following changes have been made to existing cmdlets in this release. They can be new features, bug fixes, or deprecation. Carefully review the changes to understand how they may affect your usage. The code using them may need to be corrected if the bug was not known during development.

### BreakingChangesCommandNames
List the modifications of commands having breaking changes. The behavior of the command has been modified, the code using them needs to be corrected.

Note:

new commands are not referenced in this hashtable, as it is assumed that they do not exist in the current source code. If necessary, changes to these new cmdlets will be specified in the next release.

Then the Find-CommandName cmdlet iterates through these .psd1 files.

## Examples

```Powershell
cd Demo
Find-CommandName -path .\Examples\Test.ps1
```

Return for this file :

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

An command  can be present in several release notes and for different reasons.
