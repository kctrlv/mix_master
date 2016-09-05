require 'rails_helper'

RSpec.feature "User edits a playlists" do
  scenario "they see the updated playlist" do
    # As a user
    # Given that a playlist and songs exist in the database
    playlist = create(:playlist_with_songs)
    first, second, third = playlist.songs
    new_song = create(:song, title: "Great Song")
    # When I visit that playlist's show page
    visit playlist_path(playlist)
    # And I click on "Edit"
    click_on "Edit"
    # And I enter a new playlist name
    fill_in "playlist_name", with: "Best Playlist"
    # And I select an additional song
    check("song-#{new_song.id}")
    # And I uncheck an existing song
    uncheck("song-#{first.id}")
    # And I click on "Update Playlist"
    click_on "Update Playlist"
    # Then I should see the playlist's updated name
    expect(page).to have_content "Best Playlist"
    # And I should see the name of the newly added song
    expect(page).to have_content "Great Song"
    # And I should not see the name of the removed song
    expect(page).to_not have_content first.title
  end
end
