require( "pg" )
require_relative( "../db/sql_runner" )

class Budget

  attr_reader( :weekly_budget, :week_number )

  def initialize( options )
    @weekly_budget = options["weekly_budget"].to_i
    @week_number = options["week_number"].to_i
  end

  def save()
    sql = "INSERT INTO budget (weekly_budget, week_number) VALUES ( #{@weekly_budget}, #{@week_number} ) RETURNING *;"
    new_budget = SqlRunner.run( sql ).first
    @id = new_budget["id"]
  end

  def self.all()
    sql = "SELECT * FROM budget;"
    budget_data = SqlRunner.run( sql )
    budgets = budget_data.map { |budget| Budget.new( budget ) }
    return budgets
  end

  def self.delete_all()
    sql = "DELETE FROM budget;"
    SqlRunner.run( sql )
  end

end