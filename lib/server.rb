class EllyAndJon < Sinatra::Application
  
  configure :production do
    use Rack::Static,
        urls: ['/stylesheets'],
        root: File.expand_path('../tmp', __FILE__)

    Sass::Plugin.options.merge!(template_location: 'public/stylesheets/sass',
                                css_location: 'tmp/stylesheets')
  end
  
  get '/' do
    haml :index
  end
end