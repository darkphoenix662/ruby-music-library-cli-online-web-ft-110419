class Song 

  attr_accessor :name
  attr_reader :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre 
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    self.class.all << self 
  end
  
  def self.create(name)
    song = new(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    titles = filename.split(" - ")
    artist_name, song_name, genre_name = titles[0], titles[1], titles[2].sub(".mp3", "")
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    
    new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).tap do |s|
      s.save
    end
  end
end