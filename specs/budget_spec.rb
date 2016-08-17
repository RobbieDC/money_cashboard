require( "minitest/autorun" )
require_relative( "../models/budget" )

class TestBudget < MiniTest::Test

  def setup
    options = {
      "weekly_budget" => 200,
      "week_number" => 29
    }
    @budget_1 = Budget.new( options )
  end

  def test_weekly_budget
    assert_equal( 200, @budget_1.weekly_budget )
  end

end