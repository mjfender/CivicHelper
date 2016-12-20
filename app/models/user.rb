class User < Twitter::User

  @@ALL = []
  def initialize(hash)
    super
    @@ALL << self
  end
  
  def self.all
    @@ALL
  end

end
