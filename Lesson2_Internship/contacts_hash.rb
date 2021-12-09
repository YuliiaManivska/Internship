require "securerandom"
class Contacts
  def initialize
    @contacts_hash = {}
  end
  
  def create(name, phone, address)
    id =  SecureRandom.hex(5)
    @contacts_hash[id] = { name:  name, phone: phone, address: address }
    return id
  end
 
  def list
    return @contacts_hash
  end    

  def update(id, name, phone, address)
    return false unless @contacts_hash[@id]
    @contacts_hash[@id] = { name: name, phone: phone, address: address }
    return true      
  end
   
  def delete(id) 
    @contacts_hash.delete(id)
    end
  
  def search(id)
   return @contacts_hash[@id]  
  end

  def search_name(name)
    @contacts_hash.select{ |key, value| value[:name] == name }
  end
end   

 contact = Contacts.new
 id1 = contact.create("Yuliia", 380975167852, "Kyiv, Kahovska, 62")
 id2 = contact.create("Olha", 380967653415, "Kyiv, Bratislavska, 14")
 id3 = contact.create("Vlad", 380987654367, "Chernihiv, Nabereshna, 23")
 puts id1
 puts id2
 puts id3
 puts "List"
 puts contact.list

 puts "Update"
 puts contact.update(id1, "Yuliia", 380967653415, "Kyiv, Bratislavska, 14")
 
 puts "List"
 puts contact.list
 
 puts "delete"
 puts contact.delete(id1)
 puts "List"
 puts contact.list

 puts "Search id"
 puts contact.search(id1)

 puts "search name"
 puts contact.search_name("Olha")



 



