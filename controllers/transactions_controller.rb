require_relative( "../models/transaction" )

# 7 RESTful routes [ new, create, index, show, edit, update, destroy ]

# new
get "/transactions/new" do
  @merchants = Merchant.all()
  erb( :"transactions/new" )
end

# create
post "/transactions" do
  @transaction = Transaction.new( params )
  @transaction.save()
  erb(:"transactions/create")
end

# index
get "/transactions" do
  @transactions = Transaction.all()
  erb( :"transactions/index" )
end