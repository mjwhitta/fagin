require "pathname"

class Fagin
    def self.find_children(parent, dir)
        children = Hash.new
        path = Pathname.new(dir).expand_path

        %x(
            \grep -EHo "^class +.+ *< *#{parent}" \
            #{Dir["#{path}/*.rb"].join(" ")}
        ).each_line do |line|
            clas = line.match(/class\s+(\S+)\s*</)[1]
            next if (clas.nil? || clas.empty?)
            begin
                require_relative line.match(/^([^:]+)/)[1]
                child = clas.split("::").inject(Object) do |m, c|
                    m.const_get(c)
                end
                children[clas] = child
            rescue NameError
                raise Error::UnknownChildClassError.new(clas)
            end
        end

        return children
    end
end

require "fagin/error"
