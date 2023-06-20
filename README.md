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
- A way or button to clone or save te status of the database (because this project ath the beginning will be only local).
- Bonification of 10% of the amount of a payment if .... (which rule will be working here?).
- Download bulma styles and save in this project folder.
- delete 'register techer' button (disable is not needed that functionality yet).
- Bug on view of penmding debt.
- Show only pendings debts in view table view.
- Option to show all debts and history of debts.

<br/><br/>
DOING
- Add default montly payment to each student in form view and student view.

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