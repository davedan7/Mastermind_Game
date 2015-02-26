require_relative 'response'
# evaluate
# Write methods
# Output
# Logic


class Mastermind
	attr_accessor :secret

	def initialize
		@secret = secret  
		@menu
	end

	menu = Menu.new
	menu.main

  def execute(input)
    if input == secret
      Response.new(:message => "You Win!", :status => :won)
		elsif input.length > secret
			Response.new(:message => "Too many characters! Guess again!", :status => :continue)
    else
      Response.new(:message => "Guess again!", :status => :continue)
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

	def menu
		@response.menu
		input = gets.chomp.downcase
		response = false		
		until response == true do 
			case input
			when "p"
				response = true
			when "i"
				@response.instructions
				response = true
			when "q"
				#quit the game
				response = true
			else
				puts "Incorrect Input"
				@response.menu
				menu_eval
			end
		end
	end
