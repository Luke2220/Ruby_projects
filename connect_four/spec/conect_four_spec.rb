require "./lib/connect_four.rb"

describe PlayGame do
    describe "check_victory" do
        it "has either player won the game" do
            expect(check_victory()).to eql(true)
        end
    end
    describe "play_turn" do
        it "game pieces get placed where they are specificed" do
            expect(play_turn()).to eql(x,y)
        end
    end
end