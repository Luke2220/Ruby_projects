require "./lib/caesarcipher.rb"

describe ".caesar_cipher" do
    
    it "hello world shifted by three is khoor zhuog" do
        expect(caesar_cipher('hello world',3)).to eql('khoor zruog')
    end

    it "hello world can be shifted by a large amount" do
        expect(caesar_cipher('hello world', 89)).to eql('spwwz hzcwo')
    end

    it "hello world can be shifted negative" do
        expect(caesar_cipher('hello world', -50)).to eql('jgnnq yqtnf')
    end

    it "hello world can be shifted negative" do
        expect(caesar_cipher('hello world', -3)).to eql('ebiil tloia')
    end


end