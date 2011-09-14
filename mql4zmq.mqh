//+------------------------------------------------------------------+
//|                                                      mql4zmq.mqh |
//|                                  Copyright © 2011, Austen Conrad |
//|                          https://github.com/AustenConrad/mql4zmq |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, Austen Conrad"
#property link      "https://github.com/AustenConrad/mql4zmq"

//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"

//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
#import "libzmq.dll" // ZeroMQ library. Make sure that it is located at: c:\windows\Program Files (x86)\Metatrader\experts\libraries\libzmq.dll`
   
//+------------------------------------------------------------------+
//| EX4 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex4"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Setup ZMQ API calls for MQL4                                     |
//+------------------------------------------------------------------+

///////// zmq_init - initialise ØMQ context /////////
// ZeroMQ API http://api.zeromq.org/2-1:zmq-init
// =>   void *zmq_init (int io_threads); 
// in MQL4
// =>   void zmq_init (int io_threads);
void zmq_init (int io_threads);

///////// zmq_term - terminate ØMQ context /////////
// ZeroMQ API http://api.zeromq.org/2-1:zmq-term
// =>   int zmq_term (void *context);
// in MQL4
// =>   int zmq_term (int context);
int zmq_term (int context);

///////// zmq_version - report ØMQ library version /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-version
// =>   void zmq_version (int *major, int *minor, int *patch);
// in MQL4
// =>   void zmq_version (int major, int minor, int patch);
void zmq_version (int major, int minor, int patch);

///////// zmq_errno - retrieve value of errno for the calling thread /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-errno
// =>   int zmq_errno (void);
// in MQL4
// =>   int zmq_errno ();
int zmq_errno ();

///////// zmq_strerror - get ØMQ error message string /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-strerror
// =>   const char *zmq_strerror (int errnum);
// in MQL4
// =>   string zmq_strerror (int errnum);
string zmq_strerror (int errnum);

///////// zmq_bind - accept connections on a socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-bind
// =>   int zmq_bind (void *socket, const char *endpoint);
// in MQL4
// =>   int zmq_bind (int socket, string endpoint);
int zmq_bind (int socket, string endpoint);

///////// zmq_close - close ØMQ socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-close
// =>   int zmq_close (void *socket);
// in MQL4
// =>   int zmq_close (int socket);
int zmq_close (int socket);

///////// zmq_connect - connect a socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-connect
// =>   int zmq_connect (void *socket, const char *endpoint);
// in MQL4
// =>   int zmq_connect (int socket, string endpoint);
int zmq_connect (int socket, string endpoint);

///////// zmq_device - start built-in ØMQ device /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-device
// =>   int zmq_device (int device, const void *frontend, const void *backend);
// in MQL4
// =>   int zmq_device (int device, string frontend, string backend);
int zmq_device (int device, string frontend, string backend);

///////// zmq_socket - create ØMQ socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-socket
// =>   void *zmq_socket (void *context, int type);
// in MQL4
// =>   void zmq_socket (int context, int type);
void zmq_socket (int context, int type);

///////// zmq_getsockopt - get ØMQ socket options /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-getsockopt
// =>   int zmq_getsockopt (void *socket, int option_name, void *option_value, size_t *option_len);
// in MQL4
// =>   int zmq_getsockopt (int socket, int option_name, int option_value, int option_len);
int zmq_getsockopt (int socket, int option_name, int option_value, int option_len);

///////// zmq_setsockopt - set ØMQ socket options /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-setsockopt
// =>   int zmq_setsockopt (void *socket, int option_name, const void *option_value, size_t option_len);
// in MQL4
// =>   int zmq_setsockopt (int socket, int option_name, int option_value, int option_len);
int zmq_setsockopt (int socket, int option_name, int option_value, int option_len);

///////// zmq_poll - input/output multiplexing /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-poll
// =>   int zmq_poll (zmq_pollitem_t *items, int nitems, long timeout);
// in MQL4
// =>   int zmq_poll (int socket, int nitems, double timeout);
int zmq_poll (int socket, int nitems, double timeout);

///////// zmq_recv - receive a message from a socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-recv
// =>   int zmq_recv (void *socket, zmq_msg_t *msg, int flags);
// in MQL4
// =>   int zmq_recv (int socket, int msg, int flags);
int zmq_recv (int socket, int msg, int flags);

///////// zmq_send - send a message on a socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-send
// =>   int zmq_send (void *socket, zmq_msg_t *msg, int flags);
// in MQL4
// =>   int zmq_send (int socket, int msg, int flags);
int zmq_send (int socket, int msg, int flags);

///////// zmq_msg_init - initialise empty ØMQ message /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-msg-init
// =>   int zmq_msg_init (zmq_msg_t *msg);
// in MQL4
// =>   int zmq_msg_init (int msg);
int zmq_msg_init (int msg);

///////// zmq_msg_init_size - initialise ØMQ message of a specified size /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-msg-init-size
// =>   int zmq_msg_init_size (zmq_msg_t *msg, size_t size);
// in MQL4
// =>   int zmq_msg_init_size (int msg, int size);
int zmq_msg_init_size (int msg, int size);

///////// zmq_msg_init_data - initialise ØMQ message from a supplied buffer /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-msg-init-data
// =>   int zmq_msg_init_data (zmq_msg_t *msg, void *data, size_t size, zmq_free_fn *ffn, void *hint);
// in MQL4
// =>   int zmq_msg_init_data (int msg, string data, int size, int ffn, string hint);
int zmq_msg_init_data (int msg, string data, int size, int ffn, string hint);

///////// zmq_msg_data - retrieve pointer to message content /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-msg-data
// =>   void *zmq_msg_data (zmq_msg_t *msg);
// in MQL4
// =>   void zmq_msg_data (int msg);
void zmq_msg_data (int msg);

///////// zmq_msg_size - retrieve message content size in bytes /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-msg-size
// =>   size_t zmq_msg_size (zmq_msg_t *msg);
// in MQL4
// =>   int zmq_msg_size (int msg);
int zmq_msg_size (int msg);

///////// zmq_msg_move - move content of a message to another message /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-msg-move
// =>  int zmq_msg_move (zmq_msg_t *dest, zmq_msg_t *src);
// in MQL4
// =>  int zmq_msg_move (int dest, int src);
int zmq_msg_move (int dest, int src);

///////// zmq_msg_copy - copy content of a message to another message /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-msg-copy
// =>  int zmq_msg_copy (zmq_msg_t *dest, zmq_msg_t *src);
// in MQL4
// =>  int zmq_msg_copy (int dest, int src);
int zmq_msg_copy (int dest, int src);

///////// zmq_msg_close - release ØMQ message /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-msg-close
// =>  int zmq_msg_close (zmq_msg_t *msg);
// in MQL4
// =>  int zmq_msg_close (int msg);
int zmq_msg_close (int msg);

//+------------------------------------------------------------------+