# SCCMCheckCmdletChanges
Check the cmdlets modified after a migration of the SCCM console.

Checks source files for the presence of a command name using a regex.
Occurrences in comments are considered, because if we do use the Powershell AST you can no longer search in the source files in C # for example.
