module Persistence
  def all
    DB["#{self.name.downcase}s".to_sym].select(*self.members).map { |data| self.new(*data.values) }
  end
end