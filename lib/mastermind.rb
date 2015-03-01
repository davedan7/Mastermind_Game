require_relative 'response'
require 'colorize'

class Mastermind
	attr_accessor :secret
	attr_reader :response

	def initialize
		@secret = secret  
		@response = Response.new(:status => :continue)
		@count = 0
	end

  def execute(input)
		input.to_s.upcase!
		if input == @secret
      Response.new(:message => "You Win!", :status => :won)
		elsif input == 'Q'
			Response.new(:message => "Bye!", :status => :won)
		elsif input == 'C'
			Response.new(:message => "CHEAT! The answer is: #{@secret}!", :status => :continue)
		elsif input.length > secret.length
			Response.new(:message => "Too many characters! Guess again!", :status => :continue)
		elsif input.length < secret.length
			Response.new(:message => "Not enough characters! Guess again!", :status => :continue)
		elsif @count == 9
			Response.new(:message => "Out of guesses! You Lose!", :status => :won)
		else
			evaluate_guess(input)
			@count += 1
			Response.new(:message => evaluate_guess(input) + " You have #{10-@count} guesses remaining. Guess again!", :status => :continue)
		end
   
  end

	def evaluate_guess(guess)
		colors_correct = correct_elements(guess)
		correct_position = correct_position(guess)
		"'#{guess}' has #{colors_correct} correct colors, with #{correct_position(guess)} in the right position."	
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
		scrambled = colors.map {colors.sample} #Refactored!
		# colors.length.times do 
		# 	colors.shuffle!
		# 	scrambled << colors[0]
		scrambled.join("")
	end

end

__END__
mm = Mastermind.new
mm.secret = "rbgy"
mm.execute("rbgy")
