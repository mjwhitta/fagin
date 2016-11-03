require "pathname"

class Fagin
    def self.find_children(parent, dir)
        children = Hash.new
        path = Pathname.new(dir).expand_path

        Dir["#{path}/*.rb"].each do |file|
            %x(
                \grep -E "^class .+ < #{parent}" #{file} | \
                    awk '{print $2}'
            ).each_line do |clas|
                next if (clas.nil?)
                clas.strip!
                next if (clas.empty?)

                begin
                    require_relative file
                    child = clas.split("::").inject(Object) do |m, c|
                        m.const_get(c)
                    end
                    children[clas] = child
                rescue NameError
                    raise Error::UnknownChildClassError.new(clas)
                end
            end
        end

        return children
    end
end

require "fagin/error"
