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

  # get '/show' do
  #   erb :'/views/show'
  # end

  get '/articles' do
    # binding.pry
      @articles = Article.all
      @title = params[:title]
      @content = params[:content]
      erb :index
  end


  get '/articles/:id' do
  # binding.pry
    @article = Article.find(params[:id])
    # @title = @article.title
    # @content = @article.content
    erb :"/articles/show"
  end

# get '/articles/:id/edit' do
#   erb :edit
# end



end
