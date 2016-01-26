# Homepage (Root path)

helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get 'songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

post '/songs' do
  if current_user
    @song = Song.new(
      title:   params[:title],
      artist:  params[:artist],
      url:     params[:url],
      user:    current_user
      )
    if @song.save
      redirect '/songs'
    else
      erb :'songs/new'
    end
  else
    redirect '/login'
  end
end

get '/login' do
  erb :'/login'
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username, password: password)

  if user
    session[:user_id] = user.id
    redirect '/songs'
  else
    session.delete(:user_id)
    redirect '/register'
  end
end

get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(
  username: params[:username],
  password: params[:password]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/songs'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/login'
end

get '/songs/new' do
  erb :'songs/new'
end

post '/upvote' do
  if current_user
    @upvote = Upvote.new(
      song_id:  params[:song_id],
      user:  current_user
      )
    # binding.pry
    if @upvote.save
      redirect '/songs'
    end
  end
end
