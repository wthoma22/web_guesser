require 'sinatra'
require 'sinatra/reloader'
require 'pry'

secret_number = rand(100)

get '/' do
  if params["guess"]
    guess = params["guess"].to_i
    message = check_guess(secret_number, guess)
  end
  erb :index, :locals => {:secret_number => secret_number, :message => message}
end

  def check_guess(secret_number, guess)
    if guess - secret_number < -5
      "Way too low!"
    elsif guess - secret_number > 5
      "Way too high!"
    elsif guess > secret_number
      "Too high!"
    elsif guess < secret_number
      "Too low!"
    else
      "You got it right!"
    end
  end
