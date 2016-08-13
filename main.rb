require( "sinatra" )
require( "sinatra/contrib/all" )
# require_relative( "controllers/merchants_controller" )
# require_relative( "controllers/transactions_controller" )
# require_relative( "controllers/tags_controller" ) # should this exist?

get "/" do
  # return "and so it begins"
  erb( :home )
end