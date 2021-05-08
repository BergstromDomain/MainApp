require "rails_helper"

RSpec.feature "Event Tracker - Creating An Event - " do
    scenario "A user creates a new event" do
        visit "/"
        click_link "Event Tracker"
        click_link "Events"
        click_link "New Event"

        fill_in "Title", with: "Niklas Bergstrom's Birthday"
        fill_in "Details", with: "Niklas was born in Stockholm on 17 February 1974"
        click_button "Create Event"

        expect(page).to have_content("Event was successfully created")

        expect(current_path).to eq(event_path(Event.last.id)) 
   end

    scenario "A user fails to create a new event" do
        visit "/"
        click_link "Event Tracker"
        click_link "Events"
        click_link "New Event"

        fill_in "Title", with: ""
        fill_in "Details", with: ""
        click_button "Create Event"

        expect(page).to have_content("1 error prohibited this event from being saved:")
        expect(page).to have_content("Title can't be blank")

        expect(current_path).to eq(events_path) 
   end
 end