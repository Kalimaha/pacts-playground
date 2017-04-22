require 'httparty'

module Clients
  class BooksServiceClient
    include HTTParty
    base_uri 'http://books-service.com'

    def get_book(id)
      title = JSON.parse(self.class.get("/books/#{id}").body)['title']

      Book.new(title)
    end
  end
end
