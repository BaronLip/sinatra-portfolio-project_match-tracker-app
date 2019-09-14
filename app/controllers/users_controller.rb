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
            flash.now[:errors] = @user.errors.full_messages.join(", ")
            erb :'/users/signup'
        end
    end

    get "/login" do
        erb :'/users/login'
    end

    post "/login" do
        if @user = User.find_by(:email => params[:email]) && @user = User.find_by(:username => params[:username])

            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect '/users/home'
            else
                flash.now[:errors] = "Password is incorrect"
                erb :'/users/login'
            end

        else
            flash.now[:errors] = "Username and Email do not belong to the same user"
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
