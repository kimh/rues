module Rues
  module Task
    class PAMSetup
      def self.do(config_strings, param, file="/etc/pam.d/common-password")
        command = Cmd.write_file(config_strings, file)
        Rues::Cmd.backup(file, param)
        Rues::Cmd.exec(command, param, param.debug)
      end
    end
  end
end