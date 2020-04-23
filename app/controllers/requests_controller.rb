class RequestsController < ApplicationController
	def new
		@section = Section.find_by_id(params[:section_id])
		@request = section.requests.new
	end

	def create
		@section = Section.find_by_id(params[:section_id])
		@request = Request.new(params[:request])
	end

	def accepted
		@section = Section.find_by_id(params[:section_id])
		@request = @section.requests.find_by_id(params[:section_id])
		puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    	puts @student.id.inspect
    	puts @course.inspect
    	puts @section.inspect
    	puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	end

	def denied
		
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
