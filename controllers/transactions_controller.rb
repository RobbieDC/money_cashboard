require_relative( "../models/transaction" )

# 7 RESTful routes [ new, create, index, show, edit, update, destroy ]

# new
get "/transactions" do
  erb( :"transactions/new" )
end

# #index
# get '/books' do
#   @books = Book.all
#   erb(:'books/index')
# end

# #new
# get '/books/new' do
#   erb(:'books/new')
# end

# #show
# get '/books/:id' do
#   @book = Book.find(params['id'])
#   erb(:'books/show')
# end

# #edit
# get '/books/:id/edit' do
# end

# #create
# post '/books' do
#   @book = Book.new(params)
#   @book.save
#   redirect to( "books" )
# end

# #update
# post '/books/:id' do
# end

# #delete
# delete '/books' do
# end