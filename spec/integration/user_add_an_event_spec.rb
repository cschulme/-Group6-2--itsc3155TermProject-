require 'rails_helper.rb'

feature "User adds an event" do

    scenario "User successfully navigates to the New Event from the Your Events page" do
        visit events_path
        expect(page).to have_content("Your Events")
        click_link "New Event"
        expect(page).to have_content("Add New Event")
        expect(page).to have_field("event[title]")
	    expect(page).to have_field("event[location]")
        expect(page).to have_field("event[eventInformation]")
        expect(page).to have_select("event[eventDate(2i)]")
        expect(page).to have_select("event[eventDate(3i)]")
        expect(page).to have_select("event[eventDate(1i)]")
        expect(page).to have_select("event[startTime(4i)]")
        expect(page).to have_select("event[startTime(5i)]")
        expect(page).to have_select("event[endTime(4i)]")
        expect(page).to have_select("event[endTime(5i)]")
        expect(page).to have_select("event[tag_id]")
    end
   
    scenario "User successfully creates a new event with associated tag" do
        # Create the tag.
        visit new_tag_path
        fill_in "tag[tagName]", with:  "Test"
    	fill_in "tag[description]", with: "Capybara tag"
    	click_button "Create Tag"
    	
    	# Create the event associated to the tag.
	    visit new_event_path
    	expect(page).to have_content("Add New Event")
	    fill_in "event[title]", with: "New Capybara Event"
    	fill_in "event[location]", with: "Charlotte"
    	fill_in "event[eventInformation]", with: "This is a new Capybara event"
    	select "April", :from => "event[eventDate(2i)]"
    	select "1", :from => "event[eventDate(3i)]"
    	select "2018", :from => "event[eventDate(1i)]"
    	select "01 PM", :from => "event[startTime(4i)]"
    	select "00", :from => "event[startTime(5i)]"
    	select "02 PM", :from => "event[endTime(4i)]"
    	select "00", :from => "event[endTime(5i)]"
    	select "Test", :from => "event[tag_id]"
    	click_button "Create Event"
    	expect(page).to have_content("New Capybara Event")
    end

end

feature "User deletes an event" do
    scenario "User successfully navigates to the Your Events page from the Your Calendar page" do
        visit events_path
        expect(page).to have_content ("Your Events")
    end
    
    scenario "User successfully deletes their event" do
        # Create the tag.
        visit new_tag_path
        fill_in "tag[tagName]", with:  "Test"
    	fill_in "tag[description]", with: "Capybara tag"
    	click_button "Create Tag"
    	
    	# Create the event associated to that tag.
	    visit new_event_path
    	expect(page).to have_content("Add New Event")
	    fill_in "event[title]", with: "New Capybara Event"
    	fill_in "event[location]", with: "Charlotte"
    	fill_in "event[eventInformation]", with: "This is a new Capybara event"
    	select "April", :from => "event[eventDate(2i)]"
    	select "1", :from => "event[eventDate(3i)]"
    	select "2018", :from => "event[eventDate(1i)]"
    	select "01 PM", :from => "event[startTime(4i)]"
    	select "00", :from => "event[startTime(5i)]"
    	select "02 PM", :from => "event[endTime(4i)]"
    	select "00", :from => "event[endTime(5i)]"
    	select "Test", :from => "event[tag_id]"
    	click_button "Create Event"
    	expect(page).to have_content("New Capybara Event")
    	
    	# Delete that event.
        visit events_path
        click_link "Delete Event"
        expect(page).to have_content ("Your Events")
    end
end

feature "User creates a new tag" do

    scenario "User successfully navigates to the Add New Tag page from the Your Tags page" do
        visit tags_path
        expect(page).to have_content("Your Tags")
        click_link "New Tag"
        expect(page).to have_content("Add New Tag")
        expect(page).to have_field("tag[tagName]")
	    expect(page).to have_field("tag[description]")
    end
   
    scenario "User successfully creates a new tag" do
	    visit new_tag_path
    	expect(page).to have_content("Add New Tag")
	    fill_in "tag[tagName]", with:  "Test"
    	fill_in "tag[description]", with: "Capybara tag"
    	click_button "Create Tag"
    	expect(page).to have_content("Test")
    end

end
