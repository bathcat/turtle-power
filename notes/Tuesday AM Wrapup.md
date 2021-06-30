Tuesday AM Wrapup
===================
3. What does 'alias' mean?
   Alternate command can be used
   % is an alias for foreach-object

4. How do you get online help for a specific cmdlet?h
	get-help 'get-command' -online

6. What's the difference between:
    Write-Host - Goes to host
    Write-OutPut - To host or to file or.... next command in line

7. Is this seminar about PowerShell Core? Or Powershell or what?
    PowerShell Core IS powershell for v6+

5. What does `Foreach-Object` do?
    Do an action for every single thing
    Get-childitem | %{ Remove-Item $_ }
    1..10 | %{ $_ * $_ }

8. What's the output for these 2 lines:

  write-error 'I broke' || Write-Host "Found an error... recovering."`
  write-host 'Went ok' || Write-Host "Found an error... recovering."`  
  write-host 'Went ok' && Write-Host "Found an error... recovering."

1. What's a cmdlet?
   Pwershell  verb-noun


2. How do you filter a stream?
   1..10 | ? {($_ % 2) -eq 0 }  