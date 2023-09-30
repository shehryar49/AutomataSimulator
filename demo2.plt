import "automata.plt"

# Abstract machine for strings starting and ending with same alphabet
var alphabets = ["a","b","c","d"]
var finalStates = [1,2,3,4]
# Transition table
#    \ a  | b  | c  | d 
#    -------------------
# q0 | q1 | q2 | q3 | q4
# q1 | q1 | q5 | q5 | q5
# q2 | q6 | q2 | q6 | q6
# q3 | q7 | q7 | q3 | q7
# q4 | q8 | q8 | q8 | q4
# q5 | q1 | q5 | q5 | q5
# q6 | q6 | q2 | q6 | q6
# q7 | q7 | q7 | q3 | q7 
# q8 | q8 | q8 | q8 | q4
var transition = [[1,2,3,4],[1,5,5,5],[6,2,6,6],[7,7,3,7],[8,8,8,4],[1,5,5,5],[6,2,6,6],[7,7,3,7],[8,8,8,4]]

var machine = DFA(alphabets,finalStates,transition)

var good = machine.simulate("abcddbcabcda")
if(good)
  println("String is valid")
else
  println("String is invalid")    

