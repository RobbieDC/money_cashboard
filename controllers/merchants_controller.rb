require_relative( "../models/merchant" )

# 7 RESTful routes [ new, create, index, show, edit, update, destroy ]

# new
get "/merchants/new" do
  erb( :"merchants/new" )
end

# index
get "/merchants" do
  @merchants = Merchant.all()
  erb( :"merchants/index" )
end

# create
post "/merchants" do
  @merchant = Merchant.new( params )
  @merchant.save()
  erb( :"merchants/create" )
end

# show
get "/merchants/:id" do
  # return "show - merchant by id"
  @merchant = Merchant.find( params["id"] )
  erb(:"merchants/show")
end