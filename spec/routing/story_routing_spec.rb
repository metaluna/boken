require 'spec_helper'

describe 'routes for stories' do
  
  it 'routes to story#play' do
    expect(get: "/stories/1/play").to route_to("stories#play", id: "1")
  end
  
end