require( "pg" )
require_relative( "../db/sql_runner" )

class Transaction

  attr_reader( :id, :value, :merchant_id, :tag_id )

  def initialize( options )
    @id = options["id"].to_i
    @value = options["value"].to_i
    @merchant_id = options["merchant_id"].to_i
    @tag_id = options["tag_id"].to_i
  end

  def save()
    sql = "INSERT INTO transactions ( value, merchant_id, tag_id ) 
      VALUES ( #{ @value }, #{ @merchant_id }, #{ @tag_id } )
      RETURNING *;"
    transaction = SqlRunner.run( sql ).first
    @id = transaction["id"]
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = #{@merchant_id};"
    merchant_data = SqlRunner.run( sql ).first
    merchant = Merchant.new( merchant_data )
    return merchant
  end

  def tag()
    sql = "SELECT * FROM tags WHERE id = #{@tag_id};"
    tag_data = SqlRunner.run( sql ).first
    tag = Tag.new( tag_data )
    return tag
  end

  def self.total_spend()
    transactions = Transaction.all()
    total = 0
    for transaction in transactions
      value = transaction.value()
      total += value
    end
    return total
  end

  def self.all()
    sql = "SELECT * FROM transactions;"
    transactions_data = SqlRunner.run( sql )
    transactions = transactions_data.map { |t| Transaction.new(t) }
    return transactions
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id};"
    transaction_data = SqlRunner.run( sql ).first
    transaction = Transaction.new( transaction_data )
    return transaction
  end

end