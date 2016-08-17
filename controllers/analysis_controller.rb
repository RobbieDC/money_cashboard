require_relative( "../models/analysis" )

# index
get "/analysis" do
  options = {
    "merchants" => Merchant.all(),
    "tags" => Tag.all(),
    "transactions" => Transaction.all(),
    "budget" => Budget.all()
  }
  @analysis = Analysis.new( options )
  @transactions_per_week = @analysis.group_transactions_by_week()
  @spent_per_week = @analysis.total_spent_per_week()
  @budget_hash = @analysis.create_budget_hash()
  erb( :"analysis/index" )
end