get '/' do


erb :start
end


get '/index' do
  current_user
  @posts = Post.order("created_at DESC")
  @tags= Tag.all
  erb :index
end
