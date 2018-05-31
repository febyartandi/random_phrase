class Phrase < ActiveRecord::Base
  
  has_many :session_phrases
  validates :value, presence: true, uniqueness: true
  
end