# Internal Revenue Code (Title 26, United States Code) Section 1, Subsection h

# naive implementations of some utility functions

sum = (array) ->
  value = 0
  value += i for i in array
  return value

maximum = (amounts) ->
  highest = null
  for amount in amounts
    if highest?
    highest = amount if amount > highest
    else
      highest = amount
  return highest

minimum = (amounts) ->
  lowest = null
  for amount in amounts
    if lowest?
      lowest = amount if amount < lowest
    else
      lowest = amount
  return lowest

IRC1h = (taxpayer) ->
  netCapitalGain = taxpayer.netCapitalGain
  if netCapitalGain
    a 
    b
    c
    d
    e
    maximum = sum([a + b + c + d + e])
    assert capitalGainsTax < maximum # 1(h)(1)