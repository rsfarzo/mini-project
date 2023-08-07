require "sinatra"
require "sinatra/reloader"
#require "better_errors"
#require "binding_of_caller"
require "chartkick"
require "./services/nasa"
require "http"
require "json"
require "date"
# Need this configuration for better_errors
#use(BetterErrors::Middleware)
#BetterErrors.application_root = __dir__
#BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb :home
end
get("/rover") do
  erb :rover
end
get("/asteroids") do
  @plot_data = NASA.get_asteroids
  erb :asteroids
end
