# A credit calculator with an equal payment type
class EqualCalculator < Calculator
  def amount_of_monthly_repayment(month)
    total_inpayment_per_month - amount_of_interest_accrued(month)
  end

  def amount_of_interest_accrued(month)
    if month == 1
      @total_loan * rate_per_month
    else
      loan_balance(month - 1) * rate_per_month
    end
  end

  def total_inpayment_per_month(month = nil)
    @total_inpayment_per_month ||= @total_loan * (rate_per_month + (rate_per_month / ((1 + rate_per_month)**@period_in_months - 1)))
  end

  def loan_balance(month)
    return @total_loan - amount_of_monthly_repayment(month) if month == 1

    loan_balance(month - 1) - amount_of_monthly_repayment(month)
  end
end
