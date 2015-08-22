class Event < Volt::Model
  field :name, String
  field :content, String
  field :type, String
  field :location, String
  field :created_time

  validate :name, presence: true
  validate :content, presence: true
  validate :type, presence: true
  validate :location, presence: true
  validate :created_time, presence: true
end
