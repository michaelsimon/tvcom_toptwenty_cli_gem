class TvcomTopTwenty::CLI

  BASE_URL = "http://www.tv.com/"

  def call
    puts "-"*40
    puts "Welcome to TV.com Top 20 Shows!"
    puts "-"*40
    puts "Here Are The Current Top 20 Shows (as ranked)"
    list_shows
    menu
  end

  def list_shows
    shows_array = TvcomTopTwenty::Scraper.scrape_toptwenty_shows(BASE_URL+"/shows/")
    TvcomTopTwenty::Show.create_basic_shows(shows_array) if TvcomTopTwenty::Show.all.empty?
    TvcomTopTwenty::Show.all.each do |show|
      puts "\s\s\s#{show.rank}. #{show.name} on #{show.channel}"
    end
  end

  def get_shows_detail(show)
    if TvcomTopTwenty::Show.all[show].user_rating.nil?
      details = TvcomTopTwenty::Scraper.scape_show_detail(BASE_URL+TvcomTopTwenty::Show.all[show].url,show)
    end
    the_show = TvcomTopTwenty::Show.all[show]
    puts "\n"
    puts "-"*(the_show.name.length)
    puts "#{the_show.name.upcase}"
    puts "-"*(the_show.name.length)
    puts "Airs #{the_show.time_channel} | #{the_show.premiere_date}"
    puts "Ranks \##{the_show.rank} on TV.com with a rating of #{the_show.user_rating}/10 with #{the_show.num_votes}"
    puts "\nAbout The Show:"
    puts "#{the_show.show_summary}"
    puts "\nTop Cast:"
        # binding.pry
        the_show.cast_members.each do |cast|
          puts "#{cast[:actor_name]} as #{cast[:actor_role]}"
        end
        puts "\nRecent Episodes:"
        the_show.recent_episodes.each do |episode|
          puts "#{episode[:ep_number]} - #{episode[:ep_title].gsub(/\n(NEXT EPISODE)/,"").squeeze("  ")} - #{episode[:ep_date]}"
        end
      end

      def goodbye 
        puts "\nGoodbye, Hope you've found a good show to watch!"
      end

      def menu
        input = nil   
        while input != "exit"
          puts "\nEnter the ranking number of the show you'd like more info on" 
          print "OR type \"list\" to see the list again OR type exit to close: "
          input = gets.strip.downcase
          if input.to_i.between?(1,20)
            get_shows_detail(input.to_i-1)
          elsif input == "list"
            list_shows
          elsif input =="exit"
            goodbye
          else
            puts "\n\e[31mInvalid Option, Try again.\e[0m"
          end  
        end
      end

    end