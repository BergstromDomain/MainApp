require "rails_helper"

RSpec.feature "Event Tracker - Deleting Person - " do
    before do
        @person1 = Person.create(first_name: "James",
                                  last_name: "Hetfield") 
    end    
    
    scenario "A user deletes a person" do
        visit "/"
        click_link "Event Tracker"
        click_link "#{@person1.first_name} #{@person1.last_name}"
        click_link "Delete Person"

        expect(page).to have_content("Person was successfully destroyed")
        expect(current_path).to eq(people_path) 
   end
end