require( "minitest/autorun" )
require_relative( "../models/analysis" )
require_relative( "../models/merchant" )
require_relative( "../models/tag" )
require_relative( "../models/transaction" )

class TestAnalysis < MiniTest::Test

  def setup
    options = {
      "merchants" => Merchant.all(),
      "tags" => Tag.all(),
      "transactions" => Transaction.all()
    }
    @analysis = Analysis.new( options )
  end

  def test_transaction_date()
    transaction_date = @analysis.transactions[0].date_conducted()
    assert_equal( "2016-01-01", transaction_date)
  end

  def test_group_transactions_by_week()
    assert_equal( "sorted_transactions", @analysis.group_transactions_by_week() )
  end

end