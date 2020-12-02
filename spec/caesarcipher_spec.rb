require "./lib/caesarcipher.rb"

describe ".caesar_cipher" do
    
    it "hello world shifted by three is khoor zhuog" do
        expect(caesar_cipher('hello world',3)).to eql('khoor zhuog')
    end

end