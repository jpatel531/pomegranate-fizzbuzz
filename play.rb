require 'io/console'
require 'colorize'

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

array = ["hello", "hi", "waddup"]

selection = 0

result = []

loop do
	puts "\e[H\e[2J"
	array.map! { |i| i == array[selection] ? i.green : i.black }
	puts array
	c = read_char
	case c
	when "\e[A"
		selection -= 1 unless selection == 0
	when "\e[B"
		selection += 1 unless selection == (array.length - 1)
	when "\r"
		result << array[selection]
		array.delete array[selection]
		puts result
	when 'q'
		exit
	end
end





