class IterationsController < ApplicationController
    
    
    def create
        @team = Team.find(params[:team_id])
        #@value = @team.iteration_num
        
        @iterations = @team.iterations.create("status"=>"Not submitted")
        
        redirect_to team_path(@team)
    end 
    
   def update
        @team = Team.find(params[:team_id])
        @iterations = team.iterations.update
   end 
    
    private
        def iter_params
            params.require(:iteration).permit( :status,:comments)
        end 
end
