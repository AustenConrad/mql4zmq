# run via: ruby zmq_ploutos_pub.rb 10.18.16.5:2028 cmd
#       Buy
#       => sends message 'cmd Buy' to the MetaTrader EA at 10.18.16.5:2028
require 'zmq'

# Check for help being requested.
if ARGV[0] == "-h" || ARGV[0] == "--help"
        puts "Usage: ruby zmq_ploutos_pub.rb [MetaTrader IP address]:[MQL4ZMQ EA Port Number default 2028] [channel to send messages on]"
        puts "example: \n ruby zmq_ploutos_pub.rb 10.18.16.16:2028 cmd\n Buy\n => sends message 'cmd Buy' to the MetaTrader EA at 10.18.16.16"
else
        # Initialize ZeroMQ Context.
        context = ZMQ::Context.new

        # Initialze channel variable with the supplied channel name to publish to.
        chan = ARGV[1]

        # Configure the ZeroMQ socket to be of type Publish.
        pub = context.socket ZMQ::PUB

        # Connect to the Subscription node. This is backwards from the way this is usually done, but we
        # do it this way for the MQL4ZMQ project so that we can have multiple publishers send commands to
        # the MetaTrader EA.  
        pub.connect "tcp://#{ARGV[0]}"

        # On newline, send the message to the MetaTrader EA. 
        while msg = STDIN.gets
          msg.strip!
          pub.send "#{chan} #{msg}"
        end
end