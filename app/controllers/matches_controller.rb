class MatchesController < ApplicationController

    get '/matches/new' do
        @opponents = Opponent.all
        erb :'/matches/new.html'    
    end
    
    post '/matches/new' do
        # binding.pry
        @opponents = Opponent.all

        if params[:match][:user_score].to_i - params[:match][:opponent_score].to_i == 2 || params[:match][:opponent_score].to_i - params[:match][:user_score].to_i == 2
            
            @match = Match.new(params[:match])

            @opponent = Opponent.create(:username => params[:opponent][:username])
            if @opponent.username == "New Opponent"
                redirect '/opponents/new'
            else @opponent = Opponent.find_by(:username => params[:opponent][:username])
            end

            @match.opponent_id = @opponent.id

            if @match.save
                @matches = Match.where(:user_id => session[:user_id])
                redirect '/users/home'
            else
                flash[:errors] = @match.errors.full_messages
                redirect '/matches/new'
            end

        else
            flash[:errors] = "!!!Scores must have a difference of 2!!!"
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
        @opponent = Opponent.find_by(:id => @match[:opponent_id])
        @opponents = Opponent.all
        erb :'/matches/edit.html'    
    end
    
    patch "/matches/:id/edit" do
        @match = Match.find_by(:id => params[:id])
        @opponent = Opponent.find_by(:id => @match[:opponent_id])
        @match.update(params[:match])
        @match.save        
        redirect '/users/home'
    end

    delete '/matches/:id/delete' do
        @match = Match.find_by(:id => params[:id])
        @match.destroy
        redirect '/users/home'
    end
end
