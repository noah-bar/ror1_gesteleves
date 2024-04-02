# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(person)
    person ||= Person.new  # Assume une personne non connectée par défaut
    case person.type
    when 'Dean'
      can :manage, [Classroom, Person, Semester, Note, Exam, Lesson, Branch]
    when 'Teacher'
      can :read, Lesson, teacher_id: person.id
      can :manage, Exam, lesson: { teacher_id: person.id }
      can :manage, Note, exam: { lesson: { teacher_id: person.id } }
    when 'Student'
      can :read, Student, id: person.id
    end
  end
end
