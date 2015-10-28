# A credit calculator with a standart payment type
class DefaultCalculator < Calculator
  def amount_of_monthly_repayment(month = nil)
    @amount_of_monthly_repayment ||= @total_loan / @period_in_months
  end

  def amount_of_interest_accrued(month)
    (loan_balance(month) + amount_of_monthly_repayment) * rate_per_month
  end

  def total_inpayment_per_month(month)
    amount_of_monthly_repayment + amount_of_interest_accrued(month)
  end

  def loan_balance(month)
    @total_loan - amount_of_monthly_repayment * month
  end
end
