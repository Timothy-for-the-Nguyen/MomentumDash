class IterationsController < ApplicationController
    
    def index
       
       @team = Team.find(params[:team_id])
       @iteration = @team.iterations.find(params[:id])
       
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
        @iteration = @team.iterations.find(params[:id])
        @update = @iteration.update(iter_params)
        if @team.update_helper.nil?
            @team.update_helper = 1
        else
        i = 1 +  @team.update_helper
        end 
        @team.update_attributes(:update_helper=> i)
       # @team.iteration_update = @team.iterations.find(params[:id]).updated_at
        flash[:notice] = "Iteration was successfully updated."
        redirect_to team_path(@team)
        #@team.last_update = @iterations.last_update
    end 
   
   def destroy
      @team = Team.find(params[:team_id])
      @team.iterations.find(params[:id]).destroy
      flash[:notice] = "Iteration was successfully destroyed."
      redirect_to team_path(@team)
   end 
   
    
    private
        def iter_params
            params.require(:iteration).permit(:status,:comments,:teacher_status,:teacher_comment)
        end 
end
