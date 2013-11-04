enable :sessions

get '/sign_up' do

erb :sign_up
end

post '/' do
	@user_name = params[:user]
	@password = params[:password]
	@returning_user = User.authenticate(@user_name, @password)
	if @returning_user
		session[:id] = User.find_by_name(@user_name)
		redirect to ('/index')
	else
		redirect to ('/')
	end
end

post '/sign_up' do
	@user_new = User.create(name: params[:name],password: params[:password], email: params[:email])
	@user_id = @user_new.id
		if @user_id
			session[:id] = @user_id
			redirect to ('/index')
		else
			session[:failed] = true
			session[:errors] = @user_new.errors
			redirect to ('/sign_up')
		end
end

get '/logout' do
	session.clear
	redirect to('/')
end