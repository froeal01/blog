get '/create' do


erb :create
end

post '/create' do
  current_user.posts << Post.create(:title => params[:title],:body => params[:body])
      params[:name].split(",").each do |tag|
      if Tag.find_by_name(tag.strip) == nil

        post = current_user.posts.last

        tag=Tag.create(name: tag.strip)

        PostsTag.create(post_id: post.id, tag_id: tag.id)
      else
        PostsTag.create(post_id: post.id, tag_id: Tag.find_by_name(tag.strip).id)
      end
    end
redirect to '/index'
end

get '/posts/:id' do
 @post = Post.find(params[:id])
 @title = @post.title
 @tags = @post.tags
 erb :post_show
end

post '/delete/:id' do
  if current_user.posts.find(params[:id])
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
  else
    redirect to ('/index')
  end
end

get '/posts/edit/:id' do
  if current_user.posts.find(params[:id])
    @post = Post.find(params[:id])
    @title = @post.title
    erb :edit
  else
    redirect to '/posts/:id'
  end
end

post '/posts/edit/:id' do
@post = Post.find(params[:id])
 @post.update_attributes(params[:post])

 @post.tags << Tag.find_or_create_by_name(params[:tag])
  redirect to "/posts/#{@post.id}"
end
