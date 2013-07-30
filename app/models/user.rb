class User < ActiveRecord::Base
  has_many :albums

  validates :email, format: {with: /\b[&.+.A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,6}/, 
                             message: "Please enter a valid email address." }
  validates_presence_of :email, :message => 'You need an email to create an account.'
  validates_uniqueness_of :email, :message => 'This email address has already been taken.'

  validates_presence_of :username, :message => 'You need a username to create an account.'
  validates_uniqueness_of :username, :message => 'This username has already been taken.'

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by_username(username)
    if @user && @user.password == password
      return @user
    else
      nil
    end
  end

end
