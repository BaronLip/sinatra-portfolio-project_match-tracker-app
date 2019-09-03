class UsersController < ApplicationController

    get '/users/home' do
        @user = User.find_by(:id => session[:user_id])
        @matches = Match.where(:user_id => session[:user_id])
        erb :'/users/home.html'       
    end

    post "/users/logout" do
        session.clear
        redirect '/'
    end
end
