require 'faker'
# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rake
# db:seed (or created alongside the db with db:setup).
salt = BCrypt::Engine.generate_salt
encrypted_password = BCrypt::Engine.hash_secret("LaloCarlos", salt)

User.create(id: 1,
            username: 'admin',
            email: 'admin@locahost',
            salt: salt,
            encrypted_password: encrypted_password)

User.create(id: 2,
            username: 'Janice',
            email: 'jbwest@email',
            salt: salt,
            encrypted_password: encrypted_password)

User.create(id: 3,
            username: Faker::Name.name,
            email: Faker::Internet.email,
            salt: salt,
            encrypted_password: encrypted_password)

User.create(id: 4,
            username: Faker::Name.name,
            email: Faker::Internet.email,
            salt: salt,
            encrypted_password: encrypted_password)

User.create(id: 5,
            username: Faker::Name.name,
            email: Faker::Internet.email,
            salt: salt,
            encrypted_password: encrypted_password)

Teacher.create(id: 1,
               user_id: 5)

Teacher.create(id: 2,
               user_id: 2)

Assignment.create(id: 1,
                  title: "Listen to 'How Adults Learn' podcast.",
                  description: "Summaries of adult learning research findings",
                  date_assigned: DateTime.new(2014, 7, 25, 23, 5, 32),
                  date_due: DateTime.new(2014, 7, 26, 23, 5, 32),
                  teacher_id: 1)

Assignment.create(id: 2,
                  title: "The Evaluative Cycle of Inquiry",
                  description: "Evaluation for instruction and learning",
                  date_assigned: DateTime.new(2014, 7, 25, 23, 5, 32),
                  date_due: DateTime.new(2014, 7, 26, 23, 5, 32),
                  teacher_id: 1)

Student.create(id: 1,
               user_id: 3,
               teacher_id: 1)

Student.create(id: 2,
               user_id: 4,
               teacher_id: 1)

Studentassignments.create(id: 1,
                          assignment_id: 1,
                          student_id: 1,
                          status: 'assigned')

Studentassignments.create(id: 2,
                          assignment_id: 2,
                          student_id: 1,
                          status: 'assigned')

Studentassignments.create(id: 3,
                          assignment_id: 1,
                          student_id: 2,
                          status: 'assigned')
