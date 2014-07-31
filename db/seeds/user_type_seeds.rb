puts "Loading db/seeds/user_type_seeds.rb"

['Admin', 'Student', 'Teacher'].each do |t|
  UserType.find_or_create_by_name(t)
end