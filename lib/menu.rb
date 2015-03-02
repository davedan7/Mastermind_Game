require 'colorize'
require_relative 'response'

class Menu
	attr_reader :play, :quit, :response
	def initialize
		@play = false
		@quit = nil
		@response = Response.new(:status => :continue)
	end

	def main
		# until @play == true
			puts "Would you like to: (P)lay, read the (I)nstructions, or (Q)uit?"
			input = gets.chomp.downcase
			evaluate(input)
		# end
	end

	def evaluate(input)
		case input
		when "p"
			@play = true
			@quit = false
		when 'i'
			instructions
		when "q"
			response.goodbye_block
			# puts "Over before it even started..."
			@quit = true
			@play = true
		else
			puts "Incorrect Input"
		end
	end

	def instructions
		puts "1. The computer picks a sequence of colors. The number of colors is the code length. The default code length is 4 but it can be changed when starting a new game.

2. The objective of the game is to guess the exact positions of the colors in the computer's sequence.

3. By default, a color can be used only once in a code sequence. If you start a new game with the 'Allow duplicates' checked, then any color can be used any number of times in the code sequence.

4. After filling a line with your guesses and clicking on the 'Check' button, the computer responses with the result of your guess.

5. For each color in your guess that is in the correct color and correct position in the code sequence, the computer display a small red color on the right side of the current guess.

6. For each color in your guess that is in the correct color but is NOT in the correct position in the code sequence, the computer display a small white color on the right side of the current guess.

7. You win the game when you manage to guess all the colors in the code sequence and when they all in the right position.

8. You lose the game if you use all attempts without guessing the computer code sequence.".colorize(:blue)
	end

end

