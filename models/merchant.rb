require( "pg" )
require_relative( "../db/sql_runner" )

class Merchant

  attr_reader( :id, :name )

  def initialize( options )
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING *;"
    merchant = SqlRunner.run( sql ).first
    @id = merchant["id"]
  end

end