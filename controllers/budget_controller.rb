require_relative( "../models/budget" )

# new
get "/budget/new" do
  erb( :"budget/new" )
end

# create
post "/budget" do
  @budget = Budget.new( params )
  @budget.save()
  erb( :"budget/create" )
end