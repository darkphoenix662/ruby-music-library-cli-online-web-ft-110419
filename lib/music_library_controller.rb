require 'pry'
class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import 
  end
  
 def call 
   input = ""
   while input != "exit"
    
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    input = gets.strip
<<<<<<< HEAD
    
    case input 
     
    when "list songs"
      list_songs 
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      list_songs_by_artist
    when "list genre"
      list_songs_by_genre
    when "play song"
      play_song
    end
=======
>>>>>>> 911aea397413542573dbec4b75304b02e1a76652
  end
  
  def list_songs
    sorted_songs = Song.all.sort{|a, b| a.name <=> b.name}
    sorted_songs.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
<<<<<<< HEAD
=======
    return sorted_songs
>>>>>>> 911aea397413542573dbec4b75304b02e1a76652
  end
  
  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    
    if artist = Artist.find_by_name(input) 
      artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    
    if genre = Genre.find_by_name(input)
      genre.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
<<<<<<< HEAD
    input = gets.strip.to_i - 1

    if input > 0 && input <= Song.all.length - 1
      song_array = Song.all.sort{|a, b| a.name <=> b.name}
      song = song_array[input]
      #binding.pry
      puts "Playing #{song.name} by #{song.artist.name}"
    end
      
=======
    input = gets.strip
    binding.pry
    input_int = input.to_i
    if input_int 
    list_songs[input_int]
    
    
    
>>>>>>> 911aea397413542573dbec4b75304b02e1a76652

  end
end
end