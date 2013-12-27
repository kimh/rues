module Rues
  module Task
    class AddUser
      def self.do(users, group, salt, param)
        users.each do |u|
          password  = ([*1..9].sample(2) + [*'A'..'Z'].sample(2) + [*'a'..'z'].sample(2) + ['@', '+', '|', '_', '{', '}'].sample(2)).sort_by{rand}.join
          encrypted = password.crypt(salt)
          check_cmd = "id #{u}"
          add_cmd   = "sudo useradd -g #{group} -m -s /bin/bash -p #{encrypted} #{u}"

          if 0 != Rues::Cmd.exec(check_cmd, param, param.debug)
            res = Rues::Cmd.exec(add_cmd, param, param.debug)

            if res == 0
              puts "#{u} is successfully added"
            else
              puts "Fail to add #{u}"
            end
          else
            puts "#{u} already exists. Skip adding..."
          end
        end
      end
    end
  end
end