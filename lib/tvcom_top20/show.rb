class TvcomTop20::Show
  
  attr_accessor :name, :channel, :url, :rank, :premiere_date, :user_rating, :num_votes, :show_summary, :recent_episodes, :cast_members

  @@all = []

  def initialize(show_hash)
    show_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
    @@all << self
  end

  def self.create_basic_shows(show_array)
    show_array.each {|show| Show.new(show)}
  end

  def self.add_show_details(detail_hash)
    detail_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
    self
  end

  def self.all
    @@all
  end

end