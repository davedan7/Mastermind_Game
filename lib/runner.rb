require './lib/mastermind'
require './lib/menu'
# require './lib/response'
# read
# Runs everthing / gets tested

class Runner

  def run 
    puts "Welcome to Mastermind"
		
		menu = Menu.new

		until menu.play == true
			print "Would you like to: (P)lay, read the (I)nstructions, or (Q)uit?"
			input = gets.chomp
			menu.evaluate(message)
		end

		mastermind = Mastermind.new
    response = nil

    until response && response.status == :won
      print "> "
      input = gets.chomp
      response = mastermind.execute(input)
      puts response.message
    end
    puts "Goodbye!"
  end
	
	
end

test = Runner.new
test.run


