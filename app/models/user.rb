class User < ActiveRecord::Base
  belongs_to :account
  has_many :routes

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :registerable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :encryptable, :authentication_keys => [:email, :account_id]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_protected :account_id

  # Putting Devise validations here rather than using :validatable in the call to #devise
  # to get validations of the login attribute
  validates_presence_of   :email
  validates_uniqueness_of :email, :scope => :account_id, :case_sensitive => false
  validates_format_of     :email, :with  => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  with_options :if => :password_required? do |v|
    v.validates_presence_of     :password
    v.validates_confirmation_of :password
    v.validates_length_of       :password, :within => 3..20, :allow_blank => true
  end

  def last_climb_day
    routes.map(&:created_at).sort.last.to_s(:short) if routes.present?
  end

  def last_days_score
    routes.group_by{|r| r.created_at.to_date }.sort.last[1].sum{|r| r.problem.points } if routes.present?
  end

  protected

    # Checks whether a password is needed or not. For validations only.
    # Passwords are always required if it's a new record, or if the password
    # or confirmation are being set somewhere.
    def password_required?
      !persisted? || !password.nil? || !password_confirmation.nil?
    end
end
