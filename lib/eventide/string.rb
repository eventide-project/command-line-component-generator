module Eventide
  module String
    def camelize
      self.dup.split('_').map {|w| w.capitalize}.join
    end
  end
end

String.include Eventide::String

