require 'rails_helper'



describe "user" do
  scenario "visits visits destination" do
    it "can see destination and its forecast" do

    destination = Destination.create(name: "Denver", zip: "80203", description: "city by the sea",image_url: "https://placehold.it/300x300.png/000")

    visit "/"

    click_on "#{destination.name}"

    expect(current_path).to eq("/destination/#{destination.id}")

    expect(page).to have_content(destination.name)
    expect(page).to have_content(destination.zip)

    #expect forecast

    end
  end
end








#As a user
#When I visit "/"
#And I click on a destination
#Then I should be on page "/destinations/:id"
#Then I should see the destination's name, zipcode, description, and 10 day weather forecast
#The weather forecast is specific to the destination whose page I'm on
#The forecast should include date (weekday, month and day), high and low temps (F), and weather conditions
