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
		
		@request = Request.find_by_id(params[:section_id])
		@section = Section.find_by_id(@request.section_id)
		@student = Student.find_by_email(@request.email)
		@section.students << @student
    	@request.update(accepted: true)
    	flash[:notice] = "Student #{@request.name} was successfully added to course."
      	redirect_to section_requests_path(@section)
	end

	def denied
		@request = Request.find_by_id(params[:section_id])
		@section = Section.find_by_id(@request.section_id)
    	@request.update(accepted: true)
    	flash[:warning] = "Student #{@request.name} was denied from course."
      	redirect_to section_requests_path(@section)
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
