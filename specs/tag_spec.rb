require( "minitest/autorun" )
require_relative( "../models/tag" )

class TestTag < MiniTest::Test

  def setup
    options = {
      "type" => "alcohol"
    }
    @tag_1 = Tag.new(options)
  end

  def test_total_spent
    assert_equal( 87, @tag_1.total_spent() )
  end

end