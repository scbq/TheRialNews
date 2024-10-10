class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy

  enum role: { user: 0, admin: 1 }

  # Set default role
  after_initialize do
    if self.new_record?
      self.role ||= :user
    end
  end

end
