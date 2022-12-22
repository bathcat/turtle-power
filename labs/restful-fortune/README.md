# Lab: RESTful Fortune

## Summary
A major shortcoming of the standard [fortune](https://en.wikipedia.org/wiki/Fortune_(Unix))
application is its near total lack of either dad jokes _or_ cat facts.

For example, `fortune` will never tell you this--
> When asked if her husband had any hobbies, Mary Todd 
> Lincoln is said to have replied "cats."

Or this--
> 3 SQL statements walk into a NoSQL bar. Soon, they walk out.
> They couldn't find a table.


To remedy the situation, build a command-line application
that gets its fortune data from a public web API.  

Here are 2 examples of public API endpoints:
* https://cat-fact.herokuapp.com/facts/random
* https://official-joke-api.appspot.com/random_joke

If you want something else, there's a good list of public APIs [here](https://github.com/public-apis/public-apis).

## Requirements
* Use the `Invoke-RestMethod` command to fetch JSON data
* Extract the meaningful content 
* Display on the terminal

## Stretch Goals
* Clean up any resources
* Anticipate failure
* Write unit tests
* Censor any salty language

