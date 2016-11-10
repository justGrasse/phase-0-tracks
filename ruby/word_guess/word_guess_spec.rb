# RSpec
# 'describe' block for each group of tests  
  # 'it' block for each individual test
    # expect(<YOUR CODE>).to eq <RESULT>

require_relative 'word_guess'

describe Game do
  let(:game) { Game.new('Quack') }
  let(:used_letters) { ['R'] }
  

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

  it "checks if a guess is valid" do
    expect(game.is_valid("huh") && game.is_valid(",")).to eq false
  end

end