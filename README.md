# ProductivityTools.RemoveModules

Module removes modules from system. 

<!--more-->

Module iterates through ``$env:PSModulePath`` directories and for each removes module with name provided or with the name which starts with provided string

```powershell
Remove-Modules -Name ProductivityTools.RemoveModules 
Remove-Modules -Name ProductivityTools. -StartsWith
```

Module also expose ``RemoveProductivityTools-Modules`` cmdlet
