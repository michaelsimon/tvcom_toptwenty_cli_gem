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
    # show_1 = self.new
    # show_1.name = "Game of Thrones"
    # show_1.channel = "HBO"
    # show_1.url = "http://www.tv.com/shows/game-of-thrones/"

    # show_2 = self.new
    # show_2.name = "Arrow"
    # show_2.channel = "The CW"
    # show_2.url = "http://www.tv.com/shows/arrow/"

    # show_3 = self.new
    # show_3.name = "Shield"
    # show_3.channel = "ABC"
    # show_3.url = "http://www.tv.com/shows/marvels-agents-of-shield/"
    

    #go to tv.com, find the shows
    #extract the properties
    #instantiate a show
    shows = []

    shows << self.scrape_show
    
  end

  def self.scrape_show
      doc = Nokogiri::HTML(open("http://tv.com/shows"))

      show = show.new
      show.element = doc.search
  end

end