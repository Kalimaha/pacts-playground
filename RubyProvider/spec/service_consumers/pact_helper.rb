require 'pact/provider/rspec'
require './spec/service_consumers/library_app_spec'

Pact.service_provider 'Books Service' do
  honours_pact_with 'Library App' do
    pact_uri '/Users/kalimaha/Desktop/pacts-playground/RubyConsumer/spec/pacts/library_app-books_service.json'
  end
end
