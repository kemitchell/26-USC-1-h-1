# # 26 U.S.C. 1(h)(1)

assert = require 'assert'

{netCapitalGain} = require '26-USC-1-h-2'

{adjustedNetCapitalGain} = require '26-USC-1-h-3'

{taxWithoutThisSubsection} = (taxpayer, taxYear) ->
  throw 'Not implemented'

{sum, excessOf, notExceeding, lesserOf} = require 'vocabulary'

module.exports = (taxpayer, taxYear) ->
  
  # Defined and overridden terms in the scope of 1(h)(1)
  netCapitalGain = netCapitalGain(taxpayer, taxYear)

  adjustedNetCapitalGain = adjustedNetCapitalGain(taxpayer, taxYear)

  # Treated as a property of the taxpayer for convenience, but actually
  # an output of the rest of the Internal Revenue Code
  taxableIncome = taxpayer.taxableIncome

  # Again, treated as a property for convenience
  taxableIncomeTaxedAtARateBelow25Percent = taxpayer.taxedAtARateBelow25Percent
    
  # ## Subparagraph A
  
  # > a tax computed at the rates and in the same manner as if this
  # > subsection had not been enacted
  # > on the greater of—
  subparagraph_A_tax  = taxWithoutThisSubsection(
    subparagraph_A_amount = greaterOf(

      # > (i) taxable income reduced by the net capital gain; or
      (taxableIncome - netCapitalGain),

      # > (ii) the lesser of—
      lesserOf(

        # > (I) the amount of taxable income taxed at a rate below 25
        # > percent; or
        taxableIncomeTaxedAtARateBelow25Percent,

        # > (II) taxable income reduced by the adjusted net capital
        # > gain;
        (taxableIncome - adjustedNetCapitalGain)
      )
    )
  )

  # ## Subparagraph B

  # > 5 percent (0 percent in the case of taxable years beginning
  # > after 2007)
  subparagraph_B_rate = if taxYear > 2007 then 0 else 0.05

  # > of so much of the adjusted net capital gain (or, if less,
  # > taxable income) as does not exceed
  subparagraph_B_amount = notExceeding(
    (
      if taxableIncome < adjustedNetCapitalGain
        taxableIncome
      else
        adjustedNetCapitalGain
    ),

    # > the excess (if any) of—
    excessOf(

      # > (i) the amount of taxable income which would (without
      # > regard to this paragraph) be taxed at a rate below 25
      # > percent, over
      taxableIncomeTaxedAtARateBelow25Percent,

      # > (ii) the taxable income reduced by the adjusted net
      # > capital gain;
      (taxableIncome - adjustedNetCapitalGain)
    )
  )

  subparagraph_B_tax = rate * subparagraph_B_amount

  # ## Subparagraph C

  # > 15 percent of
  subparagraph_C_rate = 0.15

  # > the adjusted net capital gain (or, if less, taxable income) in
  # > excess of
  subparagraph_C_amount = excessOf(
    (
      if taxableIncome < adjustedNetCapitalGain
        taxableIncome
      else
        adjustedNetCapitalGain
    ),

    # > the amount on which a tax is determined under
    # > subparagraph (B);
    subparagraph_B_amount
  )

  subparagraph_C_tax = subparagraph_C_rate * subparagraph_C_amount

  # ## Subparagraph D

  # > 25 percent of
  subparagraph_D_rate = 0.25

  # > the excess (if any) of—
  subparagraph_D_amount = excessOf(

    # > (i) the unrecaptured section 1250 gain (or, if less, the net
    # > capital gain (determined without regard to paragraph (11))),
    # > over
    (
      if netCapitalGainWithoutParagraph11 < unrecapturedSection1250Gain
        netCapitalGainWithoutParagraph11
      else
        unrecapturedSection1250Gain
    ),

    # > (ii) the excess (if any) of—
    excessOf(
      # > (I) the sum of the amount on which tax is determined under
      # > subparagraph (A) plus [sic?] the net capital gain, over
      sum(subparagraph_A_amount + netCapitalGain),

      # > (II) taxable income; and
      taxableIncome
    )
  )

  subparagraph_D_tax = subparagraph_D_rate * subparagraph_D_amount

  # ## Subparagraph E
  
  # > 28 percent of
  subparagraph_E_rate = 0.28

  # > the amount of taxable income in excess of
  subparagraph_E_amount = excessOf(
    taxableIncome,

    # > the sum of the amounts on which tax is determined under
    # > the preceding subparagraphs of this paragraph.
    sum(
      subparagraph_A_amount,
      subparagraph_B_amount,
      subparagraph_C_amount,
      subparagraph_D_amount,
    )
  )

  subparagraph_E_tax = subparagraph_E_rate * subparagraph_D_amount
    
  # > (h)(1) If a taxpayer has a net capital gain for any taxable
  # > year, the tax imposed by this section for such taxable year
  # > shall not exceed the sum of
  if netCapitalGain > 0
    assert(
      capitalGainsTax <= sum(
        subparagraph_A_tax,
        subparagraph_B_tax,
        subparagraph_C_tax,
        subparagraph_D_tax,
        subparagraph_E_tax
      )
    )
