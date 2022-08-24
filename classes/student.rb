require './person'

class Student < Person
  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def get_name
    @name
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

samuel = Person.new(19, "Samuel", parent_permission: false)

daniel = Student.new("Year two",23, 'daniel', parent_permission: false)

p daniel.get_name

p samuel