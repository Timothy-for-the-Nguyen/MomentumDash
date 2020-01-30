base_admins = [
{:name => 'Admin', :email => 'admin@admin.com', :password => 'password1!'}
]

base_inst = [
      {:name => 'Rich', :email => 'prof@prof.com', :password => 'password!'}

]
base_admins.each do |admin|
  Admin.create(admin)
end 
base_inst.each do |inst|
  Instructor.create(inst)
end