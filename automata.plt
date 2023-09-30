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

class DFA
{
  # Symbols
  var sig = nil
  # Final State
  var F = nil
  # Transition Table
  var table = nil
  # Start state
  var start = nil

  function __construct__(var sig,var F,var table)
  {
    self.sig = sig
    self.F = F
    self.table = table
  }
  function simulate(var string)
  {
    var state = 0 # starting state
    if(string == "") # empty string
      return F.find(state) == nil
    foreach(var ch: string)
    {
      var idx1 = sig.find(ch)
      if(idx1 == nil)
        throw SimulationError("Illegal alphabet '"+ ch + "' used in string!")  
      state = table[state][idx1]  
    }
    return F.find(state) != nil
  }
  function union(var rhs)
  {
    
  }
}