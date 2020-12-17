require "./lib/connect_four.rb"

describe Board do
    describe "drop_piece" do
        it "pieces can be placed on board" do
            board= Board.new()
            expect(board.drop_piece(1,'blue').state).to eql('blue')
        end
    end
end

describe PlayGame do
    new_game = PlayGame.new
    new_game.start_game()

    describe "check_victory" do
        it "can we return false" do
            expect(new_game.is_victory).to eql(false)
        end
    end 
    
    
    describe "check_victory" do
        it "has either player won the game" do
            expect(new_game.is_victory).to eql(true)
        end
    end

   
end