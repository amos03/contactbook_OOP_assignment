class Contact
  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id +=1
  end

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note



  # This method should call the initializer, 
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact=Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact

  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  # two methods below, the commented one works but is vulnerable since IDs could change

  # def self.find(id_number)
  #   @@contacts[id_number-1]
  # end

  def self.find(id_number)
    @@contacts.each do |contact|
      if contact.id == id_number
        return contact
      end
    end
  end

  # This method should allow you to specify 
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  
  # def update -- changed to MODIFY in order to reflect description of CRM in doc

  def modify (id_number,contact_attribute, new_value)
    @@contacts.each do |contact|
      if contact.id == id_number && contact_attribute=="first name"
        contact.first_name=new_value
      elsif contact.id == id_number && contact_attribute=="last name"
        contact.last_name=new_value
      elsif contact.id == id_number && contact_attribute=="email"
          contact.email=new_value
        elsif contact.id == id_number && contact_attribute=="note"
          contact.note=new_value
      end
    end
  end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by (attribute, value)
    found = 0
    @@contacts.each do |contact|
      if attribute == "first name" && contact.first_name==value
        found +=1
        return contact
      elsif attribute == "last name" && contact.last_name==value
        found +=1
        return contact
      elsif attribute == "email" && contact.email==value
        found +=1
        return contact
      elsif attribute == "note" && contact.note==value
        found +=1
        return contact
      end
    end
      if found==0 
        return "No results found."
      else
        return "#{found} results found."
      end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts=[]
  end

  def full_name
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(id_number)

  end

  # Feel free to add other methods here, if you need them.
  
end

puts "Creating Contacts"
Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
Contact.create("Funny","Guy","laughing@yahoo.com", "not so funny")
Contact.create("Dorian","Gray","pictures@outlook.com","a bit vain")
puts "-------------------------------------------------------------------"
puts "Displaying Contacts"
p Contact.all
puts "-------------------------------------------------------------------"
puts "Testing Find by ID"
p Contact.find(3)
puts "-------------------------------------------------------------------"
