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
  if @@guesses_left > 0
     @@guesses_left -= 1
  else
    @@guesses_left = 5
    @@secret_number = rand(100)
    response = "You lost. The number has been reset"
  end
  erb :index, :locals => {:number => @@secret_number,
                        :response => response,
                        :color => @@color}
end

def check_guess(guess)
  if guess - 5 > @@secret_number
    @@color = "red"
    response = "Your guess is Way Too high!"
  elsif guess > @@secret_number
    @@color = "pink"
    response = "Your guess is Too high!"
  elsif guess + 5 < @@secret_number
    @@color = "red"
    response = "Your guess is Way Too low!"
  elsif guess < @@secret_number
    @@color = "pink"
    response = "Your guess is Too low!"
  else
    @@color = "green"
    response = "You got it right! THE SECRET NUMBER IS #{@@secret_number}"
  end
end
