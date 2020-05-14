#Candidates
User.create!(email: 'candidate1@test.com', password: '1234567')

#Headhunters
User.create!(email: 'headhunter1@test.com', password: '1234567', role: 'headhunter')

#Admins
User.create!(email: 'admin1@test.com', password: '1234567', role: 'admin')