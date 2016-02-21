class TvcomTop20::Show
  attr_accessor :name, :channel, :url

  def self.all
    # here doc
    # puts <<-DOC 
    # 1. Game of Thrones
    # 2. Arrow
    # 3. Shield
    # DOC

    #scrape tv.com and return deals based on that data
    self.scrape_shows

  end

  def self.scrape_shows
    shows = []
    shows << self.scrape_show
    
  end

  def self.scrape_show
      doc = Nokogiri::HTML(open("http://tv.com/shows"))

      show = show.new
      show.element = doc.search
  end

end