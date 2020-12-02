require "./lib/tictactow.rb"

describe PlayGame do
    describe "change_turn" do
        new_game = PlayGame.new()

        it "change turn successfully changes player's turn" do
            new_game.change_turn()
            expect(new_game.players_turn).to eql('2')
        end

        it "change turn successfully changes player's turn" do
            new_game.change_turn()
            expect(new_game.players_turn).to eql('1')
        end


    end

    describe "check_victory" do
        new_game = PlayGame.new()
        new_game.play_game()

    it "Player X wins" do     
        expect(new_game.current_board.check_victory('X')).to eql(true)
    end

    it "Player O wins" do     
        expect(new_game.current_board.check_victory('O')).to eql(true)
    end

    end

end