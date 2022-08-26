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

end