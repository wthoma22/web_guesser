require 'sinatra'
require 'sinatra/reloader'
require 'pry'

secret_number = rand(100)
background = 'white'

get '/' do
  if params["guess"]
    guess = params["guess"].to_i
    message = check_guess(secret_number, guess)
    background = background_color(message)
  end
  erb :index, :locals => {:secret_number => secret_number, :message => message, :background => background}
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

  def background_color(message)
    case message
    when "Way too low!" then '#FA5858'
    when "Way too high!" then '#FA5858'
    when "Too high!" then '#F5A9A9'
    when "Too low!" then '#F5A9A9'
    when "You got it right!" then '#BCF5A9'
    end
  end
