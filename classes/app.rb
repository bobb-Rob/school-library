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

  # create new teacher method
  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
    puts "\n"
    puts 'New teacher created successfully'
  end

  # Create new person method
  def create_person
    puts "\n"
    print 'Do you want to create a student (1) or a teacher (2) ? [Input a number] : '
    puts "\n"
    choice = gets.chomp
    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts "\n"
      puts 'Please enter a valid number [1 or 2]'
      puts "\n"
      return
    end
    puts "\n"
    puts 'Person created successfully'
  end

end