require './lib/mastermind'
require './lib/menu'
# require './lib/response'


class Runner

	def run 
    puts "Welcome to Mastermind"
		
		menu = Menu.new
		until menu.play == true
			menu.main
			if menu.quit == false
	

				mastermind = Mastermind.new
				mastermind.response.intro_message
				response = nil
				
				until response && response.status == :won
					print "> "
					input = gets.chomp
					response = mastermind.execute(input)
					puts response.message
				end

				# end_menu = Closer.new
				# response  = nil
				# until response && response.status == :new_game || :quit
				# 	print "> "
				# 	input = gets.chomp.downcase
				# 	response = mastermind.evaluate(input)
				# 	if response_status == :new_game
				# 		new_game = Runner.new
				# 		new_game.run
				# 	end
				# end

				closing = nil
				until closing  == true
					puts "Thanks for playing! Would you like to (P)lay again, or (Q)uit?"
					print "> "
					input = gets.chomp.downcase
					if input == "p"
						new_game = Runner.new
						new_game.run
						closing = true
					elsif input == 'q'
						closing = true
						puts "Goodbye!"
					else
						puts "Incorrect Input"
					end
				end
			end

				
		end
	end
	
end




