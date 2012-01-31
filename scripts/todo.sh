#!/bin/bash 
awk '/\(A\)/ {print "${offset 20}${color #d78787}"$0}' ~/ToDo/todo.txt
awk '/\(B\)/ {print "${offset 20}${color #f7f7af}"$0}' ~/ToDo/todo.txt
awk '/\(C\)/ {print "${offset 20}${color #afd787}"$0}' ~/ToDo/todo.txt
awk '/\(D\)/ {print "${offset 20}${color #87afd7}"$0}' ~/ToDo/todo.txt
awk '/\(E\)/ {print "${offset 20}${color #d7afd7}"$0}' ~/ToDo/todo.txt
awk '/^[^\(]/ {print "${offset 20}${color}"$0}' ~/ToDo/todo.txt
