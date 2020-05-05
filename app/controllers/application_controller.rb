require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end


  get '/articles/new' do
    erb :new
  end


post '/articles' do
  @ar =  Article.create(title: params[:title], content: params[:content])
  @ar.save
  redirect to "/articles/#{@ar.id}"

  end

  get '/articles' do
      @articles = Article.all
      @title = params[:title]
      @content = params[:content]
      erb :index
  end


  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

get '/articles/:id/edit' do
    @article = Article.find(params[:id])
  erb :edit
end

patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
  redirect to "/articles/#{@article.id}"
  erb :show
end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    erb :show
  end



end
