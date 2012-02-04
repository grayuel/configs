#!/bin/bash
awk '/\(A\)/ {print "${color #8c595a}"$0}' ~/ToDo/todo.txt
awk '/\(B\)/ {print "${color #bdba73}"$0}' ~/ToDo/todo.txt
awk '/\(C\)/ {print "${color #97af81}"$0}' ~/ToDo/todo.txt
awk '/\(D\)/ {print "${color #84aaad}"$0}' ~/ToDo/todo.txt
awk '/\(E\)/ {print "${color #8c79b5}"$0}' ~/ToDo/todo.txt
awk '/^[^\(]/ {print "${color}"$0}' ~/ToDo/todo.txt
