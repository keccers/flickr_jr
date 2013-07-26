get '/' do
@user = User.find(session[:id])
@photos = Photo.all
erb :index
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

#######  Users  #######

post '/login' do
@user = User.authenticate(params[:name], params[:password])
  if @user
      if request.xhr?
      session[:id] = @user.id 
      erb :_login_form, layout: false
    else
      redirect '/'
    end
  else
    @errors = ['This username and password combination is invalid.']
    @photos = Photo.all
    erb :index
  end
end


get '/register' do
  erb :sign_up
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    @errors = @user.errors
    erb :sign_up
  end
end


