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
  
   def list_books
    if @books.empty?
      puts "\n"
      puts 'No books in the library'
      return
    end
    @books.each do |book|
      puts "Title : #{book.title} | Author : #{book.author}"
    end
  end

  # create new student method
  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp

    student = Student.new(age, name, nil)
    @people << student
    puts "\n"
    puts 'New student created successfully'
  end

end