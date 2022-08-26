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
    puts "\n"
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
  end

  # List all people method
  def list_people
    if @people.empty?
      puts "\n"
      puts 'No person is registered in the library'
      return
    end
    @people.each do |person|
      puts "[#{person.class}] Name : #{person.name} | ID : #{person.id} | Age : #{person.age}"
    end
  end

   # Create new rental method
  def create_rental
    if @books.size.zero?
      puts 'No books in the library'
    elsif @people.size.zero?
      puts 'No one registered in the library'
    else
      puts "\n"
      puts 'Select a book from the following list by number'

      @books.each_with_index do |book, index|
        puts "No. #{index + 1}) - Book Title : #{book.title} | Author : #{book.author}"
      end
      marked_book = gets.chomp.to_i
      puts "\n"
      puts 'Select a person from the following list by number (not id)'
      puts "\n"
      @people.each_with_index do |person, index|
        puts "No. #{index + 1}) - Name : #{person.name} |ID : #{person.id} | Age : #{person.age}"
      end
      puts "\n"
      rental_person = gets.chomp.to_i
      print 'Date (YYYY/MM/DD) : '
      date = gets.chomp.to_s

      # Instantiating a rental object
      rental_obj = Rental.new(date, @books[marked_book - 1], @people[rental_person - 1])
      @rentals.push(rental_obj)
      puts "\n"
      puts 'Rental created successfully'
    end
  end

  # List all rentals method
  def list_rentals
    puts "\n"
    if @rentals.empty?
      puts 'No rent is registered in the library'
    else
      puts 'Select a person from the following list by ID'
      @people.each do |person|
        puts "ID : #{person.id} => #{person.name}"
      end
      puts "\n"
      print "Enter person\'s ID :"
      person = gets.chomp
      puts "\n"
      @rentals.each do |rental|
        if rental.person.id.to_i == person.to_i
          puts "Date : #{rental.date}, Book \"#{rental.book.title}\" by : #{rental.book.author}"
        end
      end
    end
  end
end