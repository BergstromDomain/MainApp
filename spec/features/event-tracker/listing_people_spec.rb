require "rails_helper"

RSpec.feature "Event Tracker - Listing People - " do
    
    before do
        @person1 = Person.create(first_name: "James",
                                  last_name: "Hetfield") 
        @person2 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end
    
    scenario "A user lists all persons" do
        visit "/"
        click_link "Event Tracker"

        expect(page).to have_content(@person1.first_name)
        expect(page).to have_content(@person1.last_name)
        expect(page).to have_link("#{@person1.first_name} #{@person1.last_name}")

        expect(page).to have_content(@person2.first_name)
        expect(page).to have_content(@person2.last_name)
        expect(page).to have_link("#{@person2.first_name} #{@person2.last_name}")
   end
end