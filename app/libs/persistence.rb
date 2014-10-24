module Persistence

  module ClassMethods
    def all
      DB["#{self.name.downcase}s".to_sym].select(*self.members).map { |data| self.new(data) }
    end
  end


  module InstanceMethods
    def create
      DB["#{self.class.name.downcase}s".to_sym].insert(self.to_h)
    end
  end


  def self.extended(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
end