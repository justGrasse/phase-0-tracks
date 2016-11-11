# RSpec
# 'describe' block for each group of tests  
  # 'it' block for each individual test
    # expect(<YOUR CODE>).to eq <RESULT>

require_relative 'word_guess'

describe Game do
  let(:game) { Game.new('Quack') }
  let(:bad_game) { Game.new('1nval1d') }
  

  it "set the password to 'Quack'" do
    expect(game.password).to eq ['Q','u','a','c','k']
  end

  it "set the the board" do
    expect(game.board).to eq ['_','_','_','_','_']
  end

  it "make a good guess and display a board" do
    expect(game.check_guess("A")).to eq ['_','_','a','_','_']
  end

  it "make a bad guess and display a board" do
    expect(game.check_guess("z")).to eq ['_','_','_','_','_']
  end

  it "checks if a multiple letter guess is denied" do
    expect(game.is_valid("huh")).to eq false
  end

  it "checks if a non-letter guess is denied" do
    expect(game.is_valid(",")).to eq false
  end

  it "checks if a valid guess is accepted" do
    expect(game.is_valid("h")).to eq true
  end

  it "checks that passwords with non-letters are not accepted" do
    expect(bad_game.valid_password).to eq false
  end

  it "checks that 5-letter words get 7 guesses" do
    expect(game.guess_max).to eq 7
  end

end