class EllyAndJon < Sinatra::Application

  configure do
    set :views, File.expand_path(File.join(File.dirname(__FILE__), '..', 'views'))
    Sass::Plugin.options[:template_location] = File.expand_path(File.join(File.dirname(__FILE__), '..', 'public', 'stylesheets', 'sass'))
    Sass::Plugin.options[:css_location] = File.expand_path(File.join(File.dirname(__FILE__), '..', 'tmp', 'stylesheets'))
    use Sass::Plugin::Rack
  end

  get '/' do
    haml :index
  end
  
  get '/stylesheets/:sheet.css' do
    content_type "text/css"
    file = File.open("#{File.join(File.dirname(__FILE__), *%w[.. public stylesheets sass])}/#{params[:sheet]}.sass")
    last_modified = file.mtime
    sass file.read, :sass => {:filename => file}
  end
end