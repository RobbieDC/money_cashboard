require_relative( "../models/merchant" )

# 7 RESTful routes [ new, create, index, show, edit, update, destroy ]

# index
get "/merchants" do
  @merchants = Merchant.all()
  erb( :"merchants/index" )
end

# show
get "/merchants/:id" do
  # return "show - merchant by id"
  @merchant = Merchant.find( params["id"] )
  erb(:"merchants/show")
end