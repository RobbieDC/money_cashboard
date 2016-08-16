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

  def total_spent()
    sql = "SELECT * FROM transactions WHERE merchant_id = #{@id}"
    transaction_data = SqlRunner.run(sql)
    merchant_transactions = transaction_data.map { |t| Transaction.new(t) }
    total = 0
    for transaction in merchant_transactions
      value = transaction.value()
      total += value
    end
    return total
  end

  def tags()
    sql = "SELECT tags.* FROM tags INNER JOIN transactions ON transactions.tag_id = tags.id WHERE transactions.merchant_id = #{@id};"
    tags_data = SqlRunner.run( sql )
    tags = tags_data.map { |tag| Tag.new( tag ) }
    unique_tags = tags.uniq()
    return unique_tags
  end

  def self.all()
    sql = "SELECT * FROM merchants;"
    merchants_data = SqlRunner.run( sql )
    merchants = merchants_data.map { |merchant| Merchant.new( merchant ) }
    return merchants
  end

  def self.find( id )
    sql = "SELECT * FROM merchants WHERE id = #{id};"
    merchant_data = SqlRunner.run( sql ).first
    merchant = Merchant.new( merchant_data )
    return merchant
  end

  def self.delete_all()
    sql = "DELETE FROM merchants;"
    SqlRunner.run( sql )
  end

end