User.insert_all([
                  {
                    email: "admin@gmail.com",
                    encrypted_password: User.new.send(:password_digest, '123456'),
                    name: "Jhon Doe",
                    role: "teacher",
                    belt: :dan4,
                    birth_date: "12/12/1995",
                    created_at: DateTime.new,
                    updated_at: DateTime.new
                  },
                  {
                    email: "student1@gmail.com",
                    encrypted_password: User.new.send(:password_digest, '123456'),
                    name: "Student 1",
                    role: "student",
                    belt: :kup10,
                    birth_date: "12/12/2000",
                    created_at: DateTime.new,
                    updated_at: DateTime.new
                  },
                  {
                    email: "student2@gmail.com",
                    encrypted_password: User.new.send(:password_digest, '123456'),
                    name: "Student 2",
                    role: "student",
                    belt: :kup8,
                    birth_date: "12/12/2010",
                    created_at: DateTime.new,
                    updated_at: DateTime.new
                  },
                  {
                    email: "student3@gmail.com",
                    encrypted_password: User.new.send(:password_digest, '123456'),
                    name: "Student number three",
                    role: "student",
                    belt: :kup8,
                    birth_date: "12/12/2010",
                    created_at: DateTime.new,
                    updated_at: DateTime.new
                  },
                  {
                    email: "student4@gmail.com",
                    encrypted_password: User.new.send(:password_digest, '123456'),
                    name: "Student number four",
                    role: "student",
                    belt: :kup8,
                    birth_date: "12/12/2010",
                    created_at: DateTime.new,
                    updated_at: DateTime.new
                  },
                  {
                    email: "student5@gmail.com",
                    encrypted_password: User.new.send(:password_digest, '123456'),
                    name: "Student number_five",
                    role: "student",
                    belt: :kup8,
                    birth_date: "12/12/2010",
                    created_at: DateTime.new,
                    updated_at: DateTime.new
                  }
                ])

user = User.first

Group.insert_all([
                   {
                     user_id: user.id,
                     name: "Principiate",
                     from_time: "16:00",
                     to_time: "17:00",
                     days_of_the_week: { sunday?: false, monday?: true, tuesday?: true, wednesday?: true,
                                         thursday?: true, friday?: true, saturday?: false },
                     created_at: DateTime.new,
                     updated_at: DateTime.new
                   },
                   {
                     user_id: user.id,
                     name: "Intermediate",
                     from_time: "17:00",
                     to_time: "18:00",
                     days_of_the_week: { sunday?: false, monday?: false, tuesday?: true, wednesday?: true,
                                         thursday?: true, friday?: true, saturday?: false },
                     created_at: DateTime.new,
                     updated_at: DateTime.new
                   },
                   {
                     user_id: user.id,
                     name: "Advanced",
                     from_time: "18:00",
                     to_time: "20:00",
                     days_of_the_week: { sunday?: false, monday?: true, tuesday?: false, wednesday?: true,
                                         thursday?: false, friday?: true, saturday?: false },
                     created_at: DateTime.new,
                     updated_at: DateTime.new
                   },
                   {
                     user_id: user.id,
                     name: "Testing",
                     from_time: "09:00",
                     to_time: "15:00",
                     days_of_the_week: { sunday?: true, monday?: true, tuesday?: true, wednesday?: true,
                                         thursday?: true, friday?: true, saturday?: true },
                     created_at: DateTime.new,
                     updated_at: DateTime.new
                   }
                 ])

group = Group.first
students = User.where(role: ["student"]).select(:id)

GroupMember.create([
                     students.map { |student| { user_id: student.id, group_id: group.id } }
                   ])

StudentInformation.create([
                            students.map do |student|
                              {
                                ocupation: "Preparatory student",
                                civil_status: "Single",
                                tutor_name: "Clark Devlin",
                                cellphone: "3121230011",
                                health_insurance: "1234567890",
                                user_id: student.id
                              }
                            end
                          ])

LearningResource.create([
                          { name: "Kicho Palya", description: "Sibolize 'the seed' of the student", belt: 10,
                            user_id: user.id },
                          { name: "Palgue Sayan", description: "I don't know what simbolize", belt: 7,
                            user_id: user.id },
                          { name: "Balzek", description: "I don't know what does that mean", belt: 11,
                            user_id: user.id }
                        ])

Attendance.create([
                    students.map { |student| { user: student, group: group, date: Date.yesterday, present: false } }
                  ])
Attendance.create([
                    students.map do |student|
                      { user: student, group: group, date: Date.today, present: true }
                    end
                  ])

StudentsLearningResource.create([
                                  students.map do |student|
                                    { user_id: student.id, learning_resource_id: LearningResource.first.id }
                                  end
                                ])

Review.create([
                students.map do |student|
                  { review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                    learning_resource_id: LearningResource.first.id, teacher_id: User.first.id, student_id: student.id }
                end
              ])
Review.create([
                students.map do |student|
                  { review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", teacher_id: User.first.id,
                    student_id: student.id }
                end
              ])

p "Seed... Created #{User.count} users"
p "Seed... Created #{Group.count} groups"
p "Seed... Created #{GroupMember.count} member lists"
p "Seed... Created #{StudentInformation.count} student information"
p "Seed... Created #{LearningResource.count} learning resources"
p "Seed... Created #{Attendance.count} attendances"
p "Seed... Created #{StudentsLearningResource.count} Students learning resources"
p "Seed... Created #{Review.count} Reviews"
