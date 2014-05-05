class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def as_json(options={})
    {
      first_name: self.first_name,
      last_name: self.last_name,
      id: self.id,
      email: self.email
    }
  end
end