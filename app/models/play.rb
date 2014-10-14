class Play < ActiveRecord::Base
  validates :word, presence: true, length: { maximum: 7 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}

  def letter_scores
    {"A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1, "F"=>4, "G"=>2, "H"=>4, "I"=>1, "J"=>8,
     "K"=>5, "L"=>1, "M"=>3, "N"=>1, "O"=>1, "P"=>3, "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
     "U"=>1, "V"=>4, "W"=>4, "X"=>8, "Y"=>4, "Z"=>10}
  end

  def score(multiplier = {})
    single_score = word.upcase.chars.inject(0){|sum, letter| sum + letter_scores[letter]}
    if multiplier[:word_multiplier] == :triple
      score = 3 * single_score
    elsif multiplier[:word_multiplier] == :double
      score = 2 * single_score
    else
      score = single_score
    end
  end
end
