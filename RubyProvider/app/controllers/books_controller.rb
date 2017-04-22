require 'sinatra'
require 'json'

module Controllers
  class BooksController < Sinatra::Application

    get '/books/:id' do
      content_type :json

      {
        :title => 'A Fortune-Teller Told Me'
      }.to_json
    end
  end
end
