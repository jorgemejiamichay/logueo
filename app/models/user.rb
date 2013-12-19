class User < ActiveRecord::Base
  authenticates_with_sorcery!

  #relationships
  has_many :questions
  has_one :fruit

  #nested
  accepts_nested_attributes_for :questions
  accepts_nested_attributes_for :fruit

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username
end
