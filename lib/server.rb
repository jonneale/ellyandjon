class EllyAndJon < Sinatra::Application
  
  get '/' do
    haml :index
  end
end