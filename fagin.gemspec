Gem::Specification.new do |s|
    s.name = "fagin"
    s.version = "0.1.0"
    s.date = Time.new.strftime("%Y-%m-%d")
    s.summary = "Dynamically load children classes"
    s.description =
        "Dynamically load children classes for a specified parent " \
        "class from a specified directory."
    s.authors = [ "Miles Whittaker" ]
    s.email = "mjwhitta@gmail.com"
    s.files = Dir["lib/**/*.rb"]
    s.homepage = "http://mjwhitta.github.io/fagin"
    s.license = "GPL-3.0"
end
