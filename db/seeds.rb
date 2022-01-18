# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create([
              {
                email: "admin@gmail.com",
                password: "123456",
                name: "Jhon Doe",
                role: "sabonim",
                belt: "dan_4",
                birth_date: "12/12/1995",
                created_at: DateTime.new,
                updated_at: DateTime.new
              },
              {
                email: "student1@gmail.com",
                password: "123456",
                name: "Student 1",
                role: "student",
                belt: "kup_3",
                birth_date: "12/12/2000",
                created_at: DateTime.new,
                updated_at: DateTime.new
              },
              {
                email: "student2@gmail.com",
                password: "123456",
                name: "Student 2",
                role: "student",
                belt: "kup_2",
                birth_date: "12/12/2010",
                created_at: DateTime.new,
                updated_at: DateTime.new
              }
            ])

p "Seed... Created #{User.count} users"
