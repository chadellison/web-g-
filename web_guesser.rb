require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)
@@color = "white"
@@guesses_left = 5

get '/' do
  guess = params["guess"].to_i
  response = check_guess(guess)

  erb :index, :locals => {:number => SECRET_NUMBER,
                          :response => response,
                          :color => @@color}
end

def check_guess(guess)
  if guess - 5 > SECRET_NUMBER
    @@color = "red"
    response = "Your guess is Way Too high!"
  elsif guess > SECRET_NUMBER
    @@color = "pink"
    response = "Your guess is Too high!"
  elsif guess + 5 < SECRET_NUMBER
    @@color = "red"
    response = "Your guess is Way Too low!"
  elsif guess < SECRET_NUMBER
    @@color = "pink"
    response = "Your guess is Too low!"
  else
    @@color = "green"
    response = "You got it right! THE SECRET NUMBER IS #{SECRET_NUMBER}"
  end
end
