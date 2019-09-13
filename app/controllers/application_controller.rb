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
        erb :'/users/welcome'
    end

    

end
