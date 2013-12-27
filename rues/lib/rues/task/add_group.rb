module Rues
  module Task
    class AddGroup

      def self.do(group, param)
        check_cmd = "grep -q #{group} /etc/group"
        add_cmd   = "groupadd #{group}"

        if 0 != Rues::Cmd.exec(check_cmd, param, param.debug)
          res = Rues::Cmd.exec(add_cmd, param, param.debug)
          if res == 0
            puts "#{group} is succesfully added"
          else
            puts "Fail to add #{group}"
          end
        else
          puts "#{group} already exists. Skip adding..."
        end
      end
    end
  end
end