module Persistence

  module ClassMethods
    def all
      DB["#{self.name.downcase}s".to_sym].select(*self.members).map { |data| self.new(*data.values) }
    end
  end


  module InstanceMethods
    def save
      true
    end
  end


  def self.extended(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
end