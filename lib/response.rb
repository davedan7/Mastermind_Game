class Response
	# print
	# get input
  attr_reader :message, :status

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end

	def response
		# Create a function that returns a message dependant on the user's guess
	end

	def instructions
		puts "Google, muthafucka"
	end

	def intro_message
		puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
	end


end
