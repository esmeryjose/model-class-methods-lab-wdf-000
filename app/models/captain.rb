class Captain < ActiveRecord::Base
  has_many :boats
  has_many :classifications, through: :boats

  def self.catamaran_operators
    joins(:classifications).where("classifications.name = 'Catamaran'").uniq
  end

  def self.sailors
    joins(:classifications).where("classifications.name = 'Sailboat'").uniq
  end

  def self.motorboarders
    joins(:classifications).where("classifications.name = 'Motorboat'").uniq
  end

  def self.talented_seamen
    sailors.where(id: motorboarders.ids)
  end

  def self.non_sailors
    where.not(id: sailors.ids)
  end

end
