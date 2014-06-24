# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rake
# db:seed (or created alongside the db with db:setup).

user = User.new(id: 1, username: 'admin', email: 'admin@localhost')
user.password = "12345678"
user.save

user = User.new(id: 2, username: 'teacher2', email: 'teacher2@email')
user.password = "12345678"
user.save

user = User.new(id: 3, username: 'student3', email: 'student3@email')
user.password = "12345678"
user.save

user = User.new(id: 4, username: 'student4', email: 'student4@email')
user.password = "12345678"
user.save

user = User.new(id: 5, username: 'teacher1', email: 'teacher1@email')
user.password = "12345678"
user.save

Teacher.create(id: 1, user_id: 5)

Teacher.create(id: 2, user_id: 2)

Assignment.create(id: 1,
                  title: "Listen to 'How Adults Learn' podcast.",
                  description: "Summaries of adult learning research findings",
                  date_assigned: DateTime.new(2014, 5, 23, 23, 5, 32),
                  date_due: DateTime.new(2014, 5, 24, 23, 5, 32),
                  teacher_id: 1)

Assignment.create(id: 2,
                  title: "The Evaluative Cycle of Inquiry",
                  description: "Evaluation for instruction and learning",
                  date_assigned: DateTime.new(2014, 6, 21, 23, 5, 32),
                  date_due: DateTime.new(2014, 6, 22, 23, 5, 32),
                  teacher_id: 1)

Assignment.create(id: 3,
                  title: "The Benfits and Pitfalls of Munging",
                  description: "Learn pros and cons of munging",
                  date_assigned: DateTime.new(2014, 6, 21, 23, 5, 32),
                  date_due: DateTime.new(2014, 7, 22, 23, 5, 32),
                  teacher_id: 1)

Student.create(id: 1, user_id: 3, teacher_id: 1)

Student.create(id: 2, user_id: 4, teacher_id: 1)

Studentassignments.create(id: 1, assignment_id: 1, student_id: 1,
                          status: 'completed')

Studentassignments.create(id: 2, assignment_id: 2, student_id: 1,
                          status: 'assigned')

Studentassignments.create(id: 3, assignment_id: 1, student_id: 2,
                          status: 'assigned')

Studentassignments.create(id: 4, assignment_id: 3, student_id: 1,
                          status: 'assigned')
