Pact.provider_states_for 'Library App' do
  provider_state 'a book exists' do
    set_up do
      # Insert a book in the DB, if you have one... :)
    end
  end

  provider_state 'it is possible to create new books' do
    set_up do
      # Setup for authentication and authorization
    end
  end
end
