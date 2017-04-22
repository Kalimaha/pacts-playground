require 'spec_helper'
require 'pact/consumer/rspec'

Pact.configure do | config |
  config.doc_generator = :markdown
end

Pact.service_consumer 'Library App' do
  has_pact_with 'Books Service' do
    mock_service :books_service do
      port 1234
    end
  end
end
