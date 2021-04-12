require "rails_helper"

RSpec.feature "Event Tracker - Creating Person - " do
    scenario "A user creates a new person" do
        visit "/"
        click_link "Event Tracker"
        click_link "New Person"

        fill_in "First name", with: "James"
        fill_in "Last name", with: " Hetfield"
        click_button "Create Person"

        expect(page).to have_content("Person was successfully created")
        expect(page).to have_link("Home")
   end
end