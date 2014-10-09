require 'io/console'
require 'colorize'
require 'json'

def read_char
  begin
    old_state = `stty -g`
    system "stty raw -echo"
    c = STDIN.getc.chr
    if(c=="\e")
      extra_thread = Thread.new{
        c = c + STDIN.getc.chr
        c = c + STDIN.getc.chr
      }
      extra_thread.join(0.00001)
      extra_thread.kill
    end
  rescue => ex
    puts "#{ex.class}: #{ex.message}"
    puts ex.backtrace
  ensure
    system "stty #{old_state}"
  end
  return c
end


log = `git log --pretty=oneline`

array = log.split("\n").reverse

selection = 0

result = []

puts "Name of source file:"
source = gets.chomp

puts "Name of test file:"
spec = gets.chomp

loop do
	puts "\033c"
	array.map! { |i| i == array[selection] ? i.yellow : i.black }
	puts array
	c = read_char
	case c
	when "\e[A"
		selection -= 1 unless selection == 0
	when "\e[B"
		selection += 1 unless selection == (array.length - 1)
	when " "
		sha = array[selection].uncolorize.split(" ").first.uncolorize
		puts "Instructions: \n"
		instruction = gets.chomp
		result << {commit: sha, instruction: instruction, source: source, spec: spec}
		array.delete array[selection]
	when "\r"
		break
	when 'q'
		exit
	end
end

File.open("pomegranate.json", 'w') do |file|
	file.write JSON.pretty_generate result
	puts "Your tutorial steps have been written to the file!"
end





