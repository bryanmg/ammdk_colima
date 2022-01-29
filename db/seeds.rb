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
user = User.last
GroupMember.insert_all([{ user_id: user.id, group_id: group.id }])

p "Seed... Created #{User.count} users"
p "Seed... Created #{Group.count} groups"
