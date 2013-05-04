# Internal Revenue Code (Title 26, United States Code) Section 1, Subsection h

# naive implementations of some utility functions

sum = (array) ->
  value = 0
  value += i for i in array
  return value

notExceeding = maximum = (amounts) ->
  highest = null
  for amount in amounts
    if highest?
    highest = amount if amount > highest
    else
      highest = amount
  return highest

lesserOf = min = (amounts) ->
  lowest = null
  for amount in amounts
    if lowest?
      lowest = amount if amount < lowest
    else
      lowest = amount
  return lowest

taxWithoutThisSubsection = () -> # not implemented

IRC1h = (netCapitalGain, adjustedNetCapitalGain, taxableIncome, taxableIncomeTaxedAtARateBelow25Percent) ->
  # 1(h)(1) In general
  # If a taxpayer has a net capital gain for any taxable year, ...
  if netCapitalGain > 0
    # ... the tax imposed by this section for such taxable year shall not exceed the sum of—
    assert capitalGainsTax <= sum(
      # 1(h)(1)(A)
      taxWithoutThisSubsection(
        maximum([
          # 1(h)(1)(A)(1)(i)
          (taxableIncome - netCapitalGain),
          # 1(1)(A)(1)(ii)
          lesserOf([
            taxableIncomeTaxedAtARateBelow25Percent,
            (taxableIncome - adjustedNetCapitalGain)
          ])
        ])
      )
      # 1(h)(1)(B)
      notExceeding(
        excess(
          taxableIncomeTaxedAtARateBelow25Percent,
          taxableIncome - adjustedNetCapitalGain
        )
      )
    )
    
    b
    c
    d
    e
  