require 'httparty'

module Clients
  class BooksServiceClient
    include HTTParty
    base_uri 'http://books-service.com'

    def get_book(id)
      title = JSON.parse(self.class.get("/books/#{id}").body)['title']

      Book.new(id, title)
    end

    def create_book(title)
      payload   = { 'title': title }.to_json
      response  = JSON.parse(self.class.post("/books", :body => payload).body)
      id        = response['id']
      title     = response['title']

      Book.new(id, title)
    end
  end
end
