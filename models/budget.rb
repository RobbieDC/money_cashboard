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

end