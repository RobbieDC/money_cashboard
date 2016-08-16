require( "minitest/autorun" )
require_relative( "../models/analysis" )
require_relative( "../models/merchant" )
require_relative( "../models/tag" )
require_relative( "../models/transaction" )

class TestAnalysis < MiniTest::Test

  def setup
    options = {
      @merchants = Merchant.all()
      @tags = Tag.all()
      @transactions = Transactions.all()
    }
    @analysis = Analysis.new( options )
  end

  def test_merchants
    assert_equal("Black Isle Brewery", @merchants)
  end

end