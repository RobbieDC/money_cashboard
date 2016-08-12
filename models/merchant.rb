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

  def self.all()
    sql = "SELECT * FROM merchants;"
    merchants_data = SqlRunner.run( sql )
    merchants = merchants_data.map { |merchant| Merchant.new( merchant ) }
    return merchants
  end

  def self.delete_all()
    sql = "DELETE FROM merchants;"
    SqlRunner.run( sql )
  end

end