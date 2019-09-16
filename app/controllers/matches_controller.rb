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
        
        if params[:opponent] == nil
            flash.now[:errors] = "Please select an opponent!"
            erb :'/matches/new.html'
        else
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
                    flash.now[:errors] = @match.errors.full_messages.join
                    erb :'/matches/new.html'
                end

            else
                flash.now[:errors] = "!!!Scores must have a difference of 2!!!"
                erb :'/matches/new.html'
            end
        
        end        

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
                @opponent = Opponent.find_by(:username => params[:opponent][:username])

                if @opponent == nil
                    @match = Match.find_by(:id => params[:id])
                    @opponent = Opponent.find_by(:id => @match[:opponent_id])
                    @opponents = Opponent.all
                    flash.now[:errors] = "Please select an opponent!"
                    erb :'/matches/edit.html'
                else
                    @match.opponent_id = @opponent.id
                    @opponent.update(params[:opponent])
                    @match.save
                    redirect '/users/home'
                end

            else
                flash.now[:errors] = "!!!Scores must have a difference of 2!!!"
                erb :'/matches/edit.html'
            end
        
        else
            flash.now[:errors] = "This is not your match."
            erb :'/users/home'
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
