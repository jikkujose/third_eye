class Event < Volt::Model
  field :sender, String
  field :content, String
  field :type, String
  field :location, String
  field :created_at
  field :mobile

  validate :sender, presence: true
  validate :content, presence: true
  validate :type, presence: true
  validate :location, presence: true
  validate :created_at, presence: true

  def location
    get('location') + ', Trivandrum'
  end
end
