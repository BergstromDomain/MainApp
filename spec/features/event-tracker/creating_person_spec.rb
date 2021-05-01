require "rails_helper"

RSpec.feature "Event Tracker - Creating A Person - " do
    scenario "A user creates a new person" do
        visit "/"
        click_link "Event Tracker"
        click_link "New Person"

        fill_in "First name", with: "James"
        fill_in "Last name", with: "Hetfield"
        click_button "Create Person"

        expect(page).to have_content("Person was successfully created")

        expect(current_path).to eq(person_path(Person.last.id)) 
   end

    scenario "A user fails to create a new person" do
        visit "/"
        click_link "Event Tracker"
        click_link "New Person"

        fill_in "First name", with: ""
        fill_in "Last name", with: ""
        click_button "Create Person"

        expect(page).to have_content("2 errors prohibited this person from being saved:")
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")

        expect(current_path).to eq(people_path) 
   end
 end