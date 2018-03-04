class Fagin::Error::UnknownChildClass < Fagin::Error
    def initialize(clas = "")
        super("Unknown child class #{clas}!")
    end
end
