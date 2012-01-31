#!/bin/bash 
awk '/\(A\)/ {print "${color #d78787}"$0}' ~/ToDo/todo.txt
awk '/\(B\)/ {print "${color #f7f7af}"$0}' ~/ToDo/todo.txt
awk '/\(C\)/ {print "${color #afd787}"$0}' ~/ToDo/todo.txt
awk '/\(D\)/ {print "${color #87afd7}"$0}' ~/ToDo/todo.txt
awk '/\(E\)/ {print "${color #d7afd7}"$0}' ~/ToDo/todo.txt
awk '/^[^\(]/ {print "${color}"$0}' ~/ToDo/todo.txt
