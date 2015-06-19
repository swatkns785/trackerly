[![Build Status](https://travis-ci.org/swatkns785/trackerly.svg?branch=master)](https://travis-ci.org/swatkns785/trackerly) [![Code Climate](https://codeclimate.com/github/swatkns785/trackerly.png)](https://codeclimate.com/github/swatkns785/trackerly) [![Coverage Status](https://coveralls.io/repos/swatkns785/trackerly/badge.png)](https://coveralls.io/r/swatkns785/trackerly)

##Tracker.ly

###A tool for school districts to manage teacher and student activity and performance.

###TODO LIST (in no particular order)
```
[ ] Deploy to Heroku
[ ] Draft mock up for Front End
[ ] figure out why school_district_invite can't read school_district_id as foreign_key
[ ] fix ./spec/models/school_district_membership_spec.rb:6 test (related to ^)
[ ] Scope views where necessary to prevent non-admins from performing CRUD
[ ] configure emails for production using Sendgrid
[ ] Assign school district members (educators and administrators) to certain schools
[ ] Create subjects object for school subjects
[ ] Subjects and schools (some schools may not have all subjects)
[ ] Subjects and educators (some teachers only teach certain subjects)
###WAY IN THE FUTURE
[ ] Student users
[ ] Students assigned to schools
[ ] Students assigned to school class sections
[ ] Students assigned to grade levels
[ ] Assignments per class
[ ] Assignment grades (max points, earned points)
[ ] To be continued...(keep the streak alive some more)
```

WIP goals
-Schools should be able to keep track of attendance on a per student basis.
-Student grades are organized per lesson/assignment

###User Stories

####School Districts
```
As a school district administrator
I want to create a school district
So I can keep track of teacher/student performance

Acceptance Criteria:
[x] I should be able to create my school district upon creating an account
[x] At default, nobody else should be the administrator for my school district

Status: Complete
```
```
As a school district's administrator
I want to edit my school district's information
So I can maintain the most up to date information

[x] I must be able edit the school's information from the show page
[x] Upon editing, I see a notice confirming success
[x] I can only edit the district's information if I'm the district admin

Status: Complete
```

####Schools
```
As a school district administrator
I want to create schools for my district
So that I can see what schools are in my district

Acceptance Criteria:
[x] I must be able to add schools from the school district page
[x] I must be able to declare the school's type (elementary, middle, high)
[x] A school must have a name and address, website optional
[x] Upon successfully creating, I receive a notice confirming success

Status: Complete
```
```
As a school district administrator
I want to edit a school's information
So that I can change the details of the school

Acceptance Criteria:
[x] I must be able to edit a school's information from a school district page
[x] Upon successfully editing, I receive a notice confirming success
[x] If I make errors, I'm notified and return to the edit page

Status: Complete
```
```
As a school district administrator
I want to see a list of schools in my district
So that I can see an accurate list

Acceptance Criteria:
[ ] The list of schools must be in alphabetical order
[ ] I must see the list on the school district show page
[ ] Each school must link to it's own respective school show page
```
```
As a school district administrator
I want to change a school's status to 'inactive'
So that it's status is reflected as 'inactive'

Acceptance Criteria:
[x] I must be able to change the status on the edit form
[x] Upon declaring a school 'inactive', I receive confirmation
[ ] Only the district admin can change the status

Status: 2/3 Complete
```
####School District Membership
```
As an unaffiliated user
I want to join a school district
So that I can be affiliated with my school district

[ ] I must be able to find
```

####Teacher Account Invitations
```
As a school district administrator
I want to invite teachers to join Tracker.ly
So that they can have access to all of Tracker.ly's awesome features

Acceptance Criteria:
[ ] I must be able to invite new teachers from the district's page
[ ] I must submit valid email addresses upon sending invitations
[ ] Upon sending email invitations, I see a confirmation message indicating success
[ ] I must see a list of pending invitations

Status: Incomplete
```

####Teachers
```
As a school teacher
I want to view my profile page
So that I can see my information

[ ] I must see my full name, email address, and affiliated school(s)

Status: Incomplete
```

####Grade Levels
```
Need to write user stories for:
[ ] Grade level scoped by school
[ ] Grade level scoped by school district
```

####Subject Categories
```
Need to write user stories for:
[ ]
```

####Subjects
```
Need to write user stories for:
[ ] Adding subjects to a given school
And much more
```
####Students
```
Need to write user stories for:
[ ] Student profile page
[ ] Student views grades

```
####Class Offerings

####Class Offering Sections

####Class Offering Assignments

####Class Offering Exams

####Student Grades

####Attendance

####Students
```
Need to write user stories for:
[ ] Student profile page
[ ] Student views grades

```
