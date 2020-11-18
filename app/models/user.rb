class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :registerable and :omniauthable
  belongs_to :step
  devise  :database_authenticatable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          :omniauthable,
          # :registerable,
          :omniauth_providers => [:github]
  before_validation :adjust_email, on: :create

  def self.from_omniauth(auth)
    puts auth.info.email
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.github_account = auth["extra"]["raw_info"].login
      user.name = auth.info.name
      user.step = Step.find_by(step_number: 1)
      user.batch = User.find_batch(auth["extra"]["raw_info"].login)
      #user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  private

  def adjust_email
    self.email = "fake+#{generate_token}" if email.blank?
    true
  end

  def generate_token
    rand(36**8).to_s(36).concat("@lewagon.org")
  end

  def self.find_batch(gh_account)
    users_path = Rails.root.join('db/users')
    serialized_users = File.read("#{users_path}/students.json")
    users = JSON.parse(serialized_users)['users']
    this_user = users.select { |user| user['alumnus']["github"] == gh_account }.first
    this_user ? this_user['alumnus']['camp_slug'].to_i : 0
  end
end
