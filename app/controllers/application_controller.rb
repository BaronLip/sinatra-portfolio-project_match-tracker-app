require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secret"
        register Sinatra::Flash
    end

    helpers do
        def current_user
            User.find(session[:user_id])
        end

        def logged_in?
			!!session[:user_id]
        end
        
    end


    get "/" do
        @matches = Match.all
        @user = User.all
        @opponent = Opponent.all
        erb :welcome
    end

    get "/signup" do
        erb :signup
    end

    post "/signup" do
        @user = User.new(params[:user])

        if @user.save
            redirect '/login'
        else
            flash[:errors] = @user.errors.full_messages.join(", ")
            redirect '/signup'
        end
    end

    get "/login" do
        erb :login
    end

    post "/login" do
        @user = User.find_by(:email => params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/users/home'
        else
            flash[:errors] = "Try again. Something wasn't right."
            redirect '/login'
        end
    end

end
