module Rues
  class Cmd
    def self.exec(command, param, debug=false)
      exit_code = nil

      Net::SSH.start(param.host, param.username, {:password => param.password}) do |ssh|
        ssh.open_channel do |channel|
          channel.request_pty do |ch, success|
            if success
              #puts "Successfully obtained pty"
            else
              puts "Could not obtain pty"
            end
          end

          channel.exec(command) do |ch, success|
            abort "Could not execute commands!" unless success

            channel.on_data do |ch, data|
              channel.send_data "#{param.password}\n" if data =~ /password/
              puts data if debug
            end

            channel.on_request("exit-status") do |ch,data|
              exit_code = data.read_long
            end
          end
        end
      end
      exit_code
    end

    def self.write_file(content, file)
      [
        'sudo bash -c "', "cat << EOF > #{file}", content, "EOF", '"'
      ].join("\n")
    end

    def self.backup(file, dir="/tmp", param)
      dst = File.join(dir, File.basename(file) + "_#{Time.now.strftime("%Y%m%d%H%M%S")}")
      command = "mkdir -p #{dir}; sudo cp -r #{file} #{dst}"
      if 0 != Rues::Cmd.exec(command, param)
        puts "Backup of #{file} failed"
      end
    end

  end
end