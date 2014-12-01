  class User < ActiveRecord::Base
    has_many :accounts, :dependent => :destroy
    has_many :schedules, :dependent => :destroy
    before_create :assign_default_role
    validates_uniqueness_of :email

    def has_facebook?
      accounts.where(provider: 'facebook').any?
    end

    def assign_default_role
      self.role = "customer" if self.role.blank?
    end

    def is_customer
      return self.role.to_s == "customer"
    end

    def is_admin
      return self.role.to_s == "admin"
    end

    def is_walker
      return self.role.to_s == "walker"
    end

  end