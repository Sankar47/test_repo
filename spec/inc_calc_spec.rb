require 'inc_calc'

RSpec.describe IncCalc do
	describe ".add" do
		it "return 0 for empty string" do
			expect(IncCalc.add("")).to eq(0)
		end

		it "returns same number when single digit" do
			expect(IncCalc.add("3")).to eq(3)
		end

		it "returns sum when 2 digits seperated by coma" do
			expect(IncCalc.add("3,4")).to eq(7)
		end

		it "returns sum when any number of digits seperated by coma" do
			expect(IncCalc.add("3,4,1")).to eq(8)
		end

		it "returns sum when any number of digits seperated by coma/newline" do
			expect(IncCalc.add("3,4\n1")).to eq(8)
		end

		it "returns sum when any number of digits seperated by custom delimiter" do
			expect(IncCalc.add("//;\n1;2")).to eq(3)
		end

		it "raises error when negative numbers are present" do
			expect { IncCalc.add("1,-2,-3") }.to raise_error("negative numbers not allowed -2,-3")
		end

		it "ignores numbers greater than 1000 and returns the remanining sum" do
			expect(IncCalc.add("3,1008,4,1016,1")).to eq(8)
		end

		it "returns sum when any number of digits seperated by multiple custom delimiter" do
			expect(IncCalc.add("//[*][%]\n1*2%3")).to eq(6)
		end
	end
end