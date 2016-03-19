require "pathname"

class Fagin
    def self.find_children(parent, dir)
        children = Hash.new
        path = Pathname.new(dir).expand_path

        Dir["#{path}/*.rb"].each do |file|
            require_relative file

            %x(
                \grep -E "^class .+ \< #{parent}" #{file} | \
                    awk '{print $2}'
            ).each_line do |clas|
                next if (clas.nil?)
                clas.strip!
                next if (clas.nil?)

                child = nil
                begin
                    child = clas.split("::").inject(Object) do |m, c|
                        m.const_get(c)
                    end.new
                rescue NameError
                    raise Error::UnknownChildClassError.new(clas)
                end
                children[clas] = child if (child)
            end
        end

        return children
    end
end

require "fagin/error"
