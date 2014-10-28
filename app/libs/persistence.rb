module Persistence
  include JustInclude
  just_include do

    def self.persistence_layer
      @persistence_layer ||= Sequel::Model("#{self.name.downcase}s".to_sym)
    end

    def save
      self.class.persistence_layer.new(self.attributes).save
    end

    def self.method_missing(method, *args)
      self.persistence_layer.send method, *args
    end

  end
end