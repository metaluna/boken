require "spec_helper"

describe "routes for the application" do
  it "routes per default to stories#index" do
    expect(get: "/").to route_to("stories#index")
  end
end