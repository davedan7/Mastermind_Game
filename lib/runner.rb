require './lib/mastermind'
require './lib/menu'
# require './lib/response'


class Runner
	def initialize
		@mastermind = Mastermind.new ## Logic. Accessable to rest of runner
	end

	def run 
		@mastermind.response.welcome
		
		menu = Menu.new
		until menu.play == true
			menu.main
			if menu.quit == false
				run_game
			end
		end
	end

	def run_game
		# mastermind = Mastermind.new
		@mastermind.response.intro_message
		response = nil
		
		until response && (response.status == :won || response.status == :quit)
			print "> "
			input = gets.chomp
			response = @mastermind.execute(input)
			puts response.message
		end

		closing = nil
		until closing  == true
			if response.status == :won
				@mastermind.response.end_menu
				print "> "
				input = gets.chomp.downcase
				if input == "p"
					new_game = Runner.new
					new_game.run_game
					closing = true
				elsif input == 'q'
					closing = true
					@mastermind.response.goodbye
				else
					puts "Incorrect Input"
				end
			elsif response.status == :quit
				closing = true
			end
		end
	end

end




