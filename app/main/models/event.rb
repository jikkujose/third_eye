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

  def glyph
    {
      'accident' => 'certificate',
      'hit_and_run' => 'transfer',
      'road_rage' => 'flash',
      'theft' => 'exclamation-sign',
      'flying_squad' => 'star',
      'ambulance' => 'plus',
      'sos' => 'phone',
    }[get('type').downcase]
  end

  def type_pretty
    return 'SOS' if get('type') == 'sos'

    get('type')
      .split('_')
      .map { |word| word == 'and' ? word : word.capitalize }
      .join(" ")
  end
end
