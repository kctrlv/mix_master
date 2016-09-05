require 'rails_helper'

RSpec.feature "User edits an artists" do
  scenario "they see updated name with existing artist image" do
    # As a user
    # Given that an artist exists in the database
    artist = Artist.create(name: "Coolio", image_path: "http://i.imgur.com/WMaRmMA.jpg")
    # When I visit that artist's show page
    visit artist_path(artist)
    # And I click on "Edit"
    click_on "Edit"
    # And I fill in a new name
    fill_in "artist_name", with: "cool.io"
    # And I click on "Update Artist"
    click_on "Update Artist"
    # Then I should see the artist's updated name
    expect(page).to have_content "cool.io"
    # Then I should see the existing image
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
