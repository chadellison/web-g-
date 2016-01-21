require 'sinatra'
require 'sinatra/reloader'

secret_number = rand(100)
get '/' do
  "THE SECRET NUMBER IS #{secret_number}"
end
