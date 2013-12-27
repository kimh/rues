module Rues
  class SSHParam

    attr_reader :host, :username, :password, :debug

    def initialize(host, username, password, debug)
      @host = host
      @username = username
      @password = password
      @debug = debug
    end
  end
end