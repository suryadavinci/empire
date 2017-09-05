class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE = /\A[\d]+/
  #relationships
  has_many :bookings, dependent: :destroy

  #validations
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :phone, presence: true, length: {maximum: 10},
            format: {with: VALID_PHONE}, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

#callbacks
  before_create do
      self.email = email.capitalize
    end

 after_create :create_tenant
 before_save {
   self.email = email.downcase
   self.subdomain = email.split("@").last.split(".").first
  }

  before_validation :strip_whitespace, :only => [:name, :email]

  private
    def strip_whitespace
      self.name = self.name.strip unless self.name.nil?
      self.email = self.email.strip unless self.email.nil?
    end

    def create_tenant
     puts "************ #{subdomain} **************"
     if(Apartment::Tenant.current == "empire_development" && User.where(subdomain: subdomain).count <= 1 && !subdomain.nil? && !subdomain.empty? )
       Apartment::Tenant.create(subdomain)
     end
    end
end
