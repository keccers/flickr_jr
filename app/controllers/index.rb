get '/' do
  @photos = Photo.all
  erb :index
end

post '/login' do
  @user = User.authenticate(params[:username],params[:password])
  session[:id] = @user.id if @user
  redirect '/'
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else 
    @errors = @user.errors.full_messages
    erb :index
  end
end

get '/logout' do
  session[:id] = nil
  redirect '/'
end


#######  Photos  #######
get '/upload' do
  # Upload Photos
end

post '/photo_upload' do
  photo = Photo.new(photo: params[:photo])

  if photo.save
    redirect '/'
  else
    erb :index
  end
end


