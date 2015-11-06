require "fagin/error.rb"

class Fagin::Error::UnknownChildClassError < Fagin::Error
    def initialize(clas = "")
        super("Unknown child class #{clas}!")
    end
end
