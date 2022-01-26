User.create([
              {
                email: "admin@gmail.com",
                password: "123456",
                name: "Jhon Doe",
                role: "teacher",
                belt: :dan4,
                birth_date: "12/12/1995",
                created_at: DateTime.new,
                updated_at: DateTime.new
              }
            ])
User.create([
              {
                email: "student1@gmail.com",
                password: "123456",
                name: "Student 1",
                role: "student",
                belt: :kup10,
                birth_date: "12/12/2000",
                created_at: DateTime.new,
                updated_at: DateTime.new
              }
            ])
User.create([
              {
                email: "student2@gmail.com",
                password: "123456",
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
                     created_at: DateTime.new,
                     updated_at: DateTime.new
                   },
                   {
                     user_id: user.id,
                     name: "Intermediate",
                     from_time: "17:00",
                     to_time: "18:00",
                     created_at: DateTime.new,
                     updated_at: DateTime.new
                   },
                   {
                     user_id: user.id,
                     name: "Advanced",
                     from_time: "18:00",
                     to_time: "20:00",
                     created_at: DateTime.new,
                     updated_at: DateTime.new
                   },
                   {
                     user_id: user.id,
                     name: "Testing",
                     from_time: "09:00",
                     to_time: "15:00",
                     created_at: DateTime.new,
                     updated_at: DateTime.new
                   }
                 ])

p "Seed... Created #{User.count} users"
p "Seed... Created #{Group.count} groups"
