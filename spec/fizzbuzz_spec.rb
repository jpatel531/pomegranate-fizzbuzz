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

	it 'buzzes when a number is divisible by 5' do 
		expect(fizzbuzz 5).to eq "Buzz"
	end

	it 'fizzbuzzes when a number is divisible by 15' do 
		expect(fizzbuzz 15).to eq "FizzBuzz"
	end

	it 'returns the number when divisible by neither 3 or 5' do 
		expect(fizzbuzz 1).to eq 1
	end

end