require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)
@@secret_number = SECRET_NUMBER
@@color = "white"
@@guesses_left = 5

get '/' do
  guess = params["guess"].to_i
  response = check_guess(guess)
  cheat = "\nTHE SECRET NUMBER IS #{@@secret_number}" if params["cheat"] == "true"
  if @@guesses_left > 0
     @@guesses_left -= 1
  else
    @@guesses_left = 5
    @@secret_number = rand(100)
    response = "You lost. A knew number has been generated"
  end
  erb :index, :locals => {:number => @@secret_number,
                        :response => response,
                        :color => @@color,
                        :cheat => cheat}
end

def check_guess(guess)
  if guess - 5 > @@secret_number
    @@color = "red"
    response = "Your guess is Way Too high!" + guesses
  elsif guess > @@secret_number
    @@color = "pink"
    response = "Your guess is Too high!" + guesses
  elsif guess + 5 < @@secret_number
    @@color = "red"
    response = "Your guess is Way Too low!" + guesses
  elsif guess < @@secret_number
    @@color = "pink"
    response = "Your guess is Too low!" + guesses
  else
    @@color = "green"
    @@guesses_left = 5
    response = "You got it right! THE SECRET NUMBER IS #{@@secret_number}"
  end
end

def guesses
  "\nYou have #{@@guesses_left} guesses_left!"
end
