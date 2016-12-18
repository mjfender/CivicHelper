class Outgoing < Twitter::Tweet
  @@ALL = []

  def initialize
    super
    @@ALL << self
  end

  def self.all
    @@ALL
  end


end
