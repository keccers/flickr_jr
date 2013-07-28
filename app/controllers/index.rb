get '/' do
@photos = Photo.all
erb :index
end


post '/login' do

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


