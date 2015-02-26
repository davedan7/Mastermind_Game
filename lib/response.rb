class Response
	# print
	# get input
  attr_reader :message, :status

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end

	def greeting
		puts "Welcome to Masterind"
	end

	def menu
		puts "Would you like to: (P)lay, read the (I)nstructions, or (Q)uit?"
	end

	def response
		# Create a function that returns a message dependant on the user's guess
	end


end
