class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE = /\A[\d]+/
  before_save {
    self.email = email.downcase
    self.subdomain = email.split("@").last.split(".").first

   }
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :phone, presence: true, length: {maximum: 10},
            format: {with: VALID_PHONE}, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :bookings



 after_create :create_tenant

   def create_tenant

#     s_domain = email.split("@").last.split(".").first
     puts "************ #{subdomain} **************"
     if(Apartment::Tenant.current == "empire_development" && User.where(subdomain: subdomain).count <= 1 && !subdomain.nil? && !subdomain.empty? )
      #subdomain = s_domain

       Apartment::Tenant.create(subdomain)
      # Apartment::Tenant.switch!('tenant_name')

     end
   end
end
