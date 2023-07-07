# Asociación Mexicana AMMDK

A common control of TKD students of Colima

The Taekwondo is the second most popular sport in mexico just lower than the Soccer. <br/>
Each teacher can has many schools and each school can has too many students. <br/>
Each student has his own growth path whose representate a single path that need be personalize by the teacher and manage by the student disponibility. This can be a complet hell for TKD teachers.<br/>


This project is created to help the teacher to manage his shcools and that students growth paths.
<br/><br/>
### Which problems solve?
* Manage teacher's students.
* Manage students growth paths.
* Manage learning resources to the students.
* Manage attendance record of students.
* Manage official events and required documentation.


<br/><br/>

### Main models puporsed:
* Users. To manage Teacher and students information
* Growth Paths. This resource has all history of reviews from teacher to the students such as writed reviews or advices, asigned learning resources and upgrades in belts
* Attendance.
* Groups.
* Events. There are many types of events and each one has specifiq requirements (some of them can require special document to registration)
* Documents.
* Learning Resources. Susch as videos, images, documents, writed descriptions etc.


<br/><br/>

## Development Process
 > Any help is welcome 🫢

PENDING TASKS
- Bonification of 10% of the amount of a payment if .... (which rule will be working here?).
- Download bulma styles and save in this project folder.
- Bug on view of pending debt.
- Option to show all debts and history of debts.
- disable dependan bot
- Prevent that monthly payments is aplied many times for the same month
- Take attendance view should has default value if attendance was taken for that group

<br/><br/>
DOING
- delete 'register techer' button (disable is not needed that functionality yet).
- Move Button of new debt in dashboard.

<br/><br/>
COMPLETE
- Add default monthly payment to each student in form view and student view.
- Show only pendings debts in view table view.
- Format dates in UTC

<br/><br/>

## Important task
- A way or button to clone or save te status of the database (because this project ath the beginning will be only local).
> see resource:  https://www.novell.com/documentation/teamworks-18/tw-maint/data/b17mf7wd.html?view=print
 use this command  $ pg_dump -U <elbryan>  tkd_control_development > ./exampleBackup.sql

<br/><br/>

## Contribute
> Any help is welcome 🤍

- Fork the project to your workspace.

- Clone the repository:
> `git clone git@github.com:<your-work-space-here>/ammdk_colima.git`

- Download dependencies:
> `bundle install`

- Initialize the database:
> `rails db:seetup`

- Run seed (just for development process):
> `rails db:seed` or `rails db:seed:replant` 

- Start server
> `rails server`