require './lib/mastermind'
# read
# Runs everthing / gets tested
response = Response.new
response.greeting
response.menu

class Runner
  def run 
    # puts "Welcome to Mastermind"

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

Runner.new


print secret
