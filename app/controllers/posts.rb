get '/create' do


erb :create
end

post '/create' do
  post=Post.create(:title => params[:title],:body => params[:body])
    params[:name].split(",").each do |tag|
      if Tag.find_by_name(tag.strip) == nil
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
@post = Post.find(params[:id])
@post.destroy
erb :delete
redirect to ('/index')
end

get '/posts/:id/edit' do
@post = Post.find(params[:id])
@title = @post.title


erb :edit
end
post '/posts/:id/edit' do
@post = Post.find(params[:id])
 @post.update_attributes(params[:post])

 @post.tags << Tag.find_or_create_by_name(params[:tag])
  redirect to "/posts/#{@post.id}"
end  
