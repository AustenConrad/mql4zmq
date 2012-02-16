# mql4zmq examples

## mql4zmq.mq4:

This is an example EA that shows how to use mql4zmq to publish and subscribe messages each tick.

## ruby examples:
The mql4zmq_pub.rb and mql4zmq_sub.rb files are provided to use to test the mql4zmq EA. 

They also demonstrate the key point of the mql4zmq project which is that the use of ZeroMQ to communicate with
MetaTrader opens up the door to writing your trading code in any of the 30+ languages for which there is a [ZeroMQ binding.](http://www.zeromq.org/bindings:_start "ZeroMQ language bindings.")

With very little work you can expand the mql4zmq EA to be a full fledged bridge.