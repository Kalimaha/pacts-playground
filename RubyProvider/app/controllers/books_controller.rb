require 'json'
require 'sinatra'
require 'securerandom'

module Controllers
  class BooksController < Sinatra::Application
    get '/books/:id' do
      content_type :json

      {
        :id     => params[:id].to_i,
        :title  => 'A Fortune-Teller Told Me'
      }.to_json
    end

    post '/books' do
      content_type :json

      {
        :id     => SecureRandom.uuid,
        :title  => JSON.parse(request.body.read)['title']
      }.to_json
    end
  end
end
