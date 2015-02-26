require_relative 'response'
# evaluate
# Write methods
# Output
# Logic


class Mastermind
	attr_accessor :secret

	def initialize
		@secret = secret  
	end

  def execute(input)
    # secret = "BBGB"
    if input == secret
      Response.new(:message => "You Win!", :status => :won)
    else
      Response.new(:message => "Guess again!", :status => :continue)
    end
  end

	def evaluate_guess(guess)
		# colors_correct = correct_elements(guess)
		# positions_correct = correct_position(guess)
		# "'#{guess}' have #{colors_correct} correct colors"	
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
	 # answer.split("").map do |x|
		# if guess.include?(x)
		# 	count += 1
		# end
	# end	
		# result = 0
		# answer = @secret.split("").dup
		# guess.split("").each do |g|
		# 	if answer.include?(g)
		# 		match = answer.find_index(g)
		# 		answer[match] = nil
		# 		result += 1
		# 	end
		# end
		# result
	# end

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

m = Mastermind.new
# print m.secret
m.secret = "BBGB"
puts m.correct_elements("BBBB")
puts m.correct_elements("BBRB")
# print m.secret
# m.correct_position("GGGG")  #BBGB
# m.evaluate_guess("BBBB")
