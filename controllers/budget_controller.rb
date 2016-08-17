require_relative( "../models/budget" )

# new
get "/budget/new" do
  erb( :"budget/new" )
end

# # new
# get "/tags/new" do
#   erb( :"tags/new" )
# end

# # create
# post "/tags" do
#   @tag = Tag.new( params )
#   @tag.save()
#   erb( :"tags/create" )
# end