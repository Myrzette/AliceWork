
class User

  attr_accessor :email, :age
  @@all_users = 0
  @@list_of_users = []

  def initialize(email_to_save, age_to_save)
    @email = email_to_save
    @age = age_to_save
    @@all_users = @@all_users + 1
    @@list_of_users << self
  end

  def self.find_by_email(email)
    for user in @@list_of_users
      if email == user.email
        return user
      end
    end
  end
  
  def self.count
    return @@all_users
  end 

end
