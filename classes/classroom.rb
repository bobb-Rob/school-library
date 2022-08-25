class Classroom
  attr_accessor :label
  attr_reader :classroom

  def initialize(label)
    @label = label
    @classroom = []
  end

  def add_student(student)
    @classroom.push(student)
    student.classroom = self
  end
end
