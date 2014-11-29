class User < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  before_create :assign_default_role
  validates_uniqueness_of :email

  def has_facebook?
    accounts.where(provider: 'facebook').any?
  end

  def assign_default_role
    self.role = "customer" if self.role.blank?
  end
end
