require_relative( "../models/merchant" )
require_relative( "../models/transaction" )
require( "pry-byebug" )

Merchant.delete_all

merchant_1 = Merchant.new( { "name" => "Black Isle Brewery" } )
merchant_2 = Merchant.new( { "name" => "Thai Tanic" } )
merchant_1.save()
merchant_2.save()

transaction_1 = Transaction.new( {
  "value" => 20, 
  "tag" => "alcohol", 
  "merchant_id" => merchant_1.id
  } )
transaction_2 = Transaction.new( {
  "value" => 30,
  "tag" => "food",
  "merchant_id" => merchant_2.id
  } )
transaction_1.save()
transaction_2.save()

binding.pry
nil