require 'pact_helper'

RSpec.describe Clients::BooksServiceClient, :pact => true do
  before do
    Clients::BooksServiceClient.base_uri 'localhost:1234'
  end

  subject(:client)  { Clients::BooksServiceClient.new }

  let(:book_id)     { 1 }
  let(:book_title)  { 'A Fortune-Teller Told Me' }
  let(:book_path)   { "/books/#{book_id}" }

  describe 'get_book' do
    before do
      books_service.given('a book exists').
        upon_receiving('a request for a book').
        with(
          method: :get,
          path:   book_path,
          query:  ''
        ).
        will_respond_with(
          status:   200,
          headers:  { 'Content-Type' => 'application/json' },
          body:     { title: book_title }
        )
    end

    it 'returns a book' do
      expect(client.get_book(book_id).title).to eq(book_title)
    end
  end
end
