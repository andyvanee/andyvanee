require 'sinatra'
require 'json'
require 'liquid'

set :root, File.dirname(__FILE__)
set :public_folder, Proc.new {
  File.join(root, "/../public")
}
jekyll_folder = "../jekyll"

default_locals = {
  'page' => {
    'title' => 'App',
    'content' => ''
  },
  'site' => {
    'name'=> 'andyvanee.com',
    'description' => 'some description',
  }
}

get '/' do
  redirect '/index.html'
end

get '/page/create' do
  site = {}
  create_form = liquid :create
  locals = default_locals
  locals['page']['content'] = create_form
  liquid :default, :locals => locals
end

post '/page/create' do
  page = {:title => params[:title], :layout => params[:layout], :content=> params[:content]}
  doc = erb :page, :locals => page
  title = Time.now.strftime("%Y-%m-%d-") + params[:title].downcase.gsub(/\s+/, '-') + '.md'
  File.open("#{jekyll_folder}/_posts/#{title}", 'w') {|f| f.write(doc) }
  build_results = `cd ../ && make`
  locals = default_locals
  locals['page']['content'] = "<pre style='font-size:11px'>#{build_results}</pre>"
  liquid :default, :locals => locals
end
