# RSpec
# 'describe' block for each group of tests  
  # 'it' block for each individual test
    # expect(<YOUR CODE>).to eq <RESULT>

require_relative 'word_guess'

describe Game do
  let(:game) { Game.new('Quackers') }

  it "set the password to 'Quackers'" do
    expect(game.password).to eq 'Quackers'
  end

  it "set the the board" do
    expect(game.board.join(' ')).to eq '_ _ _ _ _ _ _ _'
  end

end