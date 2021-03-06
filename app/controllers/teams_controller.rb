class TeamsController < ApplicationController
  before_action :super_access, only: [:remove, :destroy]
  before_action :find_project, only: [:new, :create]
  
  def index
    if is_instructor_html
      @section = Instructor.find_by_id(session[:user_id]).sections.find_by_id(params[:section_id])
      if @section == nil
        flash[:warning] = "Session is Nil"
        redirect_to new_session_path
      end
    else
      @section = Section.find(params[:section_id])
    end
    @teams = @section.teams
  end
  
  def show
    @team = Team.find(params[:id])
    @iterations = @team.iterations.order('created_at ASC')
  end
  
  def new
    check_super_in_section(@project.section)
    @team = Team.new
  end
  
  def edit
    @team = Team.find(params[:id])
    is_admin_or_student_on_team(@team)
  end
  
  def create
    check_super_in_section(@project.section)
    @team = @project.teams.build(team_create_params)
    if @team.save
      students = params[:team][:student_ids]
      if students
        students.each do |id|
          student = Student.find_by_id(id)
          if student
            @team.students << student
          end
        end
      end
      
      redirect_to section_projects_path(section_id: @project.section)
    else
      render 'new'
    end
  end
  
  def update
    @team = Team.find(params[:id])
    is_admin_or_student_on_team(@team)
    if @team.update_attributes(team_params)
      flash[:notice] = "#{@team.name} was successfully updated."
      redirect_to team_path
    else
      render 'edit'
    end
  end
  
  def update2
    @team = Team.find(params[:id])
    is_admin_or_student_on_team(@team)
    if @team.update_attributes(team_params_iterations)
      flash[:notice] = "#{@team.name} was successfully updated."
      redirect_to team_path
    end
  end
  
  def remove
    @team = Team.find_by_id(params[:id])
    is_super(@team.project.section)
  end
  
  def destroy
    if session[:user] == "admin"
      removed_team = Team.find_by_id(params[:admin][:id])
      check = Admin.find_by_id(session[:user_id])
    elsif session[:user] == "instructor"
      removed_team = Team.find_by_id(params[:instructor][:id])
      check = Instructor.find_by_id(session[:user_id])
    else
      flash[:warning] = "You are not a Admin or Instructor"
      redirect_to home_path
    end
    
    if check
      flash[:notice] = "#{removed_team.name} was successfully deleted."
      @iter = removed_team.iterations
      @iter.each do |thing|
            thing.destroy
        end 
      removed_team.destroy
      redirect_to section_projects_path(removed_team.project.section)
    else
      flash[:warning] = "Incorrect Password!"
      redirect_to remove_team_path(removed_team)
    end
  end
  
  private def team_create_params
    params.require(:team).permit(:name, :version_control_link,
      :production_link, :management_link, :scrum_location, :scrum_time, :iteration1, 
      :iteration2, :iteration3,:iteration4,:status1,
      :status2,:status3,:status4,:iteration_num,:update_helper)
  end
  
  private def team_params
    params.require(:team).permit(:name, :version_control_link,
      :production_link, :management_link, :scrum_location, :scrum_time,:iteration1, 
      :iteration2, :iteration3,:iteration4,:status1,
      :status2,:status3,:status4, :iteration_num,:update_helper, student_ids: [])
  end
  
  private def team_params_iterations
    params.permit(:status1,:status2,:status3,:status4)
  end
  
  private def student_params
    params.require(:team).permit(student_ids: [])
  end
  
  private def find_project
    @project = Project.find(params[:project_id])
  end
  
  private def check_super_in_section(section)
    unless is_student_in_section(current_user,section) || has_section_html(section)
      flash[:warning] = "Unauthorized action"
      redirect_to home_path
    end
  end
  
  private def is_super(section)
    unless has_section_html(section)
      flash[:warning] = "Unauthorized action"
      redirect_to home_path
    end
  end
  
  private def is_admin_or_student_on_team(team)
    unless is_student_in_section(current_user, team.project.section) || has_section_html(team.project.section) || is_instructor_html
      flash[:warning] = "Unauthorized action"
      redirect_to home_path
    end
  end
end
