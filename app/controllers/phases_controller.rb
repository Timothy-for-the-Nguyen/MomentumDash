class PhasesController < ApplicationController
      def index
           @phases = Phase.all
      end
     
     def show
           @phase = Phase.find(params[:id])
     end
     
     def new
     end
      
     def create
           @phase = Phase.new(article_params)
           @phase.save
           redirect_to @phase
     end 
      
     private
     def article_params
           params.require(:phase).permit(:title,:text,:status_type)
     end
end
