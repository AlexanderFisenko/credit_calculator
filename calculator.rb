# A credit calculator
class Calculator
  module PaymentType
    DEFAULT = 'default'
    EQUAL     = 'equal'
  end

  attr_accessor :rate, :total_loan, :type, :period_in_months

  def initialize(rate:, total_loan:, period_in_months:)
    @rate = rate.to_f
    @total_loan = total_loan.to_f
    @period_in_months = period_in_months.to_i
  end

  def rate_per_month
    @rate / 12
  end

  def summarized_amount_of_repayment_for_all_months
    sum = 0
    @period_in_months.times do |month|
      sum += amount_of_monthly_repayment(month + 1)
    end

    sum
  end

  def summarized_amount_of_interest_accrued_for_all_months
    sum = 0
    @period_in_months.times do |month|
      sum += amount_of_interest_accrued(month + 1)
    end

    sum
  end

  def summarized_total_inpayment_for_all_months
    sum = 0
    @period_in_months.times do |month|
      sum += total_inpayment_per_month(month + 1)
    end

    sum
  end
end
