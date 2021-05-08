require "rails_helper"

RSpec.feature "Event Tracker - Deleting Event - " do

    before do
        @event1 = Event.create(title: "James Hetfield's Birthday",                              details: "James was born...") 
    end
    
    scenario "A user deletes an event" do
        visit "/"
        click_link "Event Tracker"
        click_link "Events"
        click_link "#{@event1.title}"
        click_link "Delete Event"

        expect(page).to have_content("Event was successfully destroyed")
        expect(current_path).to eq(events_path) 
   end
end