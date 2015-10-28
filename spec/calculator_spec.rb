require_relative '../calculator.rb'
require_relative '../default_calculator.rb'
require_relative '../equal_calculator.rb'

describe 'calculator' do
  describe 'rate_per_month' do
    it 'should return rate per month' do
      calculator = Calculator.new(rate: 0.12, total_loan: 200_000, period_in_months: '6')

      expect(calculator.rate_per_month).to eq(0.01)
    end
  end

  describe 'summarized_amount_of_repayment_for_all_months' do
    it 'should return a summarized amount of repayment for all months for a default calculator type' do
      calculator = DefaultCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.summarized_amount_of_repayment_for_all_months.round(2)).to eq(100_000.00)
    end

    it 'should return a summarized amount of repayment for all months for an equal calculator type' do
      calculator = EqualCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.summarized_amount_of_repayment_for_all_months.round(2)).to eq(100_000.00)
    end
  end

  describe 'summarized_amount_of_interest_accrued_for_all_months' do
    it 'should return a summarized amount of interest accrued for all months for a default calculator type' do
      calculator = DefaultCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.summarized_amount_of_interest_accrued_for_all_months.round(2)).to eq(2916.67)
    end

    it 'should return a summarized amount of interest accrued for all months for an equal calculator type' do
      calculator = EqualCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.summarized_amount_of_interest_accrued_for_all_months.round(2)).to eq(2936.84)
    end
  end

  describe 'summarized_total_inpayment_for_all_months' do
    it 'should return a summarized total of inpayment for all months for a default calculator type' do
      calculator = DefaultCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.summarized_total_inpayment_for_all_months.round(2)).to eq(102_916.67)
    end

    it 'should return a summarized total of inpayment for all months for an equal calculator type' do
      calculator = EqualCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.summarized_total_inpayment_for_all_months.round(2)).to eq(102_936.84)
    end
  end
end
