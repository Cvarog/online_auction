class Lot < ActiveRecord::Base
  belongs_to :item
  has_many :bets, dependent: :destroy

  validates :name, :description, :price, :time_step, :expired_time, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :description, length: { minimum: 30 }
  validates :name, length: { minimum: 3 }

  
  # Lot.all.select генерирует массив по условию, например Item.all.select { |item| item.price == 100 }

  # scope :active, -> { Lot.all.select { |lot| lot.active? } }
  # Lot.all.select { |lot| lot.active? }



  scope :active, -> { Lot.all.select { |lot| lot.active? } } 
  scope :finished, -> { Lot.all.select { |lot| lot.finished? } }
  scope :started, -> { Lot.all.select { |lot| lot.started? } }
  

  def active?
    started? && !finished?
  end

  def finished?
    Time.now.utc > self.expired_time
  end

  def started?
    Time.now.utc > self.start_time
  end
  
   # scope :started, ->  { where(Time.now.utc > self.start_time) }
   # scope :finished, -> { where(Time.now.utc > self.expired_time) }
   # scope :active, -> { where(started: true, finished: false) }

  def increase_expired_time
    self.expired_time += 30
    save!
  end

end
