require "rails_helper"

RSpec.feature "Event Tracker - Editing A Person - " do
    before do
        @person1 = Person.create(first_name: "James",
                                  last_name: "Hetfield") 
    end    
    
    scenario "A user updates a person" do
        visit "/"
        click_link "Event Tracker"
        click_link "#{@person1.first_name} #{@person1.last_name}"
        click_link "Edit Person"

        fill_in "First name", with: "Kirk"
        fill_in "Last name", with: " Hammet"
        click_button "Update Person"

        expect(page).to have_content("Person was successfully updated")
   end

    scenario "A user failed to update a person" do
        visit "/"
        click_link "Event Tracker"
        click_link "#{@person1.first_name} #{@person1.last_name}"
        click_link "Edit Person"

        fill_in "First name", with: ""
        fill_in "Last name", with: " "
        click_button "Update Person"

        expect(page).to have_content("2 errors prohibited this person from being saved:")
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")
   end
end