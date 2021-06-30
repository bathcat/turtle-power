# Log Suspicious File

## Summary
There's a cmdlet in production called `Write-SuspicionLog`. It works ok,
but needs some refactoring. 

## Requirments
Implement the following:
* Turn the function into a cmdlet
* Declare the output type
* Add help documentation
* Put a type on all the parameters, make them manditory, and validate them like this:
  - Path should be a real file - decent message
  - Message shoud be a reasonably-sized string
  - Severity should be 1-10
  - Category should a limited set of reasonable options
