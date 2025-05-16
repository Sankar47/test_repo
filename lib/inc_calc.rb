class IncCalc
	def self.add(numbers)
		return 0 if numbers.empty?
		return numbers.to_i if numbers.length == 1

		if numbers.start_with?("//")
			delimiter_with_slashes, only_numbers = numbers.split("\n")
			delimiter = delimiter_with_slashes[2..-1]

			if delimiter.start_with?("[")
				delimiter = delimiter.scan(/\[(.+?)\]/).flatten
			else
				delimiter = [delimiter]
			end

			split_numbers = only_numbers.split(/#{(delimiter.map{ |d| Regexp.escape(d) }.join('|'))}/).map(&:to_i)
		else
			split_numbers = numbers.split(/,|\n/).map(&:to_i)
		end

		negatives = split_numbers.select { |number| number < 0 }
		raise "negative numbers not allowed #{negatives.join(",")}" if negatives.any?

		split_numbers.reject{ |number| number > 1000 }.sum
	end
end