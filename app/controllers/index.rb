get '/' do


erb :start
end

post '/' do


redirect to '/index'
end

get '/index' do
  @posts = Post.order("created_at DESC")
  @tags= Tag.all
  erb :index
end
