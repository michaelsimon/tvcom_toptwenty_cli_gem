class TvcomTop20::Scraper

  def self.scrape_top20_shows(url)
    scraped_shows = []
    doc = Nokogiri::HTML(open(url))
    shows = doc.css(".show")
    shows.each do |show|
      begin 
        show_hash = {
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

  def self.scape_show_detail(url)
    doc = Nokogiri::HTML(open(url))
    show = {
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
        :number => episode.css(".nums").text.strip.gsub(/\s+/, ""),
        :title => episode.css(".title").text.strip,
        :date => episode.css(".date").text.strip,
      }

      show[:recent_episodes] << episode_hash
    end

    actors = doc.css(".person")
    actors.each do |actor|
      actor_hash = {
        :name => actor.css(".first_norole .name").text.strip,
        :role => actor.css(".last_norole .role").text.strip
      }
      show[:cast_members] << actor_hash
    end
  end

  def self.scrape_categories(url)
  end

end