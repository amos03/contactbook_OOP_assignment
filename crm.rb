require_relative 'contact'

class CRM

  def initialize(name)
    @name = name 
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts ""
    puts "========================================"
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Delete all contacts'
    puts '[7] Exit'
    puts '[8] Find by ID'
    puts 'Enter a number: '
    puts "========================================"
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then delete_all 
    when 7 then exit 
    when 8 then find_by_id
  end
end

  def add_new_contact
    
    puts "Please enter the new contact's first name:"
    first_name = gets.chomp

    puts "Please enter the new contact's last name:"
    last_name=gets.chomp
    
    puts "Please enter the new contact's email address:"
    email=gets.chomp
    
    puts "Please enter a note about the new contact:"
    note=gets.chomp
    
    Contact.create(first_name, last_name, email, note)

  end

  def modify_existing_contact
    puts "Please enter the ID number of the contact you wish to modify:"
    id_number = gets.chomp.to_i
    puts "Which attribute would you like to change? Enter a number:"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Note"
    attribute=gets.chomp.to_i
    puts "Please enter the new value:"
    new_value=gets.chomp
    
  end

  def delete_contact

  end

  def display_all_contacts
    Contact.all
  end

  def search_by_attribute
    
  end

def delete_all
  puts "Are you sure you would like to delete all contacts? (y/n)"
  response=gets.chomp
  if response == "y" || response == "Y"
    Contact.delete_all
  else
    p "Delete All aborted"
  end
end

def find_by_id
puts "Please enter the contact's ID number:"
id_number=gets.chomp.to_i
Contact.find(id_number)
end



end

a_crm_app = CRM.new("CRM App")
a_crm_app.main_menu