module Persistence
  include JustInclude
  just_include do

    def self.all
      DB["#{self.name.downcase}s".to_sym].map { |data| self.new(data) }
    end

    def create
      DB["#{self.class.name.downcase}s".to_sym].insert(self.to_h)
    end

  end
end