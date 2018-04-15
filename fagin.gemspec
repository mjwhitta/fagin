Gem::Specification.new do |s|
    s.name = "fagin"
    s.version = "1.1.3"
    s.date = Time.new.strftime("%Y-%m-%d")
    s.summary = "Dynamically load children classes"
    s.description =
        "Dynamically load children classes for a specified parent " \
        "class from a specified directory."
    s.authors = [ "Miles Whittaker" ]
    s.email = "mjwhitta@gmail.com"
    s.files = Dir["lib/**/*.rb"]
    s.homepage = "https://mjwhitta.github.io/fagin"
    s.license = "GPL-3.0"
    s.add_development_dependency("rake", "~> 12.3", ">= 12.3.0")
end
