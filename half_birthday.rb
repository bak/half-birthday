require 'rubygems'
require 'sinatra'
require 'haml'
require 'chronic'

set :haml, { :format => :html5 }

get '/' do
  haml :form
end

post '/half' do
  birthday = Chronic.parse(params[:birthday].gsub(/\302\240/,' ')) # quick hack to remove non-breaking spaces that are coming from...?
  if birthday
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