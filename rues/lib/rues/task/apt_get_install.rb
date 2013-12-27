module Rues
  module Task
    class AptGetInstall

      def self.do(packages, param)
        packages.each do |package|
          check_cmd    = "dpkg -l | grep #{package}"
          install_cmd  = "sudo apt-get install #{packages}"

          if 0 != Rues::Cmd.exec(check_cmd, param, param.debug)
            puts "Installing #{package}"
            Rues::Cmd.exec(install_cmd, param, param.debug)
          else
            puts "#{package} already installed. Skipping..."
          end
        end
      end
    end
  end
end