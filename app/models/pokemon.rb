class Pokemon < ActiveRecord::Base
  belongs_to :trainer
  validates :name, uniqueness: true, presence: true

 # def damage
  #	self.health = self.health - 10
  #	if self.health <= 0
  #		Pokemon.find(self).destroy
  #	end
  #end

end

