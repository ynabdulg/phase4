class Flavor < ApplicationRecord
    
    # Validations
    # make sure required fields are present
    validates_presence_of :name
    
    #scopes
    scope :active,       -> { where(active: true) }
    scope :inactive,     -> { where(active: false) }
    scope :alphabetical, -> { order(:name) }
end
