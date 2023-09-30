import "automata.plt"



var alphabets = ["0","1"]
var finalStates = [1] # q1 is the only final state
# Transition table
# each row is for a specific state
# and each column is for a specific alphabet
# transition table for strings ending at 0
#    \ 0  | 1
#     ---------- 
# q0 | q1 | q0
# q1 | q1 | q0

# the simulation algorithm takes a matrix of integers
# 1 0
# 1 0
# in this case
var transition = [[1,0],[1,0]]

# build DFA machine

var machine = DFA(alphabets,finalStates,transition) # starting state is always 0

var good = machine.simulate("11110100")
if(good)
  println("String is valid")
else
  println("String is invalid")