class User < ApplicationRecord
     # Relationships
    belongs_to :employee   
    #encrypt password
    has_secure_password
    
# params = { employee: { first_name: 'Dan', last_name: 'Phelps', ssn: "111111111", date_of_birth: "April 04, 2019", phone: "1234567897", role: "admin", user_attributes: { email: 'dphelps@cmu.edu', password: 'tartans' } } }

    # Validations
    validates_presence_of :email
    validates_uniqueness_of :email, case_sensitive: false
    # validate :employee_status
    
    # #callbacks
    # private
    # def employee_status
    #     Employee.find(self.employee_id).active == true
    # end
    
end
