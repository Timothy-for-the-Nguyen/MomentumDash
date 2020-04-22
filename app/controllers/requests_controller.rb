class RequestsController < ApplicationController
	def new
		@section = Section.find_by_id(params[:section_id])
		@request = section.requests.new
	end

	def create
		@section = current_section
		@request = Request.new(params[:request])
	end

	def show
		
    end

	def edit
		@request = Request.where(section_id: params[:section_id])
	end

	def index
    	@requests = Request.all
  	end

    def update

    end

    def destroy

    end

  	def decision
  		@request = Request.where(section_id: params[:section_id])
    	if params[:decision] == true
     		@request.update(accepted: true)
    	end
  	end
end
