class TvcomTopTwenty::Scraper

  def self.scrape_toptwenty_shows(url)
    scraped_shows = []
    doc = Nokogiri::HTML(open(url))
    shows = doc.css(".show")
    shows.each do |show|
      begin 
        show_hash = {
          :rank => show.css(".num").text,
          :name => show.css(".info h4 a").text,
          :channel => show.css(".airtime").text,
          :url => show.css(".info h4 a").attribute("href").value
        } 
        scraped_shows << show_hash
      rescue
        next
      end
    end
    scraped_shows
  end

  def self.scape_show_detail(url, show_id)
    doc = Nokogiri::HTML(open(url))
    show_detail = {
      :name => doc.css(".show_head h1").text,
      :premiere_date => doc.css(".show_head .tagline").text.split('  ')[1],
      :time_channel => doc.css(".show_head .tagline").text.split('  ')[0],
      :user_rating => doc.css(".score").text, 
      :num_votes => doc.css(".votes").text,
      :show_summary => doc.css(".description").text.strip,
      :recent_episodes => [],
      :cast_members => []
    }

    episodes = doc.css(".episodes .episode")
    episodes.each do |episode|
      episode_hash = {
        :ep_number => episode.css(".nums").text.strip.gsub(/\s+/, ""),
        :ep_title => episode.css(".title").text.strip.gsub(/\r+\n+\t+/,"").gsub(/(NEXT EPISODE)/,""),
        :ep_date => episode.css(".date").text.strip,
      }
      show_detail[:recent_episodes] << episode_hash
    end

    actors = doc.css(".person")
    actors.each do |actor|
      actor_hash = {
        :actor_name => actor.css(".first_norole .name").text.strip,
        :actor_role => actor.css(".last_norole .role").text.strip
      }
      show_detail[:cast_members] << actor_hash
    end
    TvcomTopTwenty::Show.add_show_details(show_detail, show_id)
  end
end