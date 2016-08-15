require_relative( "../models/tag" )

# 7 RESTful routes [ new, create, index, show, edit, update, destroy ]

# new
get "/tags/new" do
  erb( :"tags/new" )
end

# index
get "/tags" do
  @tag = Tag.all()
  erb( :"tags/index" )
end

# # create
# post "/tags" do
#   @tag = Tag.new( params )
#   @tag.save()
#   erb( :"tags/create" )
# end

# # show
# get "/merchants/:id" do
#   # return "show - merchant by id"
#   @merchant = Merchant.find( params["id"] )
#   erb(:"merchants/show")
# end