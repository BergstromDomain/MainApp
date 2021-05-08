require "rails_helper"

RSpec.feature "Event Tracker - Editing An Event - " do

    before do
        @event1 = Event.create(title: "James Hetfield's Birthday",                              details: "James was born...") 
    end
    
    scenario "A user updates an event" do
        visit "/"
        click_link "Event Tracker"
        click_link "Events"
        click_link "#{@event1.title}"
        click_link "Edit Event"

        fill_in "Title", with: "Kirk Hammet's Birthday"
        fill_in "Details", with: "Kirk was born..."
        click_button "Update Event"

        expect(page).to have_content("Event was successfully updated")
   end

    scenario "A user failed to update an event" do
        visit "/"
        click_link "Event Tracker"
        click_link "Events"
        click_link "#{@event1.title}"
        click_link "Edit Event"

        fill_in "Title", with: ""
        fill_in "Details", with: ""
        click_button "Update Event"

        expect(page).to have_content("1 error prohibited this event from being saved:")
        expect(page).to have_content("Title can't be blank")
   end
end