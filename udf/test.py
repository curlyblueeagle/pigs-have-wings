#!/usr/bin/env jython

@outputSchema("word:chararray")
def helloworld():
    return 'Hello, World'

@outputSchema("t:tuple(word:chararray,num:int)")
def complex(word):
    return str(word),len(word)

@outputSchema("validate:boolean")
def len_filter(tuple):
    return tuple[1] <= 12


