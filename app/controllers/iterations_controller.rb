class IterationsController < ApplicationController
    
    
    def create
        @team = Team.find(params[:team_id])
        @iterations = @team.iterations.create("status"=>"hello")
        redirect_to team_path(@team)
    end 
    
   
    
    private
        def iter_params
            params.require(:iteration).permit( :status,:comments)
        end 
end
