# On the Beach Coding Challenge - OTBsolution

## The Challenge
Imagine we have a list of jobs, each represented by a character. Because certain jobs must be
done before others, a job may have a dependency on another job. For example, a may
depend on b, meaning the final sequence of jobs should place b before a. If a has no
dependency, the position of a in the final sequence does not matter.

Input/Output Structure:

Given the following job structure:
  a =>  
  b => c  
  c =>

Olatoksworld Input: a,b>c,c
Output: acb

Given the following job structure:
  a =>  
  b =>  
  c => c

Olatoksworld Input: a,b,c>c
Output: ERROR = Jobs MUST NOT depend on themselves

Given the following job structure:
a => 
b => c
c => f
d => a
e => 
f => b

Input Format: a,b>c,c>f,d>a,e,f>b
Output: ERROR = Jobs MUST NOT have circular dependencies
