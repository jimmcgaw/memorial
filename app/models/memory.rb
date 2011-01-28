class Memory < ActiveRecord::Base
  belongs_to :user
  has_many :eulogies
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :description, :presence => true
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def lived
    "#{date_of_birth.year} - #{date_of_death.year}"
  end
end
