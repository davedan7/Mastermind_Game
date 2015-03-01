require 'colorize'
class Response

  attr_reader :message, :status

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end

	def welcome
		puts "Welcome to Mastermind!"
	end
	def intro_message
		puts "I have generated a beginner sequence with four elements made up of: " +  "(r)ed, ".colorize(:red) + "(g)reen, ".colorize(:green) +  "(b)lue, ".colorize(:blue) + "and "+ "(y)ellow. ".colorize(:yellow)+ "Use (q)uit at any time to end the game. What's your guess?"
	end

	def play_again
		puts "Do you want to (P)lay again, or (Q)uit?"
	end

	def end_menu
		puts "Thanks for Playing! Would you like to (P)lay again, or (Q)uit?"
	end

	def goodbye
		puts "Goodbye! Play again soon."
	end


end


