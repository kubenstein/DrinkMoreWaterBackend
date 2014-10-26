module Persistence
  include JustInclude
  just_include do

    def self.persistence_layer
      @persistence_layer ||= Sequel::Model("#{self.name.downcase}s".to_sym)
    end


    def self.all
      self.persistence_layer.all
    end

    def save
      self.class.persistence_layer.new(self.attributes).save
    end

  end
end