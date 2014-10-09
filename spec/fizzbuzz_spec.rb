require 'fizzbuzz'

describe 'Fizzbuzz' do 

	it 'knows when a number is divisible by 3' do 
		expect(divisible_by_three? 3).to be true
	end

	it 'knows when a number is not divisible by 3' do 
		expect(divisible_by_three? 1).to be false
	end

end