require_relative 'response'
# evaluate
# Write methods
# Output
# Logic


class Mastermind
	attr_reader :secret
	def initialize
		@secret = "BBGB"
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
		# count = 0
		# until count == 10
			guess = guess.chars
			answer = @secret.chars
			common = (guess & answer)
			num = common.length
			puts "There are #{num} colors in common: #{common} "
		# end
		
	end

	def correct_elements(guess)
		guess.upcase!
		# answer = @secret.chars
		# correct_elements = guess.chars{|char| answer.include?(char)}
		# print correct_elements
	end

	def correct_position(guess)
		check = @secret.chars
		correct_position = guess.chars.zip(check)
		num = correct_position.count do |char|
			char[0]==char[1]
		end
		num 
	end

	def secret  # Works
	#	scrambled = []
		colors = ["R", "G", "B", "Y"]
		scrambled = colors.shuffle!
		@secret = scrambled.join("") #un-comment this to randomize secret

		# colors = ["R", "G", "B", "Y"]
		# colors.length.times do 
		# 	colors.shuffle!
		# 	scrambled << colors[0]
		# end
	end

		#generate a random sequence of colors
	def guess_evaluator
	end

end

m = Mastermind.new
m.correct_position("GGGG")  #BBGB
# m.evaluate_guess("BBBB")
