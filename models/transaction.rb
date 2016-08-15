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

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = #{@merchant_id}"
    merchant_data = SqlRunner.run( sql ).first
    merchant = Merchant.new( merchant_data )
    return merchant
  end

  def member()
    sql = "SELECT * FROM members WHERE id = #{@member_id}"
    return Member.map_item(sql)
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