Gem::Specification.new do |s|
    s.name = "fagin"
    s.version = "1.2.2"
    s.date = Time.new.strftime("%Y-%m-%d")
    s.summary = "Dynamically load children classes"
    s.description =
        "Dynamically load children classes for a specified parent " \
        "class from a specified directory."
    s.authors = ["Miles Whittaker"]
    s.email = "mj@whitta.dev"
    s.files = Dir["lib/**/*.rb"]
    s.homepage = "https://gitlab.com/mjwhitta/fagin"
    s.license = "GPL-3.0"
    s.add_development_dependency("rake", "~> 13.0", ">= 13.0.0")
end
