#Candidates
candidate10 = User.create!(email: 'candidate10@test.com', password: '1234567')
candidate11 = User.create!(email: 'candidate11@test.com', password: '1234567')
candidate12 = User.create!(email: 'candidate12@test.com', password: '1234567')

#Headhunters
headhunter10 = User.create!(email: 'headhunter10@test.com', password: '1234567', role: 'headhunter')
headhunter11 = User.create!(email: 'headhunter11@test.com', password: '1234567', role: 'headhunter')
headhunter12 = User.create!(email: 'headhunter12@test.com', password: '1234567', role: 'headhunter')

#Admins
User.create!(email: 'admin10@test.com', password: '1234567', role: 'admin')

#Profiles
profile10 = Profile.create!(name: 'Lucas Pereira', social_name: 'Lukinhas', date_of_birth: '02-07-1985', 
                            formations: 'Administrador', xp: 'Estagiei na plock por 2 anos', 
                            user: candidate10)
profile10 = Profile.create!(name: 'Matheus de Andrade Cardoso', social_name: 'Matheus', 
                            date_of_birth: '15-12-1995', formations: 'Ator na belas artes', 
                            xp: 'Participei de varos filmes brasileiros um dos mais famossos do acre potter', 
                            user: candidate11)

#Vacancy jobs
vacuancy_job10 = VacuancyJob.create!(title: 'Ator - WarnerBros', 
                                   description: 'Papel para um soldado da rússia', 
                                   ability_description: 'Interpretação sem um braço', 
                                   initial_salary: 8000, end_salary: 12000, level: 'Especialista', 
                                   limit_date: '30-05-2020', addresse: 'Rua das petalas N21', 
                                   user: headhunter10)
vacuancy_job11 = VacuancyJob.create!(title: 'Administrador - BolhasAzuis', 
                                   description: 'Administrar todas as emtregas de sabão', 
                                   ability_description: 'Ter o conhecimento imtermediario de excel', 
                                   initial_salary: 5000, end_salary: 12000, level: 'Diretor', 
                                   limit_date: '30-05-2020', addresse: 'Rua das petalas N21', 
                                   user: headhunter11)

#Job applications
job_application10_2 = JobApplication.create!(vacuancy_job: vacuancy_job11, user: candidate10, 
                                             comment: 'É oque eu gosto de fazer, e tenho experiencia na area')
job_application10_2 = JobApplication.create!(vacuancy_job: vacuancy_job10, user: candidate10, 
                                             comment: 'Estou na area agora e sou perfeito para essa vaga')
job_application11_1 = JobApplication.create!(vacuancy_job: vacuancy_job10, user: candidate11, 
                                             comment: 'É oque eu gosto de fazer, e tenho experiencia na area')
job_application11_1 = JobApplication.create!(vacuancy_job: vacuancy_job11, user: candidate11, 
                                             comment: 'Estou na area agora e sou perfeito para essa vaga')