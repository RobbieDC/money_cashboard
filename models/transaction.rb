require( "pg" )
require_relative( "../db/sql_runner" )

class Transaction

  attr_reader( :id, :value, :tag, :merchant_id )

  def initialize( options )
    @id = options["id"].to_i
    @value = options["value"].to_i
    @tag = options["tag"]
    @merchant_id = options["merchant_id"].to_i
  end

  def save()
    sql = "INSERT INTO transactions ( value, tag, merchant_id ) 
      VALUES ( #{ @value }, '#{ @tag }', #{ @merchant_id } )
      RETURNING *;"
    transaction = SqlRunner.run( sql ).first
    @id = transaction["id"]
  end

end