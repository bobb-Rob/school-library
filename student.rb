require './person'

class Student < Person
  def initialize(classroom, age, name = 'unknown')
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
