class User < ApplicationRecord
    
    #encrypt password
    has_secure_password
    
    # Relationships
    belongs_to :employee

    # Validations
    validates_presence_of :employee_id, :email, :password_digest
    validates_uniqueness_of :email, case_sensitive: false
    
end
