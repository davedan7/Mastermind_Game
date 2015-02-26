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


end
