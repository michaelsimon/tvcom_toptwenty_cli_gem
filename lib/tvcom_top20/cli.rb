class TvcomTop20::CLI

  def call
    puts "Top 20 Shows:"
    list_shows
    menu
    goodbye
  end

  def list_shows
    @shows = TvcomTop20::Show.all
    @shows.each.with_index(1) do |show, i|
      puts "#{i}. #{show.name} on #{show.channel}"
    end
  end

  def menu
    input = nil   
    while input != "exit"
      puts "Enter the number of the show you'd like more info on or type list to see the list again or type exit to close: "
      input = gets.strip.downcase
      
      if input.to_i > 0
        the_show = @shows[input.to_i-1]
        puts "#{the_show.name} on #{the_show.channel}"
      elsif input == "list"
        list_shows
      else
        puts "Not sure what you want, type list or exit"
      end  
      # case input
      # when "1"
      #   puts "More info on Game of Thrones"
      # when "2"
      #   puts "More info on Arrow"
      # when "list"
      #   list_shows
      # else
      #   puts "Not sure what you want, type list or exit"
      # end
    end
  end

  def goodbye 
    puts "Goodbye, Hope you've found a good show to watch!"
  end
end
