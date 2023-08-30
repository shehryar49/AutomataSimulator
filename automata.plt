# DFA Simulator
# MIT License

# Copyright (c) 2023 Shahryar Ahmad 

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

class SimulationError extends Error
{}

function simulate(var sig,var F,var table,var string)
{
  var state = 1 # starting state
  if(string == "") # empty string
    return F.find(state) == nil
  foreach(var ch: string)
  {
    var idx1 = sig.find(ch)
    if(idx1 == nil)
      throw SimulationError("Illegal alphabet '"+ ch + "' used in string!")  
    state = table[state-1][idx1]  
  }
  return F.find(state) != nil
}
function complexExample()
{
    # Abstract machine for strings starting and ending with same alphabet
    var alphabets = ["a","b","c","d"]
    var finalStates = [2,3,4,5]
    # Transition table
    #    \ a  | b  | c  | d 
    #    -------------------
    # q1 | q2 | q3 | q4 | q5
    # q2 | q2 | q6 | q6 | q6
    # q3 | q7 | q3 | q7 | q7
    # q4 | q8 | q8 | q4 | q8
    # q5 | q9 | q9 | q9 | q5
    # q6 | q2 | q6 | q6 | q6
    # q7 | q7 | q3 | q7 | q7
    # q8 | q8 | q8 | q4 | q8 
    # q9 | q9 | q9 | q9 | q5
    var transition = [[2,3,4,5],[2,6,6,6],[7,3,7,7],[8,8,4,8],[9,9,9,5],[2,6,6,6],[7,3,7,7],[8,8,4,8],[9,9,9,5]]
    var good = simulate(alphabets,finalStates,transition,"dcbabcdabcddddd")
    if(good)
      println("String is valid")
    else
      println("String is invalid")    

}

###########################
# IMPORTANT: states are numbered from 1
var alphabets = ["0","1"]
var finalStates = [2] # q2 is the only final state
# Transition table
# each row is for a specific state
# and each column is for a specific alphabet
# transition table for strings ending at 0
#    \ 0  | 1
#     ---------- 
# q1 | q2 | q1
# q2 | q2 | q1

# the simulation algorithm takes a matrix of integers
# 2 1
# 2 1
# in this case
var transition = [[2,1],[2,1]]

# starting state is always q1

var good = simulate(alphabets,finalStates,transition,"11110100")
if(good)
  println("String is valid")
else
  println("String is invalid")

#complexExample()