RSpec.feature "User deletes an artist" do
  scenario "they return to artist index page and don't see deleted artist" do

    # As a user
    # Given that an artist exists in the database
    artist = Artist.create(name: "Coolio", image_path: "http://i.imgur.com/WMaRmMA.jpg")
    # When I visit that artist's show page
    visit artist_path(artist)
    # And I click on "Delete"
    click_on "Delete"
    # Then I should be back on the artist index page
    expect(page).to have_content "All Artists"
    # Then I should not see the artist's name
    expect(page).not_to have_content "Coolio"
  end
end
