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
    @header = "&ldquo;#{params[:birthday]}&rdquo; ain&rsquo;t no birthday I ever heard of."
    @result = "Try something like &ldquo;april 1&rdquo;, or even &ldquo;next friday&rdquo;"
  end
  haml :result
end

helpers do
  def format_datetime(datetime)
    datetime.strftime("%B ") + datetime.day.to_s
  end
end