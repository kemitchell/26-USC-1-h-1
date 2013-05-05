# Simplistic implimentations of some recurring words and phrases

exports.sum = (amounts...) ->
  total = 0
  for amount in amounts
    total += amount
  return total
  
exports.excessOf = (amount, over) ->
  if amount > over
    return amount - over
  else
    return 0

exports.notExceeding = (amount, over) ->
  if amount <= over
    return amount
  else
    return over

exports.lesserOf = (amounts...) ->
  smallest = null
  for amount in amounts
    if smallest?
      smallest = amount if amount < smallest
    else
      smallest = amount
  return smallest
