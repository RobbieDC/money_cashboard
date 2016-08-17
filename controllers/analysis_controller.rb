require_relative( "../models/analysis" )

# index
get "/analysis" do
  options = {
    "merchants" => Merchant.all(),
    "tags" => Tag.all(),
    "transactions" => Transaction.all()
  }
  @analysis = Analysis.new( options )
  @transactions_per_week = @analysis.group_transactions_by_week()
  @spent_per_week = @analysis.total_spent_per_week()
  erb( :"analysis/index" )
end