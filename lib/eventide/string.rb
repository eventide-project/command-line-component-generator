module Eventide
  module String
    def camelize
      self.dup.split('_').map {|w| w.capitalize}.join
    end

    def lisp_case
      self.dup.gsub('_','-')
    end

    def titleize
      self.dup.split.each{|x| x.capitalize!}.join(' ')
    end
  end
end

String.include Eventide::String

