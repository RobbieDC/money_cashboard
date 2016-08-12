require_relative( "../models/merchant" )
require_relative( "../models/transaction" )
require( "pry-byebug" )

merchant_1 = Merchant.new( { "name" => "Black Isle Brewery" } )
merchant_2 = Merchant.new( { "name" => "Thai Tanic" } )
merchant_1.save()
merchant_2.save()

binding.pry
nil