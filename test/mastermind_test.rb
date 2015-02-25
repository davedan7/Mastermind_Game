require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'
# Have multiple test files? Guess check, logic check, etc, test by class
class MastermindTest < Minitest::Test
	attr_reader :mm

	def setup
		@mm = Mastermind.new
	end

  def test_it_exists
    assert MastermindTest
  end

	def test_it_produces_a_secret_number_and_stores_as_a_string
		assert mm.secret.class == String
	end

	def test_it_produces_a_new_secret_each_new_game #There's a small chance these actually will be the same and the test will fail
		other_game = Mastermind.new
		assert other_game.secret != mm.secret
	end

	def test_it_counts_number_of_characters_in_the_correct_position  # secret = "BBGB" for this test and similar, I assigend mm.secret to a set string. Acutal implementation will be random
		assert_equal mm.correct_position("BBGB"), 4
		assert_equal mm.correct_position("BBBB"), 3
		assert_equal mm.correct_position("RRRR"), 0
	end

	def test_it_checks_if_guess_equals_secret
	end

	def test_it_returns_which_guesses_are_correct  		
		mm.evaluate_guess("GGGG")  # mm.secret = "BBGB"
	end



  # def test_it_wins
  #   mm = Mastermind.new
  #   result = mm.execute("BBGB")
  #   assert result.message.downcase.include?("win")
  # end
end
