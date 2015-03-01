class Response

  attr_reader :message, :status

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end

	def intro_message
		puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
	end

	def play_again
		puts "Do you want to (P)lay again, or (Q)uit?"
	end

	def end_menu
		puts "Thanks for Playing! Would you like to (P)lay again, or (Q)uit?"
	end


end
