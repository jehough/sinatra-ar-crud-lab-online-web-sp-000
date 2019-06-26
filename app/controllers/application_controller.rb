require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end


  get '/articles/new' do
    erb :new
  end

  post '/articles/new' do
    article = Article.new(:title => params["title"], :content => params["content"])
    article.save
    redirect to '/articles'
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
end
