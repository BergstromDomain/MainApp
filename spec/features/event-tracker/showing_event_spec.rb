require "rails_helper"

RSpec.feature "Event Tracker - Showing An Event - " do
    
    before do
        @event1 = Event.create(title: "James Hetfield's Birthday",
                              details: "James was born...") 
    end
    
    scenario "A user shows an event" do
        visit "/"
        click_link "Event Tracker"
        click_link "Events"
        click_link "#{@event1.title}"

        expect(page).to have_content(@event1.title)
        expect(page).to have_content(@event1.details)

        expect(page).to have_link("Edit Event")
        expect(page).to have_link("Back")
        expect(page).to have_link("Home")

        expect(current_path).to eq(event_path(@event1))
   end
end