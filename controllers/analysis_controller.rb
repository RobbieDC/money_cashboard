require_relative(../models/analysis)

# index
get "/analysis" do
  @transactions_per_week = Analysis.group_transactions_by_week()
  erb( :"analysis/index" )
end

# # index
# get "/merchants" do
#   @merchants = Merchant.all()
#   erb( :"merchants/index" )
# end