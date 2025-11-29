class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)
    tokens = split_numbers(numbers, delimiter)
    integers = tokens.map(&:to_i)

    negatives = integers.select { |n| n < 0 }
    if negatives.any?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end

    integers.sum
  end

  private

  def extract_delimiter(input)
    if input.start_with?("//")
      header, remaining = input.split("\n", 2)
      delimiter = header[2..]
      return [delimiter, remaining]
    else
      return [/[,
]/, input]
    end
  end

  def split_numbers(numbers, delimiter)
    numbers.split(delimiter)
  end
end
