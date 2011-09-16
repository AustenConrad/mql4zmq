//+------------------------------------------------------------------+
//|                                                      mql4zmq.mqh |
//|                                  Copyright © 2011, Austen Conrad |
//|                          https://github.com/AustenConrad/mql4zmq |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, Austen Conrad"
#property link      "https://github.com/AustenConrad/mql4zmq"

/*
   This file is a reworking of ZeroMQ's default zmq.h file for use with the MQL4 language.
*/

////////////////////////////////////////////////////////////////////////////////////
// 0MQ Library Import.   
////////////////////////////////////////////////////////////////////////////////////
#import "libzmq.dll"

////////////////////////////////////////////////////////////////////////////////////
// 0MQ Versioning Support. MODIFIED from the original zmq.h file.   
////////////////////////////////////////////////////////////////////////////////////

/*  Version macros for compile-time API version detection                     */
#define ZMQ_VERSION_MAJOR 2
#define ZMQ_VERSION_MINOR 1
#define ZMQ_VERSION_PATCH 9

#define ZMQ_MAKE_VERSION(major, minor, patch) \
   ((major) * 10000 + (minor) * 100 + (patch))
#define ZMQ_VERSION \
   ZMQ_MAKE_VERSION(ZMQ_VERSION_MAJOR, ZMQ_VERSION_MINOR, ZMQ_VERSION_PATCH)
   
/*  Run-time API version detection                                            */

///////// zmq_version - report ØMQ library version /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-version
// =>   void zmq_version (int *major, int *minor, int *patch);
// in MQL4
// =>   void zmq_version (int major, int minor, int patch);
void zmq_version (int major, int minor, int patch);

////////////////////////////////////////////////////////////////////////////////////
// 0MQ message definition. MODIFIED from the original zmq.h file.   
////////////////////////////////////////////////////////////////////////////////////
/*  A number random enough not to collide with different errno ranges on      */
/*  different OSes. The assumption is that error_t is at least 32-bit type.   */ 
/*  On Windows platform some of the standard POSIX errnos are not defined.    */
#define ENOTSUP 156384713
#define EPROTONOSUPPORT 156384714
#define ENOBUFS 156384715
#define ENETDOWN 156384716
#define EADDRINUSE 156384717
#define EADDRNOTAVAIL 156384718
#define ECONNREFUSED 156384719
#define EINPROGRESS 156384720
#define ENOTSOCK 156384721

// Native 0MQ Error Codes.
#define EFSM 156384763
#define ENOCOMPATPROTO 156384764
#define ETERN 156384765
#define EMTHREAD 156384766

/*  This function retrieves the errno as it is known to 0MQ library. The goal */
/*  of this function is to make the code 100% portable, including where 0MQ   */
/*  compiled with certain CRT library (on Windows) is linked to an            */
/*  application that uses different CRT library.                              */

///////// zmq_errno - retrieve value of errno for the calling thread /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-errno
// =>   int zmq_errno (void);
// in MQL4
// =>   int zmq_errno ();
int zmq_errno ();

/*  Resolves system errors and 0MQ errors to human-readable string.           */

///////// zmq_strerror - get ØMQ error message string /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-strerror
// =>   const char *zmq_strerror (int errnum);
// in MQL4
// =>   string zmq_strerror (int errnum);
string zmq_strerror (int errnum);

////////////////////////////////////////////////////////////////////////////////////
// 0MQ message definition. MODIFIED from the original zmq.h file.   
////////////////////////////////////////////////////////////////////////////////////

/*  Maximal size of "Very Small Message". VSMs are passed by value            */
/*  to avoid excessive memory allocation/deallocation.                        */
/*  If VMSs larger than 255 bytes are required, type of 'vsm_size'            */
/*  field in zmq_msg_t structure should be modified accordingly.              */
#define ZMQ_MAX_VSM_SIZE 30

/*  Message types. These integers may be stored in 'content' member of the    */
/*  message instead of regular pointer to the data.                           */
#define ZMQ_DELIMITER 31
#define ZMQ_VSM 32

/*  Message flags. ZMQ_MSG_SHARED is strictly speaking not a message flag     */
/*  (it has no equivalent in the wire format), however, making  it a flag     */
/*  allows us to pack the stucture tigher and thus improve performance.       */
#define ZMQ_MSG_MORE 1
#define ZMQ_MSG_SHARED 128
#define ZMQ_MSG_MASK 129   // Merges all the flags

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

///////// zmq_msg_close - release ØMQ message /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-msg-close
// =>  int zmq_msg_close (zmq_msg_t *msg);
// in MQL4
// =>  int zmq_msg_close (int msg);
int zmq_msg_close (int msg);

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

////////////////////////////////////////////////////////////////////////////////////
// 0MQ infrastructure (a.k.a. context) initialisation & termination. Pulled from the original zmq.h file.   
////////////////////////////////////////////////////////////////////////////////////

///////// zmq_init - initialise ØMQ context /////////
// ZeroMQ API http://api.zeromq.org/2-1:zmq-init
// =>   void *zmq_init (int io_threads); 
// in MQL4
// =>   void zmq_init (int io_threads);
int zmq_init (int io_threads);

///////// zmq_term - terminate ØMQ context /////////
// ZeroMQ API http://api.zeromq.org/2-1:zmq-term
// =>   int zmq_term (void *context);
// in MQL4
// =>   int zmq_term (int context);
int zmq_term (int context);

////////////////////////////////////////////////////////////////////////////////////
// 0MQ socket definitions. Pulled from the original zmq.h file.   
////////////////////////////////////////////////////////////////////////////////////

///////// Socket Types. /////////
#define ZMQ_PAIR 0
#define ZMQ_PUB 1
#define ZMQ_SUB 2
#define ZMQ_REQ 3
#define ZMQ_REP 4
#define ZMQ_DEALER 5
#define ZMQ_ROUTER 6
#define ZMQ_PULL 7
#define ZMQ_PUSH 8
#define ZMQ_XPUB 9
#define ZMQ_XSUB 10
#define ZMQ_XREQ ZMQ_DEALER      // Old alias, remove in 3.x
#define ZMQ_XREP ZMQ_ROUTER      // Old alias, remove in 3.x
#define ZMQ_UPSTREAM ZMQ_PULL    // Old alias, remove in 3.x
#define ZMQ_DOWNSTREAM ZMQ_PUSH  // Old alias, remove in 3.x

///////// Socket Options. /////////
#define ZMQ_HWM 1
#define ZMQ_SWAP 3
#define ZMQ_AFFINITY 4
#define ZMQ_IDENTITY 5
#define ZMQ_SUBSCRIBE 6
#define ZMQ_UNSUBSCRIBE 7
#define ZMQ_RATE 8
#define ZMQ_RECOVERY_IVL 9
#define ZMQ_MCAST_LOOP 10
#define ZMQ_SNDBUF 11
#define ZMQ_RCVBUF 12
#define ZMQ_RCVMORE 13
#define ZMQ_FD 14
#define ZMQ_EVENTS 15
#define ZMQ_TYPE 16
#define ZMQ_LINGER 17
#define ZMQ_RECONNECT_IVL 18
#define ZMQ_BACKLOG 19
#define ZMQ_RECOVERY_IVL_MSEC 20
#define ZMQ_RECONNECT_IVL_MAX 21

///////// Send/Recv Options. /////////
#define ZMQ_NOBLOCK 1
#define ZMQ_SNDMORE 2

///////// zmq_socket - create ØMQ socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-socket
// =>   void *zmq_socket (void *context, int type);
// in MQL4
// =>   void zmq_socket (int context, int type);
void zmq_socket (int context, int type);

///////// zmq_close - close ØMQ socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-close
// =>   int zmq_close (void *socket);
// in MQL4
// =>   int zmq_close (int socket);
int zmq_close (int socket);

///////// zmq_setsockopt - set ØMQ socket options /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-setsockopt
// =>   int zmq_setsockopt (void *socket, int option_name, const void *option_value, size_t option_len);
// in MQL4
// =>   int zmq_setsockopt (int socket, int option_name, int option_value, int option_len);
int zmq_setsockopt (int socket, int option_name, int option_value, int option_len);

///////// zmq_getsockopt - get ØMQ socket options /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-getsockopt
// =>   int zmq_getsockopt (void *socket, int option_name, void *option_value, size_t *option_len);
// in MQL4
// =>   int zmq_getsockopt (int socket, int option_name, int option_value, int option_len);
int zmq_getsockopt (int socket, int option_name, int option_value, int option_len);

///////// zmq_bind - accept connections on a socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-bind
// =>   int zmq_bind (void *socket, const char *endpoint);
// in MQL4
// =>   int zmq_bind (int socket, string endpoint);
int zmq_bind (int socket, string endpoint);

///////// zmq_connect - connect a socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-connect
// =>   int zmq_connect (void *socket, const char *endpoint);
// in MQL4
// =>   int zmq_connect (int socket, string endpoint);
int zmq_connect (int socket, string endpoint);

///////// zmq_send - send a message on a socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-send
// =>   int zmq_send (void *socket, zmq_msg_t *msg, int flags);
// in MQL4
// =>   int zmq_send (int socket, int msg, int flags);
int zmq_send (int socket, int msg, int flags);

///////// zmq_recv - receive a message from a socket /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-recv
// =>   int zmq_recv (void *socket, zmq_msg_t *msg, int flags);
// in MQL4
// =>   int zmq_recv (int socket, int msg, int flags);
int zmq_recv (int socket, int msg, int flags);

////////////////////////////////////////////////////////////////////////////////////
// I/O Multiplexing. MODIFIED from the original zmq.h file. 
////////////////////////////////////////////////////////////////////////////////////

#define ZMQ_POLLIN 1
#define ZMQ_POLLOUT 2
#define ZMQ_POLLERR 4

///////// zmq_poll - input/output multiplexing /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-poll
// =>   int zmq_poll (zmq_pollitem_t *items, int nitems, long timeout);
// in MQL4
// =>   int zmq_poll (int socket, int nitems, double timeout);
int zmq_poll (int socket, int nitems, double timeout);

////////////////////////////////////////////////////////////////////////////////////
// Build-in Devices. MODIFIED from the original zmq.h file. 
////////////////////////////////////////////////////////////////////////////////////  

#define ZMQ_STREAMER 1
#define ZMQ_FORWARDER 2
#define ZMQ_QUEUE 3

///////// zmq_device - start built-in ØMQ device /////////   
// ZeroMQ API http://api.zeromq.org/2-1:zmq-device
// =>   int zmq_device (int device, const void *frontend, const void *backend);
// in MQL4
// =>   int zmq_device (int device, string frontend, string backend);
int zmq_device (int device, string frontend, string backend);

