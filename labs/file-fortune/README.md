# Lab: File Fortune

## Summary
You may be familiar with an old-school unix command-line
application called [fortune](https://en.wikipedia.org/wiki/Fortune_(Unix)).
The way it works is you type in `fortune` and it gives 
you your fortune. Woo!


## Requirements: 
* Parse the data file 
  - Located here: `_assets/fortunes.txt`
  - One fortune per line
* Pick a line at random
* Display in on the terminal
* Create unit tests with Pester
  - Mock dependencies like `Get-Random` and `Get-Content`


## Stretch Goals
* Make sure to clean up resources
* Anticipate the possibility of failure
  - Write a Pester test checking for the desired failure response
* Parse the actual `fortunes` data file used by the unix app
  - Located here: `_assets/fortunes`
  - Fortunes delimited by '%'
  - Trim any whitespace
