class MatchesController < ApplicationController

    helpers do
        def difference_of_two?
            params[:match][:user_score].to_i - params[:match][:opponent_score].to_i > 1 || params[:match][:opponent_score].to_i - params[:match][:user_score].to_i > 1
        end
    end
    
    get '/matches/new' do
        @opponents = Opponent.all
        erb :'/matches/new.html'    
    end
    
    post '/matches/new' do
        @opponents = Opponent.all

        @match = Match.new(params[:match])
        
        @opponent = Opponent.create(:username => params[:opponent][:username])
        
        if @opponent.username == "New Opponent"
            redirect '/opponents/new'
        else @opponent = Opponent.find_by(:username => params[:opponent][:username])
        end
        
        @match.opponent_id = @opponent.id

        if difference_of_two?

            if @match.save
                @matches = Match.where(:user_id => session[:user_id])
                redirect '/users/home'
            else
                flash.now[:errors] = @match.errors.full_messages
                redirect '/matches/new'
            end

        else
            flash.now[:errors] = "!!!Scores must have a difference of 2!!!"
            erb :'/matches/new.html'
        end
        
        # if @opponent = Opponent.find_by(:username => params[:opponent][:username])
        # else @opponent = Opponent.create(params[:opponent])
        # end

        # @opponent = Opponent.find_or_create_by(:username => params[:opponent][:username])
        # Wanted to use find_or_create_by but the additional opponent params are wasted.
    end

    get '/matches/:id/edit' do
        @match = Match.find_by(:id => params[:id])
        
        if @match.user_id == current_user.id
            @opponent = Opponent.find_by(:id => @match[:opponent_id])
            @opponents = Opponent.all
            erb :'/matches/edit.html'
        else
            redirect '/users/home'
        end
    end
    
    patch "/matches/:id/edit" do
        @match = Match.find_by(:id => params[:id])
        @opponent = Opponent.find_by(:id => @match[:opponent_id])
        if @match.user_id == current_user.id
            
            if difference_of_two?
                @match.update(params[:match])
                @opponent.update(params[:opponent])
                redirect '/users/home'
            else
                flash.now[:errors] = "!!!Scores must have a difference of 2!!!"
                erb :'/matches/edit.html'
            end
        
        else
            flash.now[:errors] = "This is not your match."
            redirect '/users/home'
        end
    end

    delete '/matches/:id/delete' do
        @match = Match.find_by(:id => params[:id])
        
        if @match.user_id == current_user.id
            @match.destroy
        end
       
        redirect '/users/home'
    end
end
