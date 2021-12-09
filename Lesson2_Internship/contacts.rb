
class Contacts
  def initialize() 
    @contacts = []
  end

  def create(name, phone, address)
    @contacts.push({ name: name, phone: phone, address: address })     
    return @contacts.length - 1
  end 
  
  def list
    return @contacts
  end    

  def update(id, name, phone, address)
    return false unless @contacts[id]
    @contacts[id] = ({  name: name, phone: phone, address: address })
    true      
  end
   
  def delete(id) 
    if @contacts.length < id
       @contacts.delete_at(id)
    end
  end
  def search(id)
    if @contacts[id] 
       return @contacts[id]  
    else false
    end
  end

  def searchname(id)
    @contacts.find{ |el| el[@name] == @name }    
  end
end   

 contact = Contacts.new()
 contact.create("Yuliia", 380975167852, "Kyiv, Kahovska, 62")
 contact.create("Olha", 380967653415, "Kyiv, Bratislavska, 14")
 contact.create("Vlad", 380987654367, "Chernihiv, Nabereshna, 23")

 puts "List"
 puts contact.list

 puts "Update"
 puts contact.update(1, "Yuliia", 380967653415, "Kyiv, Bratislavska, 14")
 puts "List"
 puts contact.list

 puts "Search id"
 puts contact.search(1)

 puts "search name"
 puts contact.searchname(1)

 puts "delete"
 puts contact.delete(1)
 puts "List"
 puts contact.list


 



