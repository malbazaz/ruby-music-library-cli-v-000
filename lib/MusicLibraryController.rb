require 'pry'
class MusicLibraryController 
  
 # @@all = []
  
  def initialize(path="./db/mp3s")  
  #@song_object = 
  MusicImporter.new(path).import
  end 
  
  def call 
   puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      answer = gets.strip
      while answer != "exit"
      puts "What would you like to do?"
      answer = gets.strip
      end 
  end 
  
  def list_songs
     @sorted_array = []
      Song.all
     @sorted_array = Song.all.sort do |first_item, second_item|
         first_item.name <=> second_item.name 
      end 
    
     @sorted_array.each_with_index do |item, index|
       index+=1 
       puts "#{index}. #{item.artist.name} - #{item.name} - #{item.genre.name}"
      end
    end 
  
  def list_artists
     @sorted_array = []
      Artist.all
     @sorted_array = Artist.all.sort do |first_item, second_item|
         first_item.name <=> second_item.name
      end 
    @sorted_array = @sorted_array.uniq
     @sorted_array.each_with_index do |item, index|
       index+=1 
       puts "#{index}. #{item.name}"
      end
    end
    
  def list_genres 
      @sorted_array = []
      Genre.all
     @sorted_array = Genre.all.sort do |first_item, second_item|
         first_item.name <=> second_item.name
      end 
    @sorted_array = @sorted_array.uniq
     @sorted_array.each_with_index do |item, index|
       index+=1 
       puts "#{index}. #{item.name}"
      end
  end 
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    answer = gets.strip 
  @songs1 = []
  Song.all.collect do |song|
    if song.artist.name == answer 
      @songs1 << song 
    end
     binding.pry
  end
     
  end 
 
end 