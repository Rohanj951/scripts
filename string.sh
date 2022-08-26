#!/bin/bash

#command                              #output
String="my name is Rohan"


echo "${String}"                      # my name is Rohan
echo "${String^}"                     # My name is Rohan 
echo "${String^^}"                    # MY NAME IS ROHAN
 
echo "${#String}"

String="MY name IS ROHAN"

echo "${String}"                      # MY name IS ROHAN
echo "${String,}"                     # mY name IS ROHAN
echo "${String,,}"                    # my name is rohan


echo "${#String}"
