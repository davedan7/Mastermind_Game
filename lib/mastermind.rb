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
		colors_correct = correct_elements(guess)
		positions_correct = correct_position(guess)
		"'#{guess}' have #{colors_correct} correct colors"	
	end

	def correct_elements(guess)
		# answer = @secret
		# guess.upcase!
		# count = 0
		# guess.split("").each do |x|
		# 	if answer.include?(x)
		# 		count += 1
		# 	end
		# end
		answer = @secret.split("").map do |x|
			if guess.include?(x)
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

m = Mastermind.new
# print m.secret
m.secret = "BBGB"
puts m.correct_elements("BBBB")
puts m.correct_elements("BBRB")
# print m.secret
# m.correct_position("GGGG")  #BBGB
# m.evaluate_guess("BBBB")
