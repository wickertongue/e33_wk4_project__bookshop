require('pry')
require('sinatra')
require('sinatra/contrib/all')
also_reload('../models/*')

require_relative('../models/book.rb')
require_relative('../models/author.rb')
require_relative('../models/inventory.rb')
require_relative('../models/books_authors_junction.rb')

get '/inventory/?' do
  @books_authors_junction = BookAuthorJunction.all()
  @inventory = Inventory.all()
  @authors = Author.all()
  @books = Book.all()
  erb(:index)
end

get '/inventory/new_item' do
  @inventory = Inventory.all()
  @books = Book.all()
  @authors = Author.all()
  erb(:"inventory/new")
end

post '/inventory/submitted_item' do
  Inventory.new(params).save
  redirect to '/inventory'
end

get '/inventory/:id' do
  @inventory = Inventory.find(params['id'].to_i)
  @book = Book.find(@inventory.book_id)
  erb(:show)
end

get '/inventory/:id/edit' do
  @inventory = Inventory.find(params['id'].to_i)
  @book = Book.find(@inventory.book_id)
  @books = Book.all()
  @authors = Author.all()
  erb(:"inventory/edit")
end
