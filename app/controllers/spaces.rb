class Makersbnb < Sinatra::Base
  get '/spaces' do
    erb :'spaces/index'
  end

  get '/spaces/show' do
    @spaces = Space.all
    erb :'spaces/show'
  end

  get '/spaces/host' do
    erb :'spaces/host'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    Space.create(name: params[:name],
                 description: params[:description],
                 price: params[:price],
                 available_from: params[:available_from],
                 available_to: params[:available_to],
                 owner: current_user.id)
    redirect '/spaces'
  end

  get '/spaces/update' do
    @spaces = Space.all(owner: current_user.id)
    erb :'spaces/update'
  end

  post '/spaces/update' do
    @space_to_update = Space.get(params[:id])
    erb :'spaces/modify'
  end

  post '/spaces/modify' do
    Space.first(id: params[:space_to_update_id]).update(
                 name: params[:name],
                 description: params[:description],
                 price: params[:price],
                 available_from: params[:available_from],
                 available_to: params[:available_to])
    redirect '/spaces/show'
  end
end
