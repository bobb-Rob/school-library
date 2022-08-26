require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def create_book
    print 'Title : '
    title = gets.chomp
    print 'Author : '
    author = gets.chomp
   
    book = Book.new(title, author)
    @books.push(book)
  end

end