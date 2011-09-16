# mql4zmq

The goal of this project is to provide [MQL4](http://docs.mql4.com/ "MQL4 documentation homepage.") bindings for the [ZeroMQ](http://zeromq.org/ "ZeroMQ homepage.") networking library. 

This software is in an alpha state. I would <i>not</i> recommend it's use in production environments yet.

The mql4zmq.mqh header file is a reworking of ZeroMQ's default zmq.h header file for use with the MQL4 language.

The included precompiled `libzmq.dll` is for a 64-bit architecture. If you need to compile the ZeroMQ library for 32-bit you can download ZeroMQ [here](http://www.zeromq.org/intro:get-the-software "ZeroMQ download page.").

### To install:

1. Move `mql4zmq.mqh` to: `c:\windows\Program Files (x86)\Metatrader\experts\include\mql4zmq.mqh`

2. Move `libzmq.dll`  to: `c:\windows\Program Files (x86)\Metatrader\experts\libraries\libzmq.dll`

3. Move `mql4zmq.mq4` to: `c:\windows\Program Files (x86)\Metatrader\experts\mql4zmq.mq4`

### Example Usage:

`code will be provided when there is working code to provide.`