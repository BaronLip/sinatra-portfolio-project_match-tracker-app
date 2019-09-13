class UsersController < ApplicationController

    get "/signup" do
        erb :'/users/signup'
    end

    post "/signup" do
        @user = User.new(params[:user])
                
        if @user.save
            session[:user_id] = @user.id
            redirect '/users/home'
        else
            flash[:errors] = @user.errors.full_messages.join(", ")
            redirect '/users/signup'
        end
    end

    get "/login" do
        erb :'/users/login'
    end

    post "/login" do
        @user = User.find_by(:email => params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/users/home'
        else
            flash.now[:errors] = "Try again. Something wasn't right."
             erb :'/users/login'
        end
    end

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
