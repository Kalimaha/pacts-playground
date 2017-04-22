require 'sinatra/base'
require 'controllers/books_controller'

module BooksService
  class App < Sinatra::Application
    use Controllers::BooksController
  end
end
