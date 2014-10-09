require 'fizzbuzz'

describe 'Fizzbuzz' do 

	it 'knows when a number is divisible by 3' do 
		expect(divisible_by_three? 3).to be_true
	end

end