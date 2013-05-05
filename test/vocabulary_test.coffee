vocabulary = require '../src/vocabulary'

describe 'vocabulary', ->
  describe 'excessOf', ->
    it 'calculates the excess of one amount over another', ->
      scenarios = [
        [10, 5, 5],
        [10, 0, 10],
        [10, 10, 0]
      ]
      for [amount, over, result] in scenarios
        vocabulary.excessOf(amount, over).should.equal(result)

  describe 'notExceeding', ->
    it 'calculates how much of an amount is less than or equal to another', ->
      scenarios = [
        [10, 10, 10],
        [100, 10, 10]
      ]
      for [amount, over, result] in scenarios
        vocabulary.notExceeding(amount, over).should.equal(result)

  describe 'sum', ->
    it 'sums arguments', ->
      vocabulary.sum(1,2,3,4).should.equal(10)

  describe 'lesserOf', ->
    it 'returns the smallest argument', ->
      vocabulary.lesserOf(0, 1).should.equal(0)
