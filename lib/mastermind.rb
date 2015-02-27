require_relative 'response'
# evaluate
# Write methods
# Output
# Logic


class Mastermind
	attr_accessor :secret
	attr_reader :response

	def initialize
		@secret = secret  
		@response = Response.new(:status => :continue)
	end

  def execute(input)
		if input == secret
      Response.new(:message => "You Win!", :status => :won)
			puts "Win"
		elsif input == 'q'
			Response.new(:message => "Bye!", :status => :won)
		elsif input == 'c'
			Response.new(:message => "CHEAT! The answer is: #{@secret}!", :status => :continue)
		elsif input.length > secret.length
			Response.new(:message => "Too many characters! Guess again!", :status => :continue)
		elsif input.length < secret.length
			Response.new(:message => "Not enough characters! Guess again!", :status => :continue)
		else
			evaluate_guess(input)
      Response.new(:message => evaluate_guess(input) + "Guess again!", :status => :continue)
			puts "Fuck"
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

	def intro
		response.intro_message
	end

end

	# def menu
	# 	@response.menu
	# 	input = gets.chomp.downcase
	# 	response = false		
	# 	until response == true do 
	# 		case input
	# 		when "p"
	# 			response = true
	# 		when "i"
	# 			@response.instructions
	# 			response = true
	# 		when "q"
	# 			#quit the game
	# 			response = true
	# 		else
	# 			puts "Incorrect Input"
	# 			@response.menu
	# 			menu_eval
	# 		end
	# 	end
	# end

mm = Mastermind.new
mm.secret = "rbgy"
mm.execute("rbgy")
