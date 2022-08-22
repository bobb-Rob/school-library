require 'securerandom'

class Person
  def initialize(age, name, parent_permission: true)
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor(:name, :age)

  def can_use_services?
    of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end
