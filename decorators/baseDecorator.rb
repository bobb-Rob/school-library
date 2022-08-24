require '../classes/nameable'

class BaseDecorator < Nameable
  def initialize
    @base = Nameable.new
    super()
  end

  def correct_name
    @base.correct_name
  end
end