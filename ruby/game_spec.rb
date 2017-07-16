require_relative "game"

describe Hangman do
  let(:game) { Hangman.new("zoo")}

  describe "#set_answer_bank" do
    context "given a word" do
      it "returns correct underline array" do
        game.set_answer_bank(game.letter_array)
        expect(game.correct_letters).to eq (["_","_","_"])
      end
    end
  end
  describe "#guess" do
    context "given correct letter" do
      it "returns true" do
        expect(game.guess("z")).to eq true
      end
    end
    context "given incorrect letter" do
      it "returns false" do
        expect(game.guess("p")).to eq false
      end
    end
  end

  describe "#record_right_letter" do
    context "given a letter" do
      it "adds letter to @correct_letters array" do
        game.record_right_letter("z")
        expect(game.correct_letters).to eq (["z", "_", "_"])
      end
      it "returns true" do
        expect(game.record_right_letter("z")).to eq true
      end
    end

    describe "#record_wrong_letter" do
      context "given a letter" do
        it "adds letter to @guess_history array" do
          game.record_wrong_letter("p")
          expect(game.guess_history).to eq (["p"])
        end
        it "decrements counter by 1" do
          game.record_wrong_letter("p")
          expect(game.counter). to eq 2
        end
        it "returns true" do
          expect(game.record_wrong_letter("p")).to eq true
        end
      end
    end
  end

  describe "#same_wrong_guess?" do
    context "given a wrong letter already guessed" do
      it "returns true" do
        game.guess("p")
        expect(game.same_wrong_guess?("p")).to eq true
      end
    end
    context "given a letter not guessed" do
      it "returns false" do
        expect(game.same_wrong_guess?("p")).to eq false
      end
    end
  end

  describe "#position" do
    context "given a letter that appears multiple times" do
      it "returns array of positions where letter is" do
        expect(game.position("o")).to eq ([1,2])
      end
    end
  end

  describe "#complete" do
    context "given all correct guesses" do
      before do
        game.guess("z")
        game.guess("o")
      end
      it "returns true" do
        expect(game.complete?).to eq true
      end
      it "@correct letters equals letter array" do
        expect(game.correct_letters).to eq game.letter_array
      end
    end
    context "given too many incorrect guesses" do
      before do
        game.guess("p")
        game.guess("k")
        game.guess("r")
      end
      it "returns true" do
        expect(game.complete?).to eq true
      end
    end
    context "game is unfinished" do
      it "continues with guesses left" do
        game.guess("z")
        expect(game.complete?).to eq false
      end
    end
  end

  describe "#display answer" do
    context "array turns to string" do
      it "returns string" do
        expect(game.display_answer).to eq ("_ _ _ ")
      end
    end
  end

  describe "attribute readers" do
    context "are not writable" do
      it "does not update word" do
        expect {game.word = "cats"}.to raise_error
      end
      it "does not update letter_array" do
        expect {game.letter_array = "cats"}.to raise_error
      end
    end
    context "are readable" do
      it "returns word" do
        expect(game.word).to eq ("zoo")
      end
      it "returns letter_array" do
        expect(game.letter_array).to eq (["z","o","o"])
      end
    end
  end

  describe "attribute accessors" do
    context "are writable" do
      it "updates @counter" do
        expect(game.counter = 1).to eq 1
      end
      it "updates @correct_letters" do
        expect(game.correct_letters = "cats").to eq "cats"
      end
      it "updates @guess_history" do
        expect(game.guess_history = "cats").to eq "cats"
      end
    end
    context "are readable" do
      it "returns value" do
        expect(game.counter).to eq 3
      end
      it "returns correct_letters" do
        expect(game.correct_letters).to eq (["_", "_", "_"])
      end
      it "returns guess_history" do
        expect(game.guess_history).to eq ([])
      end
    end
  end
end

