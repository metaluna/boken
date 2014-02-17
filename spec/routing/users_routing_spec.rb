require 'spec_helper'

describe 'routes for users' do
  
  it 'routes to /users/sign_in' do
    expect(get: "/users/sign_in").to route_to("devise/sessions#new")
  end
  it 'routes to /users/sign_out' do
    expect(get: "/users/sign_out").to route_to("devise/sessions#destroy")
  end
  it 'routes to /users/sign_up' do
    expect(get: "/users/sign_up").to route_to("devise/registrations#new")
  end
  
end