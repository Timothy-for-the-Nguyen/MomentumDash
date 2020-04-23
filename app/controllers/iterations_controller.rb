class IterationsController < ApplicationController
    
    def index
       
       @team = Team.find(params[:team_id])
       @iteration = @team.iterations.all
       
    end 
    
    def create
        @team = Team.find(params[:team_id])
        #@value = @team.iteration_num
        #@iterations = team.iterations.update
        #@team.last_update = @iterations.last_update
        @iterations = @team.iterations.create("team_id"=> @team, "status"=>"Not submitted")
        
        redirect_to team_path(@team)
    end 
    
    def update
        @team = Team.find(params[:team_id])
        @iterations = team.iterations.update
        #@team.last_update = @iterations.last_update
    end 
   
   def destroy
      @team = Team.find(params[:team_id])
      @team.iterations.find(params[:id]).destroy
      redirect_to team_path(@team)
   end 
   
    
    private
        def iter_params
            params.require(:iteration)
        end 
end
