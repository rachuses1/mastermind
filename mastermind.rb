@solution = ""
attempt = ""
@right_letter_right_order = 0
@right_letter_wrong_order = 0
@counter = 0
a = ""
b = ""
c = ""
d = ""

def random_generator()
  @a = rand(4).to_s
  @b = rand(4).to_s
  @c = rand(4).to_s
  @d = rand(4).to_s

  @solution =  @a + @b + @c + @d

end

def guess()
  while true
    if @counter >= 12
      puts "The answer is #{@solution}!"
      break
    else
    attempt = gets.chomp
    if_valid(attempt)
    check(attempt)
    end    
  end
end

def check(attempt)
  puts "We are checking #{attempt} for hints!"
  
  if @a == attempt[0]
    @right_letter_right_order += 1
  elsif attempt.include?(@a)
    @right_letter_wrong_order += 1
  end
  if @b == attempt[1]
    @right_letter_right_order += 1
  elsif attempt.include?(@b)
    @right_letter_wrong_order += 1
  end
  if @c == attempt[2]
    @right_letter_right_order += 1
  elsif attempt.include?(@c)
    @right_letter_wrong_order += 1
  end
  if @d == attempt[3]
    @right_letter_right_order += 1
  elsif attempt.include?(@d)
    @right_letter_wrong_order += 1
  end
  puts "Right letter, right order: #{@right_letter_right_order}"
  puts "Right letter, wrong order: #{@right_letter_wrong_order}"

  @right_letter_right_order = 0
  @right_letter_wrong_order = 0
end

def if_valid(combination)
  puts "We are checking if #{combination} is valid"
  combination = combination.chars

  if 
    combination[0].to_i > 4 ||
    combination[1].to_i > 4 ||
    combination[2].to_i > 4 ||
    combination[3].to_i > 4 ||
    combination.count != 4

    puts "guess is not valid, please do another one"
    guess()
  else
    puts "guess is valid!"
    @counter += 1
  end
end

random_generator()
guess()