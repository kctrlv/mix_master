require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see list of artist names and links to their page" do
    artists = %w(Adam Bob Chris).map do |artist_name|
      Artist.create(name: artist_name, image_path: 'http://theillixer.com/wp-content/uploads/2014/11/beta14-phase1-nominees-16x9-BestNewArtist.png')
    end
    visit '/artists'

    artists.each do |artist|
      expect(page).to have_link artist.name, href: artist_path(artist)
    end
  end
end
