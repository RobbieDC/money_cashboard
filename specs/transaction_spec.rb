require( "minitest/autorun" )
require_relative( "../models/transaction" )

class TestTransaction < MiniTest::Test
  attr_reader( :id, :value, :tag, :merchant_id )

  def setup
    options = {
      "value" => 20,
      "tag" => "alcohol"
    }
    @transaction = Transaction.new(options)
  end

  def test_value
    assert_equal( 20, @transaction.value() )
  end

end