class Eulogy < ActiveRecord::Base
  belongs_to :memory
  belongs_to :user
end
