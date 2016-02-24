class TvcomTop20::CLI

  BASE_URL = "http://www.tv.com/"

  def call
    puts "-"*40
    puts "Welcome to TV.com Top 20 Shows!"
    puts "-"*40
    puts "Here Are The Current Top 20 Shows (as ranked)"
    list_shows
    get_shows_detail
    menu
    goodbye
  end

  def list_shows
    shows_array = TvcomTop20::Scraper.scrape_top20_shows(BASE_URL+"/shows/")
    # binding.pry
    TvcomTop20::Show.create_basic_shows(shows_array) if Show.all.empty?
    # TvcomTop20::Show.all.each |show| do
    #   puts "\s\s\s#{show[:rank]}. #{show[:name]} on #{show[:channel]}"
    # end
  end

  def get_shows_detail
    detail_array = TvcomTop20::Show.all.each do |show|
      details = TvcomTop20::Scraper.scape_show_detail(BASE_URL+show.url)
      show.add_show_details(details)
    end
  end

  def menu
    input = nil   
    while input != "exit"
      puts "\nEnter the ranking number of the show you'd like more info on" 
      print "OR type \"list\" to see the list again OR type exit to close: "
      input = gets.strip.downcase
      if input.to_i.between?(1,20)
        the_show = TvcomTop20::Show.all[input.to_i-1]
        # binding.pry
        puts "#{the_show.name} on #{the_show.channel}"
      elsif input == "list"
        list_shows
      else
        puts "What do you want to do? Type \"list\" to see the list again OR type exit to close:"
      end  
    end
  end

  def goodbye 
    puts "Goodbye, Hope you've found a good show to watch!"
  end

end
