require_relative 'provisioner_do'

students = [
    "journaling",
    "warmitup",
    "mentorship",
    "jobbasket"
  ]

pro = Provisioner::DO.new
students.each do |student|
  name = student.downcase.scan(/\w/).join
  droplet = pro.provision_server(name)
  puts "Provisioned #{name}: #{droplet.inspect}"
end
