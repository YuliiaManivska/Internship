require "securerandom"

class Contact
  attr_accessor :name, :phone, :address

  def initialize(name, phone, address)
    @name = name
    @phone = phone
    @address = address
    regex_phone = /(?:\+38)?[ .-]?[0-9]{3}[ .-]?[0-9]{2}[ .-]?[0-9]{2}|044[ .-]?[0-9]{3}/
  end
  def valid_phone?(valid_phone)
    valid_phone =~ (regex_phone) ? "Corect phone number" : "Phone number isn't correct"
end
end

class Contacts
  def initialize
    @contacts_hash = {}
  end

  def add(contact)
    id = create_id
    @contacts_hash[id] = contact
    return id
  end

  def update(id, contact)
    if @contacts_hash[id]
      @contacts_hash[id] = contact
      return true 
    else 
      return false
    end     
  end

  def delete(id) 
    if @contacts_hash.delete(id)
    end
  end

  def update_phone(id, phone)
    if @contacts_hash[id]
      @contacts_hash[id].phone = phone
      return true 
    else 
      return false
    end          
  end

  def search_name(name)
    @contacts_hash.select { |id, contact| contact.name == name }.first
  end

  def sorted_list
    arr_of_hashes = []
    @contacts_hash.each do |id, contact|
      arr_of_hashes.push(contact.name)
    end
      return arr_of_hashes.sort
  end

  private 

  def create_id
    id = SecureRandom.hex(3)
    return id
  end
end 

new_contact1 = Contact.new("Yuliia", 380975167852, "Kyiv, Kahovska, 62")
new_contact2 = Contact.new("Olha", 380967653415, "Kyiv, Bratislavska, 14")
new_contact3 =  Contact.new("Vlad", 380987654367, "Chernihiv, Nabereshna, 23")
new_contact4 =  Contact.new("Test", 380989754367, "Nabereshna, 23")

contacts = Contacts.new
first_id = contacts.add(new_contact1)
second_id = contacts.add(new_contact2)
third_id = contacts.add(new_contact3)
puts "add"
puts contacts.add(new_contact4)
puts "Update"
puts contacts.update(first_id, new_contact2)
puts "Delete"
puts contacts.delete(second_id)
puts "search name"
puts contacts.search_name("Olha")
puts "Update_phone"
puts contacts.update_phone(third_id, 38067541367) 
puts "Sorted list"
puts contacts.sorted_list 