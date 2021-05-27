#
# 1. Use the help system to find examples of how to use the command: 
#

## Find out about Get-Help usage
Get-Help Get-Help

## Oh: it's the -Examples flag
Get-Help Invoke-RestMethod -Examples


#
# 2. Get a list of processes for VS Code (the application is named 'code')
#

Get-Process -name code

## Better:

Get-Process | ? Name -like '*code*'

#
# 3. Get a list of Markdown documents (extension: md) in this folder and all sub-folders
#

Get-ChildItem *.md -Recurse | Select-Object FullName



#
# 4. Start an executable-- notepad.exe for instance-- and stop it
#

Start-Process notepad  
Stop-Process -Name notepad

#
# 5. Display the contents of this file: https://www.gutenberg.org/files/1322/1322-0.txt 
# 

Invoke-RestMethod https://www.gutenberg.org/files/1322/1322-0.txt

#
# 6. Get all warnings from the System event log since the beginning of the month.
# 

Get-EventLog -EntryType Warning -LogName System -After '05-01-2021'

# 
# 7. Create a link on your desktop to your Documents folder
# 


New-Item -ItemType SymbolicLink -Path ~/Desktop/Docs -Target ~/Documents/

## Note: You have have to run a new terminal as administrator 


#
# 8. Set your execution policy to 'RemoteSigned'-- Windows only)
# 

## First start a new terminal as administrator, then run:

Set-ExecutionPolicy RemoteSigned


# 
# 9. Set up your profile with a custom welcome banner. Something like:
#      'Hello, Mr. Bloggs. Welcome to Powershell.'

## First, find the location of you profile using the built-in variable
Get-Variable profile

## Next, use a text editor to open that file--create it if it doesn't exist--
##    and add something like this:

Write-Host "Hello Mr. Bloggs. Welcome to pwsh"

## Finally, save your profile and open a new terminal to see your custom greeting.



