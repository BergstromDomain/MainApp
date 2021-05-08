require "rails_helper"

RSpec.feature "Event Tracker - Showing A Person - " do
    
    before do
        @person1 = Person.create(first_name: "James",
                                  last_name: "Hetfield") 
    end
    
    scenario "A user shows a person" do
        visit "/"
        click_link "Event Tracker"
        click_link "People"
        click_link "#{@person1.first_name} #{@person1.last_name}"

        expect(page).to have_content(@person1.first_name)
        expect(page).to have_content(@person1.last_name)

        expect(page).to have_link("Edit Person")
        expect(page).to have_link("Back")
        expect(page).to have_link("Home")

        expect(current_path).to eq(person_path(@person1))
   end
end