module Eventide
  module String
    def camelize
      self.dup.split('_').map {|w| w.capitalize}.join
    end

    def lisp_case
      self.dup.gsub('_','-')
    end
  end
end

String.include Eventide::String

