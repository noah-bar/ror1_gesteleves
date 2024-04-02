# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(person)
    person ||= Person.new
    if person.type == 'Dean'
      can :manage, Classroom
      can :manage, Person
      can :manage, Semester
      can :manage, Note
      can :manage, Exam
      can :manage, Lesson
      can :manage, Branch

    end

    if person.type == 'Teacher'
      can :read, Lesson, { teacher_id: person.id }
      can :manage, Exam, { lesson: { teacher_id: person.id }}
      can :manage, Note, { exam: { lesson: { teacher_id: person.id } } }
    end

    if person.type == 'Student'
      can :read, Student, { id: person.id }
    end
  end
end
