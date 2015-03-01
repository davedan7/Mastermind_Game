require_relative 'response'
require 'colorize'

class Mastermind
	attr_accessor :secret
	attr_reader :response, :evaluator

	def initialize
		@secret = secret  
		@response = Response.new(:status => :continue)
		@time_begin = Time.now
		@time_end = nil
		@count = 0
	end

  def execute(input)
		input.to_s.upcase!
		if input == @secret
			@time_end = Time.now
      Response.new(:message => "Congratulations! You guessed the sequence #{colored(@secret)} in #{@count} guesses over  #{time_total}" , :status => :won)
		elsif input == 'Q'
			Response.new(:message => "Nobody likes a quitter!", :status => :quit)
		elsif input == 'C'
			Response.new(:message => "CHEAT! The answer is: #{colored(@secret)}!", :status => :continue)
		elsif input.length > secret.length
			Response.new(:message => "Too many characters! Guess again!", :status => :continue)
		elsif input.length < secret.length
			Response.new(:message => "Not enough characters! Guess again!", :status => :continue)
		elsif @count == 9
			Response.new(:message => "Out of guesses! You Lose!", :status => :won)
		elsif input.match(/[^RGBY]/)
			Response.new(:message => "Incorrect Input! Guesses must be " + "(R)ed, ".colorize(:red) + "(G)reen, ".colorize(:green) + "(B)lue, ".colorize(:blue) + "or " + "(Y)ellow. ".colorize(:yellow) + "\nGuess Again!")
		else
			evaluate_guess(input)
			@count += 1
			Response.new(:message => evaluate_guess(input) + " You have #{10-@count} guesses remaining. Guess again!", :status => :continue)
		end
   
  end

	def evaluate_guess(guess)
		guess_colored = colored(guess)
		colors_correct = correct_elements(guess)
		correct_position = correct_position(guess)
		"'#{guess_colored}' has #{colors_correct} correct colors, with #{correct_position(guess)} in the right position."	
	end


	def correct_elements(guess)
		guess.upcase!
		answer = @secret.split("")
		count = 0
		guess.split("").each do |x|  #works! 
			if answer.include?(x)
				answer.delete_at(answer.index(x))
				count += 1
			end
		end
		count
	end

	def correct_position(guess)  #works
		check = @secret.chars
		correct_position = guess.chars.zip(check)
		num = correct_position.count do |char|
			char[0]==char[1]
		end
		num 
	end

	def secret  # Works
		colors = ["R", "G", "B", "Y"]
		scrambled = colors.map {colors.sample} 
		scrambled.join("")
	end

	def time_total 
		total = @time_end - @time_begin
		mins = (total / 60).round
		secs = (total % 60).round
		"#{mins} minutes and #{secs} seconds!"
	end

	def colored(input)
		pretty = input.upcase.chars.map do |color|
			if color == "R"
				color.colorize(:red)  
			elsif color == "G"
				color.colorize(:green)
			elsif	color == "B"
				color.colorize(:blue)
			elsif color == "Y"
				color.colorize(:yellow)
			else
				color
			end
		end
		pretty.join("")
	end

end


