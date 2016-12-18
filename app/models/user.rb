class User < Twitter::User

  @@ALL = []
  def initialize(hash)
    super
    @@ALL << self
  end
  
  def self.all
    @@ALL
  end

  def self.find_or_create(hash)
  end
end
