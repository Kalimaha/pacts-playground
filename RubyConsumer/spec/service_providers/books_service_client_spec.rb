require 'pact_helper'

RSpec.describe Clients::BooksServiceClient, :pact => true do
  before do
    Clients::BooksServiceClient.base_uri 'localhost:1234'
  end

  subject(:client)  { Clients::BooksServiceClient.new }

  let(:book_id)         { 1 }
  let(:new_book_id)     { '02e88370-25e5-4b71-a633-6aff702b6a86' }
  let(:book_title)      { 'A Fortune-Teller Told Me' }
  let(:new_book_title)  { 'Alice\'s Adventures in Wonderland' }

  describe 'get_book' do
    before do
      books_service.given('a book exists').
      upon_receiving('a request for a book').
      with(
        method: :get,
        path:   '/books/1',
        query:  ''
      ).
      will_respond_with(
        status:   200,
        headers:  { 'Content-Type' => 'application/json' },
        body:     { id: 1, title: book_title }
      )
    end

    it 'returns a book' do
      expect(client.get_book(book_id).title).to eq(book_title)
    end
  end

  describe 'create_book' do
    before do
      books_service.given('it is possible to create new books').
      upon_receiving('a request to create a new book').
      with(
        method: :post,
        path:   '/books/',
        body:   { :title => new_book_title }.to_json
      ).
      will_respond_with(
        status:   200,
        headers:  { 'Content-Type' => 'application/json' },
        body:     { id: Pact::SomethingLike.new(new_book_id), title: new_book_title }
      )
    end

    it 'returns a book' do
      expect(client.create_book(new_book_title).id).to eq(new_book_id)
    end
  end
end
