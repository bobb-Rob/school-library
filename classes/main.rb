require_relative 'app'

class TempMain
  def self.display_options
    puts 'Please choose an option by entering a number:
    1 - List all books.
    2 - List all people.
    3 - Create a person (teacher or student, not a plain Person).
    4 - Create a book.
    5 - Create a rental.
    6 - List all rentals for a given person id.
    7 - Exit
    '
    Integer(gets.chomp)
  end
  app = App.new

  loop do
    case display_options
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals
    when 7
      puts "\n"
      puts 'Thank you for using this app!'
      puts "\n"
      exit
    else
      puts "\n"
      puts 'Invalid option.'
      puts 'Enter a number between 1 and 7'
    end
  end
end

def main
  TempMain.new
end

main
