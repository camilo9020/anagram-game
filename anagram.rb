# 1. leer archivo y pasar a un array o hash todas las palabras

#2. cada palabra tomarla y separar el letras

#3. ordenar las letras de cada palabra
#4. comparar las letras ordenanas de cada palabra con el resto para identificar el anagrama y meter en el has de respuesta.

class Parser
	attr_reader :file_array
	def initialize(dictionary)
		@dictionary = dictionary		
	end
	def parse
		@file_array = File.foreach(@dictionary).map { |line| line.strip}.delete_if {|line| line == ""}		
	end	
end

class Game

	  def initialize(dictionary)
	    @dictionary = dictionary
	    @parser = Parser.new(@dictionary)
	    @parser.parse
	    @dictionary_array = @parser.file_array
	    
	  end

	 def run
	 	View.welcome	 	
	 	Sorter.combine_anagrams(@dictionary_array)	 
	 end 	
end


class Sorter

	  def self.get_user_answer
	  	View.output_select
	    @user_answer = gets.chomp
	    return @user_answer
	  end


	 def self.combine_anagrams(words)
	   anagrams_words={}
	   @anagrams = []
	   @ananagrams = []
       words.each do |word|
         anagrams_words[word.downcase.split('').sort.join] ||=[]
         anagrams_words[word.downcase.split('').sort.join] << word 
       end     
	   
	    anagrams_words.each do |key, value| 	      
			if value.length > 1
			 @anagrams << value		
			elsif 
			 @ananagrams << value			 	 
			end 
	    end	  
	   

	    print "ANAGRAMAS: #{@anagrams.flatten}"
	 	puts  "ANANAGRAMAS: #{@ananagrams.flatten}"
	 	
	 end
end

class  View #view
  
  def self.welcome
    puts "En esta app podras ver los ANAGRAMAS y ANANAGRAMAS de la lista que ingresaste"
  end

  def self.output_select
  	 puts "Que resultado quieres ver: Para ANAGRAMAS ingresa 1 y para ANANAGRAMAS ingresa 2"  	 
  end

end

#-----------------------------------------------


game = Game.new('dictionary.txt')
game.run