require "pathname"

class Fagin
    def self.find_children(parent, dir)
        children = Hash.new
        path = Pathname.new(dir).expand_path
        return children if (!path.exist?)

        %x(
            \grep -EHos "^class +.+ *< *#{parent}" #{path}/*.rb
        ).each_line do |line|
            line.match(/^([^:]+\.rb).+class\s+(\S+)\s*</) do |match|
                file = match[1]
                next if (file.nil? || file.empty?)
                clas = match[2]
                next if (clas.nil? || clas.empty?)
                begin
                    require_relative file
                    child = clas.split("::").inject(Object) do |m, c|
                        m.const_get(c)
                    end
                    children[clas] = child
                rescue NameError
                    raise Error::UnknownChildClass.new(clas)
                end
            end
        end

        return children
    end

    def self.find_children_recursively(parent, dir)
        children = Hash.new
        path = Pathname.new(dir).expand_path
        return children if (!path.exist?)

        %x(
            \grep -EHors "^class +.+ *< *#{parent}" #{path}
        ).each_line do |line|
            line.match(/^([^:]+\.rb).+class\s+(\S+)\s*</) do |match|
                file = match[1]
                next if (file.nil? || file.empty?)
                clas = match[2]
                next if (clas.nil? || clas.empty?)
                begin
                    require_relative file
                    child = clas.split("::").inject(Object) do |m, c|
                        m.const_get(c)
                    end
                    children[clas] = child
                rescue NameError
                    raise Error::UnknownChildClass.new(clas)
                end
            end
        end

        return children
    end
end

require "fagin/error"
