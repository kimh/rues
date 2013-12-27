module Rues
  module Task
    class AptGetInstall

      def self.do(packages, param)
        packages.each do |package|
          check_cmd    = "dpkg -l | grep #{package}"
          install_cmd  = "sudo apt-get install #{packages}"

          if 0 != Rues::Cmd.exec(check_cmd, param, param.debug)
            hl_info "Installing #{package}"
            Rues::Cmd.exec(install_cmd, param, param.debug)
          else
            hl_info "#{package} already installed. Skipping..."
          end
        end
      end
    end
  end
end