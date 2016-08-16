require( "minitest/autorun" )
require_relative( "../models/merchant" )

class TestMerchant < MiniTest::Test

  def setup()
    options = {
      "name" => "Black Isle Brewery"
    }
    @merchant = Merchant.new( options )
  end

  def test_name
    assert_equal( "Black Isle Brewery", @merchant.name() )
  end

  def test_total_spent
    assert_equal( 80, @merchant.total_spent() )
  end

end