require 'pact/provider/rspec'
require './spec/service_consumers/library_app_spec'

Pact.service_provider 'Books Service' do
  honours_pact_with 'Library App' do
    pact_uri URI.encode('http://localhost:8080/pacts/provider/Books%20Service/consumer/Library%20App/latest')
  end
end
