require('pry')

require_relative('../main.rb')
require_relative('../models/book.rb')
require_relative('../models/author.rb')
also_reload('../models/*')

get '/inventory/?' do
  @books = Book.all()
  @authors = Author.all()
  erb(:index)
end

get '/inventory/new' do
  erb(:new)
end
