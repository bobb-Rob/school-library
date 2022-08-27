require 'date'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

# rubocop:disable Metrics/MethodLength, Metrics/ClassLength
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
    puts "\n"
    puts 'Book successfully created'
    puts "\n"
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

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) ? [Input a number] : '
    puts "\n"
    get_choice = lambda do
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
        get_choice.call
      end
      puts "\n"
    end
    get_choice.call
  end

  def list_people
    if @people.empty?
      puts 'No person is registered in the library'
      return
    end
    @people.each do |person|
      puts "[#{person.class}] Name : #{person.name} | ID : #{person.id} | Age : #{person.age}"
      puts "\n"
    end
  end

  def create_rental
    if @books.size.zero?
      puts "\n No books in the library\n"
    elsif @people.size.zero?
      puts 'No one registered in the library'
      puts "\n"
    else
      create_rental_helper
    end
  end

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
      person_id = gets.chomp
      @rentals.each do |rental|
        if rental.person.id.to_i == person_id.to_i
          puts "Date : #{rental.date}, Book \"#{rental.book.title}\" by : #{rental.book.author}"
        end
      end
    end
  end

  private

  def valid_date?(str, format = '%Y/%m/%d')
    Date.strptime(str, format)
  rescue StandardError
    false
  end

  def number?(obj)
    obj = obj.to_s unless obj.is_a? String
    /\A[+-]?\d+(\.\d+)?\z/.match(obj)
  end

  def create_student
    print 'Name: '
    name = gets.chomp
    check_age = lambda do
      print 'Age: '
      age = gets.chomp
      puts "\n"
      if number? age
        student = Student.new(age, name, nil)
        @people << student
        puts "\n"
        puts 'New student created successfully'
      else
        puts 'Please input a number as age must be a number'
        puts "\n"
        check_age.call
      end
    end
    check_age.call
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp
    check_age = lambda do
      print 'Age: '
      age = gets.chomp
      puts "\n"
      if number? age
        print 'Specialization: '
        specialization = gets.chomp
        teacher = Teacher.new(specialization, age, name)
        @people << teacher
        puts "\n"
        puts 'New teacher created successfully'
      else
        puts 'Please input a number as age must be a number'
        puts "\n"
        check_age.call
      end
    end
    check_age.call
  end

  def create_rental_helper
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
    check_date = lambda do
      print 'Date (YYYY/MM/DD) : '
      date = gets.chomp.to_s
      if valid_date? date
        rental_obj = Rental.new(date, @books[marked_book - 1], @people[rental_person - 1])
        @rentals.push(rental_obj)
        puts "\n"
        puts 'Rental created successfully'
      else
        puts 'Invalid Date or format: please enter correct date'
        puts "\n"
        check_date.call
      end
    end
    check_date.call
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/ClassLength
