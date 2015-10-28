require_relative '../calculator.rb'
require_relative '../equal_calculator.rb'

describe 'equal_calculator' do
  describe 'amount_of_monthly_repayment(month = nil)' do
    it 'should return an amount of the repayment per month' do
      calculator = EqualCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.amount_of_monthly_repayment(2).round(2)).to eq(16_458.83)
    end
  end

  describe 'amount_of_interest_accrued(month)' do
    it 'should return an amount of interest accrued per month' do
      calculator = EqualCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.amount_of_interest_accrued(2).round(2)).to eq(697.31)
    end
  end

  describe 'total_inpayment_per_month(month)' do
    it 'should return an amount of interest accrued per month' do
      calculator = EqualCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.total_inpayment_per_month.round(2)).to eq(17_156.14)
    end
  end 

  describe 'loan_balance(month)' do
    it 'should return a loan balance per month' do
      calculator = EqualCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.loan_balance(2).round(2)).to eq(67_218.36)
    end
  end 
end
