require( "minitest/autorun" )
require_relative( "../models/transaction" )

class TestTransaction < MiniTest::Test

  def setup
    options = {
      "value" => 20,
    }
    @transaction = Transaction.new(options)
  end

  def test_value
    assert_equal( 20, @transaction.value() )
  end

  def test_total_spend
    assert_equal( 55, Transaction.total_spend() )
  end

end