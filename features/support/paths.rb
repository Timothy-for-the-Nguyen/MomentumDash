# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/home'

    when /^the create account\s?page$/
      '/createaccount'
      
    when /^the create admin page$/
      '/admins/new'
    
    when /^the all admin accounts\s?page$/
      '/admins'
      
    when /^the admin profile\s?page$/
      '/admin_account'
      
    when /^the instructor profile page for "(.*)"$/
      edit_instructor_path(Instructor.find_by_email($1).id)
      
    when /^the all instructors page$/
      instructors_path
      
    when /^the course\s?page$/
      '/courses'
      
    when /^the new course\s?page$/
      '/courses/new'
      
    when /^the edit course page for course "(.*)"/
      edit_course_path(Course.find_by_code($1).id)
    
    when /^the remove course page for course "(.*)"/
      remove_course_path(Course.find_by_code($1).id)

    when /^the login page$/
      '/login'
    
    when /^the new session\s?page$/
      '/sessions/new'

    when /^the section page for course "(.*)"$/
      course_sections_path(Course.find_by_code($1).id)
      
    when /^the new section page for course "(.*)"$/
      new_course_section_path(Course.find_by_code($1))
      
    when /^the remove section page for section "(.*)"$/
      remove_section_path(Section.find_by_number($1))
      
    when /^the projects page for section "(.*)"$/
      section_projects_path(Section.find_by_number($1))
      
    when /^the projects page for section number "(.*)" semester "(.*)" year "(.*)"$/
      section_projects_path(Section.find_by(number: $1, semester: $2, year: $3))
      
    when /^the new project page for section "(.*)"$/
      new_section_project_path(Section.find_by_number($1))
      
    when /^the roster page for section "(.*)"$/
      section_roster_path(Section.find_by_number($1))

    when /^the edit project page for project "(.*)"$/
      edit_project_path(Project.find_by_name($1))
      
    when /^the patch project page for project "(.*)"$/
      project_path(Project.find_by_name($1))

    when /^the remove project page for project "(.*)"$/
      remove_project_path(Project.find_by_name($1))
      
    when /^the new team page for project "(.*)"$/
      new_project_team_path(Project.find_by_name($1))
      
    when /^the teams page for project "(.*)"$/
      "/projects/#{Project.find_by_name($1).id}/teams"
      
    when /^the edit team page for team "(.*)"$/
      edit_team_path(Team.find_by_name($1))
      
    when /^the show team page for team "(.*)"$/
      team_path(Team.find_by_name($1))
      
    when /^the patch team page for team "(.*)"$/
      team_path(Team.find_by_name($1))
      
    when /^the remove team page for team "(.*)"$/
      remove_team_path(Team.find_by_name($1))
      
    when /^the index team page for section "(.*)"$/
      section_teams_path(Section.find_by_number($1))

    when /^the create skill\s?page$/
      '/skills/new'
      
    when /^the student account page for student "(.*)"$/
      edit_student_path(Student.find_by_id(Student.find_by_email($1).id))
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
