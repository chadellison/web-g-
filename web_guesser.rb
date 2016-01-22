require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  response = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :response => response}
end

def check_guess(guess)
  if params["guess"].to_i - 5 > SECRET_NUMBER
    response = "Your guess is Way Too high!"
  elsif params["guess"].to_i > SECRET_NUMBER
    response = "Your guess is Too high!"
  elsif params["guess"].to_i + 5 < SECRET_NUMBER
    response = "Your guess is Way Too low!"
  elsif params["guess"].to_i < SECRET_NUMBER
    response = "Your guess is Too low!"
  else
    response = "You got it right! THE SECRET NUMBER IS #{SECRET_NUMBER}"
  end
end
