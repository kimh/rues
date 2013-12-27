module Rues
  module Task
    class AddSudoers
      def self.do(config_strings, param)
        file = "/etc/sudoers"
        command = Cmd.write_file(config_strings, file)
        Rues::Cmd.backup(file, param)
        Rues::Cmd.exec(command, param, param.debug)
      end
    end
  end
end