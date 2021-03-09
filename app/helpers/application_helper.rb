module ApplicationHelper
  def display_abbreviation(word)
    if word == "extra small"
      "XS"
    elsif word == "small"
      "S"
    elsif word == "medium"
      "M"
    elsif word == "large"
      "L"
    elsif word == "extra large"
      "XL"
    end
  end
end
