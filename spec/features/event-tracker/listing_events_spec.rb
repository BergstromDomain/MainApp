require "rails_helper"

RSpec.feature "Event Tracker - Listing Events - " do
    
    before do
        @event1 = Event.create(title: "James Hetfield's Birthday",
                              details: "James was born...", 
                              day: "3",
                              month: "8",
                              year: "1963")
        @event2 = Event.create(title: "Lars Ulrich's Birthday",
                              details: "Lars was born...",
                              day: "26",
                              month: "12",
                              year: "1963")
    end
    
    scenario "A user lists all events" do
        visit "/"
        click_link "Event Tracker"
        click_link "Events"

        expect(page).to have_content(@event1.title)
        expect(page).to have_link(@event1.title)
        expect(page).to have_content("#{@event1.day}-#{@event1.month}-#{@event1.year}")

        expect(page).to have_content(@event2.title)
        expect(page).to have_link(@event2.title)
        expect(page).to have_content("#{@event2.day}-#{@event2.month}-#{@event2.year}")
   end
end