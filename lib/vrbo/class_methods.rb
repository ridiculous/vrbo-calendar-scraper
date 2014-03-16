module VRBO
  module ClassMethods

    def method_missing(method_name, *arguments)
      inst = new
      if inst.respond_to?(method_name)
        inst.send(method_name, *arguments)
      else
        super
      end
    end

  end
end