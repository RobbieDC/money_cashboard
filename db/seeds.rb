require_relative( "../models/merchant" )
require_relative( "../models/transaction" )
require_relative( "../models/tag" )
require( "pry-byebug" )

Merchant.delete_all
Tag.delete_all

merchant_1 = Merchant.new( { "name" => "Black Isle Brewery" } )
merchant_2 = Merchant.new( { "name" => "Thai Tanic" } )
merchant_3 = Merchant.new( { "name" => "Moonies" } )
merchant_4 = Merchant.new( { "name" => "Lidl" } )
merchant_5 = Merchant.new( { "name" => "Safeway" } )
merchant_6 = Merchant.new( { "name" => "Peppers" } )
merchant_1.save()
merchant_2.save()
merchant_3.save()
merchant_4.save()
merchant_5.save()
merchant_6.save()

tag_1 = Tag.new( { "type" => "alcohol" } )
tag_2 = Tag.new( { "type" => "take-away" } )
tag_3 = Tag.new( { "type" => "groceries" } )
tag_1.save()
tag_2.save()
tag_3.save()

transaction_1 = Transaction.new( {
  "value" => 20, 
  "tag_id" => tag_1.id, 
  "merchant_id" => merchant_1.id
  } )
transaction_2 = Transaction.new( {
  "value" => 30,
  "tag_id" => tag_2.id,
  "merchant_id" => merchant_2.id
  } )
transaction_3 = Transaction.new( {
  "value" => 45,
  "tag_id" => tag_1.id,
  "merchant_id" => merchant_3.id
  } )
transaction_4 = Transaction.new( {
  "value" => 15,
  "tag_id" => tag_3.id,
  "merchant_id" => merchant_4.id
  } )
transaction_5 = Transaction.new( {
  "value" => 30,
  "tag_id" => tag_2.id,
  "merchant_id" => merchant_5.id
  } )
transaction_6 = Transaction.new( {
  "value" => 30,
  "tag_id" => tag_2.id,
  "merchant_id" => merchant_6.id
  } )
transaction_1.save()
transaction_2.save()
transaction_3.save()
transaction_4.save()
transaction_5.save()
transaction_6.save()

binding.pry
nil