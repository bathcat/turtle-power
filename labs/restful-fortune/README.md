# Lab: RESTful Fortune

## Summary
A major shortcoming of the standard [fortune](https://en.wikipedia.org/wiki/Fortune_(Unix))
application is its near total lack of either Kanye West 
quotes _or_ cat facts.

For example, `fortune` will never tell you this--
> When asked if her husband had any hobbies, Mary Todd 
> Lincoln is said to have replied "cats."

Or this--
> Fur pillows are hard to actually sleep on.


To remedy the situation, build a command-line application
that gets its fortune data from a public web API.  

Here are 2 examples of public API endpoints:
* http://api.kanye.rest
* https://cat-fact.herokuapp.com/facts/random
* https://official-joke-api.appspot.com/random_joke

There's a good list of public APIs [here](https://github.com/public-apis/public-apis).

(**Be warned:** Though Kanye is hilarious, he does get salty 
at times, so avoid him if your disposition is a sensitive one.)


## Requirements
* Use the `Invoke-RestMethod` command to fetch JSON data
* Extract the meaningful content 
* Display on the terminal


## Stretch Goals
* Clean up any resources
* Anticipate failure
* Write unit tests
* Censor Kanye's salty language

