# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'nokogiri'
require 'open-uri'

Episode.destroy_all

# URL to scrape
url = 'https://www.imdb.com/title/tt0877057/episodes/'
html_content = URI.open(url, 'Accept-Language' => 'en', "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read

# Open the URL and parse the HTML
doc = Nokogiri::HTML(html_content)
episode_divs = doc.css('div .sc-ccd6e31b-1.ggXjkj')
# Extract book titles
episode_divs.each do |div|
  season = ""
  episode = ""
  title = ""
  pattern = /S(\d+)\.E(\d+) ∙ (.+)/
  if div.css('div .ipc-title__text').text.match(pattern)
    season = $1.to_i
    episode = $2.to_i
    title = $3

    puts "Season: #{season}, Episode: #{episode}, Title: #{title}"
  else
    puts "Pattern did not match."
  end
  summary = div.css('div .ipc-html-content-inner-div').text
  rating = div.css('span .ipc-rating-star--rating').text.to_f
  picture = div.at('div .ipc-media img')['src']

  Episode.create(title: title, summary: summary, rating: rating, picture: picture, episode_number: episode, season: season)

end

puts "There is now #{Episode.count} rows in the table."
