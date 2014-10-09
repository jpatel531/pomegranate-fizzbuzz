require 'fizzbuzz'

describe 'Fizzbuzz' do 

	it 'knows when a number is divisible by 3' do 
		expect(divisible_by_three? 3).to be true
	end

	it 'knows when a number is not divisible by 3' do 
		expect(divisible_by_three? 1).to be false
	end

	it 'knows when a number is divisible by 5' do 
		expect(divisible_by_five? 5).to be true
	end

	it 'knows when a number is indivisible by 5' do 
		expect(divisible_by_five? 1).to be false
	end

	it 'knows when a number is divisible by 15' do 
		expect(divisible_by_fifteen? 15).to be true
	end

	it 'fizzes when a number is divisible by 3' do 
		expect(fizzbuzz 3).to eq "Fizz"
	end

	it 'fizzes when a number is divisible by 5' do 
		expect(fizzbuzz 5).to eq "Buzz"
	end

end