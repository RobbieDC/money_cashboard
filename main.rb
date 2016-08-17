require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry-byebug" )

require_relative( "controllers/merchants_controller" )
require_relative( "controllers/transactions_controller" )
require_relative( "controllers/tags_controller" )
require_relative( "controllers/analysis_controller" )

get "/" do
  erb( :home )
end