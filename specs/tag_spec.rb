require( "minitest/autorun" )

class TestTag < MiniTest::Test

  def setup
    options = {
      "type" => "alcohol"
    }
    @test_tag = Tag.new()
  end

  def test_total_spent
    assert_equal( 87, @test_tag.total_spent )
  end

end