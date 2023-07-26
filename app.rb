require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
require 'chartkick'
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb :home
end
get("/rover") do
  erb :rover
end
get("/near_earth") do
  #@data = {'2015-07-20 00:00:00 UTC' => 2, '2015-07-21 00:00:00 UTC' => 4, '2015-07-22 00:00:00 UTC' => 1, '2015-07-23 00:00:00 UTC' => 7}
  erb :near_earth
end
