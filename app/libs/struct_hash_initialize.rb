module StructHashInitialize

  module InstanceMethods
    def initialize(fields={})
      permitted_keys = self.members
      symbolize_fields = fields.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }
      values_for_struct = permitted_keys.each_with_object([]) { |permitted_key, arr| arr << symbolize_fields[permitted_key] }.compact
      super(*values_for_struct)
    end
  end


  def self.extended(base)
    base.include InstanceMethods
  end
end