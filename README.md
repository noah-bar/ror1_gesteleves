# Gesteleves Readme
## Description
Gesteleves is an application developed with ruby on rails to manage the grades of ES students.
## Getting started
### Prerequisites
List all dependencies and their version needed by the project as :
- Ruby V3.2.1+
- Rails V7.0.8+
## Launch the application
1. Install dependencies:
    ```
    bundle install
    ```
2. Create database:
    ```
    bin/rails db:create
    ```
3. Launch migrations
    ```
    bin/rails db:migrate
    ```
4. Launch seeds
    ```
    bin/rails db:seed
    ```
5. Run server
   ```
   bin/rails s
   ```

6. You can log in with the following users:    
7. | Role    | Email                       | Password |
      |---------|-----------------------------|----------|
      | Dean    | francois.perrier@eduvaud.ch | cpnv123  |
      | Teacher | max.francopa@eduvaud.ch     | cpnv123  |
      | Student | harry.potter@eduvaud.ch     | cpnv123  |

## Directory structure
```console
Gesteleves
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── app
│   ├── channels
│   │   └── application_cable
│   │       ├── channel.rb
│   │       └── connection.rb
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── branches_controller.rb
│   │   ├── classrooms_controller.rb
│   │   ├── deans_controller.rb
│   │   ├── exams_controller.rb
│   │   ├── lessons_controller.rb
│   │   ├── notes_controller.rb
│   │   ├── person_sessions_controller.rb
│   │   ├── semesters_controller.rb
│   │   ├── students_controller.rb
│   │   └── teachers_controller.rb
│   ├── helpers
│   │   ├── application_helper.rb
│   │   ├── branch_helper.rb
│   │   ├── classrooms_helper.rb
│   │   ├── exams_helper.rb
│   │   ├── lessons_helper.rb
│   │   ├── notes_helper.rb
│   │   ├── person_sessions_helper.rb
│   │   ├── semesters_helper.rb
│   │   ├── student_helper.rb
│   │   └── teachers_helper.rb
│   ├── javascript
│   │   ├── application.js
│   │   └── controllers
│   │       ├── application.js
│   │       ├── exams_controller.js
│   │       └── index.js
│   ├── jobs
│   │   └── application_job.rb
│   ├── mailers
│   │   └── application_mailer.rb
│   ├── models
│   │   ├── ability.rb
│   │   ├── application_record.rb
│   │   ├── branch.rb
│   │   ├── classroom.rb
│   │   ├── classrooms_student.rb
│   │   ├── concerns
│   │   ├── dean.rb
│   │   ├── exam.rb
│   │   ├── lesson.rb
│   │   ├── note.rb
│   │   ├── person.rb
│   │   ├── semester.rb
│   │   ├── student.rb
│   │   └── teacher.rb
│   └── views
│       ├── branches
│       │   ├── _form.html.erb
│       │   ├── edit.html.erb
│       │   ├── index.html.erb
│       │   └── new.html.erb
│       ├── classrooms
│       │   ├── _form.html.erb
│       │   ├── edit.html.erb
│       │   ├── index.html.erb
│       │   ├── new.html.erb
│       │   └── show.html.erb
│       ├── deans
│       │   ├── _form.html.erb
│       │   ├── edit.html.erb
│       │   ├── index.html.erb
│       │   ├── new.html.erb
│       │   └── show.html.erb
│       ├── exams
│       │   └── show.html.erb
│       ├── layouts
│       │   ├── application.html.erb
│       │   ├── mailer.html.erb
│       │   └── mailer.text.erb
│       ├── lessons
│       │   ├── _exam_form.html.erb
│       │   ├── _form.html.erb
│       │   ├── edit.html.erb
│       │   ├── index.html.erb
│       │   ├── new.html.erb
│       │   └── show.html.erb
│       ├── notes
│       ├── person_sessions
│       │   └── new.html.erb
│       ├── semesters
│       │   ├── _form.html.erb
│       │   ├── edit.html.erb
│       │   ├── index.html.erb
│       │   └── new.html.erb
│       ├── students
│       │   ├── _form.html.erb
│       │   ├── edit.html.erb
│       │   ├── index.html.erb
│       │   ├── new.html.erb
│       │   └── show.html.erb
│       └── teachers
│           ├── _form.html.erb
│           ├── edit.html.erb
│           ├── index.html.erb
│           ├── new.html.erb
│           └── show.html.erb
├── bin
│   ├── bundle
│   ├── importmap
│   ├── rails
│   ├── rake
│   └── setup
├── config
│   ├── application.rb
│   ├── boot.rb
│   ├── cable.yml
│   ├── credentials.yml.enc
│   ├── database.yml
│   ├── environment.rb
│   ├── environments
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── importmap.rb
│   ├── initializers
│   │   ├── assets.rb
│   │   ├── content_security_policy.rb
│   │   ├── filter_parameter_logging.rb
│   │   ├── inflections.rb
│   │   └── permissions_policy.rb
│   ├── locales
│   │   └── en.yml
│   ├── master.key
│   ├── puma.rb
│   ├── routes.rb
│   └── storage.yml
├── config.ru
├── db
│   ├── development.sqlite3
│   ├── migrate
│   │   ├── 20240208090826_create_people.rb
│   │   ├── 20240208092546_create_classrooms.rb
│   │   ├── 20240208102705_create_classrooms_students.rb
│   │   ├── 20240229074044_create_branches.rb
│   │   ├── 20240229074912_create_notes.rb
│   │   ├── 20240229080632_create_lessons.rb
│   │   ├── 20240229091222_create_exams.rb
│   │   ├── 20240328080022_create_semesters.rb
│   │   ├── 20240401095903_add_password_column_to_peoples.rb
│   │   └── 20240402132818_add_archived_column_to_branch.rb
│   ├── schema.rb
│   ├── seeds.rb
│   └── test.sqlite3
├── lib
│   └── tasks
├── log
│   └── development.log
├── node_modules
├── public
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── apple-touch-icon-precomposed.png
│   ├── apple-touch-icon.png
│   ├── favicon.ico
│   └── robots.txt
├── storage
├── test
│   ├── application_system_test_case.rb
│   ├── channels
│   │   └── application_cable
│   │       └── connection_test.rb
│   ├── controllers
│   │   ├── branch_controller_test.rb
│   │   ├── classrooms_controller_test.rb
│   │   ├── exams_controller_test.rb
│   │   ├── lessons_controller_test.rb
│   │   ├── notes_controller_test.rb
│   │   ├── person_sessions_controller_test.rb
│   │   ├── semesters_controller_test.rb
│   │   ├── student_controller_test.rb
│   │   └── teachers_controller_test.rb
│   ├── fixtures
│   │   ├── branches.yml
│   │   ├── classroom_students.yml
│   │   ├── classrooms.yml
│   │   ├── deans.yml
│   │   ├── exams.yml
│   │   ├── files
│   │   ├── lessons.yml
│   │   ├── notes.yml
│   │   └── people.yml
│   ├── helpers
│   ├── integration
│   ├── mailers
│   ├── models
│   │   ├── branch_test.rb
│   │   ├── classroom_student_test.rb
│   │   ├── classroom_test.rb
│   │   ├── dean_test.rb
│   │   ├── exam_test.rb
│   │   ├── lesson_test.rb
│   │   ├── note_test.rb
│   │   └── person_test.rb
│   ├── system
│   └── test_helper.rb
└── vendor
    └── javascript

```
## Collaborate
### Commit Message Guidelines
To maintain clarity and consistency in our repository's history, we adhere to the following commit guidelines:
- **Descriptive Messages**: Ensure each commit message clearly describes the changes made.
- **Conventional Commits**: Follow the [Conventional Commits](https://www.conventionalcommits.org/) format, using types like `feat`, `fix`, `refactor`, `style`, `docs`, `test`, `chore`, etc.
### Branching Strategy
We use [Git Flow](https://nvie.com/posts/a-successful-git-branching-model/) as our branching strategy. Please create feature, hotfix, or release branches as appropriate and merge them back into the main branches as per Git Flow guidelines.
### Pull Requests
Open a pull request with a clear title and description for your changes. Link any relevant issues in the pull request description.
## License
This project is open source and available under the [MIT License].
