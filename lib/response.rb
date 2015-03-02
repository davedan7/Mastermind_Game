require 'colorize'
class Response

  attr_reader :message, :status

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end

	def logo
    puts "====================================================================================\n".colorize(:blue)
    puts "███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗
████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗
██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║
██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║
██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝
                                                                                    ".colorize(:red)
puts "====================================================================================".colorize(:blue)

  def welcome
    puts "Welcome!".colorize(:yellow)
  end

  def goodbye_block
    system "clear"
    puts "====================================================================================\n".colorize(:blue)
    puts "                             ██████╗ ██╗   ██╗███████╗██╗
                             ██╔══██╗╚██╗ ██╔╝██╔════╝██║
                             ██████╔╝ ╚████╔╝ █████╗  ██║
                             ██╔══██╗  ╚██╔╝  ██╔══╝  ╚═╝
                             ██████╔╝   ██║   ███████╗██╗
                             ╚═════╝    ╚═╝   ╚══════╝╚═╝
                            ".colorize(:red)
puts "====================================================================================".colorize(:blue)
  end

	end

	def intro_message
		puts "I have generated a beginner sequence with four elements made up of: " +  "(r)ed, ".colorize(:red) + "(g)reen, ".colorize(:green) +  "(b)lue, ".colorize(:blue) + "and "+ "(y)ellow. ".colorize(:yellow)+ "Use (q)uit at any time to end the game. What's your guess?"
	end

	def play_again
		puts "Do you want to (P)lay again, or (Q)uit?"
	end

	def end_menu
		puts "Thanks for Playing! Would you like to (P)lay again, or (Q)uit?"
	end

	def goodbye
		puts "Goodbye! Play again soon."
	end

  def incorrect_input
    print "Incorrect Input! Guesses must be " + "(R)ed, ".colorize(:red) + "(G)reen, ".colorize(:green) + "(B)lue, ".colorize(:blue) + "or " + "(Y)ellow. ".colorize(:yellow) + "\nGuess Again!"
  end

  def out_of_guesses
    print "Out of guesses! You lose :( "
  end

  def not_enough
    print "Not enough characters! Try again!"
  end

  def too_many
		print "Too many characters! Try again."
  end

  def quitter
    system "clear"
    puts "====================================================================================\n".colorize(:blue)
    puts "               ██████╗ ██╗   ██╗██╗████████╗████████╗███████╗██████╗
              ██╔═══██╗██║   ██║██║╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗
              ██║   ██║██║   ██║██║   ██║      ██║   █████╗  ██████╔╝
              ██║▄▄ ██║██║   ██║██║   ██║      ██║   ██╔══╝  ██╔══██╗
              ╚██████╔╝╚██████╔╝██║   ██║      ██║   ███████╗██║  ██║
               ╚══▀▀═╝  ╚═════╝ ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝
                                                       ".colorize(:red)
puts "====================================================================================".colorize(:blue)

  end

  def cheater
    system "clear"
    puts "====================================================================================".colorize(:blue)
    puts "
                ██████╗██╗  ██╗███████╗ █████╗ ████████╗███████╗██████╗
              ██╔════╝██║  ██║██╔════╝██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
              ██║     ███████║█████╗  ███████║   ██║   █████╗  ██████╔╝
              ██║     ██╔══██║██╔══╝  ██╔══██║   ██║   ██╔══╝  ██╔══██╗
              ╚██████╗██║  ██║███████╗██║  ██║   ██║   ███████╗██║  ██║
               ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
                                                         ".colorize(:red)
puts "====================================================================================".colorize(:blue)

  end

end
