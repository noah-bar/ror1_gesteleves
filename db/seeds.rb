# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

dean = Dean.create(first_name: "François", last_name: "Perrier", email: "francois.perrier@eduvaud.ch", password: "cpnv123")
teacher1 = Teacher.create(first_name: "Max", last_name: "Francopa", email: "max.francopa@eduvaud.ch", password: "cpnv123")
student1 = Student.create(first_name: "Harry", last_name: "Potter", email: "harry.potter@eduvaud.ch", password: "cpnv123")
student2 = Student.create(first_name: "Ron", last_name: "Weasley", email: "ron.weasley@eduvaud.ch", password: "cpnv123")
maths = Branch.create(name: "Maths")
english = Branch.create(name: "English")
french = Branch.create(name: "French")
classroom = Classroom.create(name: "STI1A", start_at: 2022, end_at: 2024, teacher_id: teacher1.id, student_ids: [student1.id, student2.id])
semester1 = Semester.create(year: 2024, number: 1)
semester2 = Semester.create(year: 2024, number: 2)

lesson1 = Lesson.create(classroom_id: classroom.id, branch_id: maths.id, teacher_id: teacher1.id, semester_id: semester1.id)
lesson2 = Lesson.create(classroom_id: classroom.id, branch_id: english.id, teacher_id: teacher1.id, semester_id: semester2.id)

exam1 = Exam.create(lesson_id: lesson1.id, name: "Exam 1", weight: 1, date: Date.today)
exam2 = Exam.create(lesson_id: lesson1.id, name: "Exam 2", weight: 1, date: Date.today)
exam3 = Exam.create(lesson_id: lesson2.id, name: "Exam 1", weight: 1, date: Date.today)

Note.create(student_id: student1.id, exam_id: exam1.id, value: 5.0)
Note.create(student_id: student2.id, exam_id: exam1.id, value: 3.5)
Note.create(student_id: student1.id, exam_id: exam2.id, value: 4.5)
Note.create(student_id: student2.id, exam_id: exam2.id, value: 4.0)
Note.create(student_id: student1.id, exam_id: exam3.id, value: 6.0)
Note.create(student_id: student2.id, exam_id: exam3.id, value: 3.0)
