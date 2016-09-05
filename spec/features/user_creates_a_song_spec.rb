require 'rails_helper'

RSpec.feature "User creates a song" do
  scenario "they see the page for the song" do
    # As a user
    # Given that artists exist in the database
    artist = create(:artist)
    # When I visit the artist songs index
    visit artist_path(artist)
    # And I click "New song"
    click_on "New song"
    # And I fill in the title
    fill_in "song_title", with: "One Love"
    # And I click "Create Song"
    click_on "Create Song"
    # Then I should see the song name
    expect(page).to have_content "One Love"
    # And I should see a link to the song artist's individual page
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
