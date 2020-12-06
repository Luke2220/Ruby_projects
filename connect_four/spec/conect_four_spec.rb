require "./lib/connect_four.rb"

describe Board do
    descibe "drop_piece" do
        it "pieces can be placed on board" do
            board= Board.new()
            board.drop_piece(1,'blue')
            expect(board.puts_board()).to eql()
        end
    end
end

describe PlayGame do
    new_game = PlayGame.new
    for i in 1..4
        new_game.play_turn
    end
    describe "play_turn" do
        it "game pieces get placed where they are specificed" do
            expect(play_turn()).to eql(x,y)
        end
    end

    describe "check_victory" do
        it "has either player won the game" do
            expect(check_victory()).to eql(true)
        end
    end
    
end