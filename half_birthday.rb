require 'rubygems'
require 'sinatra'
require 'haml'
require 'chronic'

get '/' do
  haml :form
end

post '/half' do
  if birthday = Chronic.parse(params[:birthday])
    @header = format_datetime(birthday) + "?"
    @result = "Your half-birthday is " + format_datetime(birthday + 15768000) + "!"
  else
    @header = "<em>#{params[:birthday]}</em> ain&rsquo;t no birthday I ever heard of."
    @result = "Try something like <strong><em>April 1</em></strong>, or <strong><em>July 23 at 7 in the morning</em></strong>, or even <strong><em>Two days from now</em>.</strong>"
  end
  haml :result
end

helpers do
  def format_datetime(datetime)
    datetime.strftime("%B ") + datetime.day.to_s
  end
end