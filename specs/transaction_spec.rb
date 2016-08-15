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

end