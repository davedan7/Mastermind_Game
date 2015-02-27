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
			menu.main
	

			mastermind = Mastermind.new
			response = nil
			
			mastermind.intro
			until response && response.status == :won
				print "> "
				input = gets.chomp
				response = mastermind.execute(input)
				puts response.message
			end
			puts "Goodbye!"

		end
	end
	
	
end

test = Runner.new
test.run


