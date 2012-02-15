//+------------------------------------------------------------------+
//|                                                      mql4zmq.mqh |
//|                                  Copyright © 2012, Austen Conrad |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Austen Conrad"
#property link      "http://www.mql4zmq.org"
#import "mql4zmq.dll"

//+--------------------------------------------------------------------------------+
//| mql4zmq.dll exported functions with datatypes reconfigured for 
//| MetaTrader 4's reduced type set. The intention is to not call these
//| diretly. Please use renamed versions in next section to reduce confusion.     
//|
//| Type Changes: 
//|                zmq_msg_t => int
//|                const char => string
//|                size_t => int
//|                void (if it's a param that's passed) => string    
//|                zmq_free_fn => int                        
//+--------------------------------------------------------------------------------+

// Tests.
string ping(string pong);

// Version.
void mql4zmq_version(int &major[],int &minor[],int &patch[]);

// Errors.
int mql4zmq_errno();
string mql4zmq_strerror(int errnum);

// Messages.
int mql4zmq_msg_init(int &msg[]);
int mql4zmq_msg_init_size (int &msg[], int size);
int mql4zmq_msg_init_data (int &msg[], string data, int size);
int mql4zmq_msg_close (int $msg[]);
int mql4zmq_msg_move (int dest, int src);
int mql4zmq_msg_copy (int dest, int src);
string mql4zmq_msg_data (int &msg[]);
int mql4zmq_msg_size (int &msg[]);

// Infrastructure.
int mql4zmq_init (int io_threads);
int mql4zmq_term (int context);

// Sockets.
int mql4zmq_socket (int context, int type);
int mql4zmq_close (int socket);
int mql4zmq_setsockopt (int socket, int option, string optval, int optvallen);
int mql4zmq_getsockopt (int socket, int option, string optval, int optvallen);
int mql4zmq_bind (int socket, string addr);
int mql4zmq_connect (int socket, string addr);
int mql4zmq_send (int socket, int &msg[], int flags);
int mql4zmq_recv (int socket, int &msg[], int flags);

// I/O multiplexing.
int mql4zmq_poll (int items, int nitems, int timeout);

// Built-in devices.
int mql4zmq_device (int device, int insocket, int outsocket);

// Helper Functions.
string mql4s_recv (int socket, int flags);
int mql4s_send (int socket, string text); 
int mql4s_sendmore (int socket, string text); 

//+---------------------------------------------------------------------------------+
//| Renaming of functions to original naming structure. Use these when buiding 
//| your Expert Advisors so that we are consistant with ZeroMQ Naming conventions.     
//+---------------------------------------------------------------------------------+

// Version.
void zmq_version(int &major[],int &minor[],int &patch[]) 
{
   mql4zmq_version(major,minor,patch);
}

// Errors.
int zmq_errno()
{
   return(mql4zmq_errno());
}

string zmq_strerror(int errnum)
{
   return(mql4zmq_strerror(errnum));
}

// Messages.
int zmq_msg_init(int &msg[])
{
   return(mql4zmq_msg_init(msg));
}

int zmq_msg_init_size (int &msg[], int size)
{
   return(mql4zmq_msg_init_size(msg, size));
}

int zmq_msg_init_data (int &msg[], string data, int size)
{
   return(mql4zmq_msg_init_data(msg, data, size));
}

int zmq_msg_close (int &msg[])
{
   return(mql4zmq_msg_close(msg));
}

int zmq_msg_move (int dest, int src)
{
   return(mql4zmq_msg_move(dest, src));
}

int zmq_msg_copy (int dest, int src)
{
   return(mql4zmq_msg_copy (dest, src));
}

string zmq_msg_data (int &msg[])
{
   return(mql4zmq_msg_data(msg));
}

int zmq_msg_size (int &msg[])
{
   return(mql4zmq_msg_size(msg));
}

// Infrastructure.
int zmq_init (int io_threads)
{
   return(mql4zmq_init(io_threads));
}
   
int zmq_term (int context)
{
   return(mql4zmq_term(context));
}

// Sockets.
int zmq_socket (int context, int type)
{
   return(mql4zmq_socket(context, type));
}

int zmq_close (int socket)
{
   return(mql4zmq_close(socket));
}

int zmq_setsockopt (int socket, int option, string optval)
{
   // Automatically calculating the length of the option value.
   return(mql4zmq_setsockopt(socket, option, optval, StringLen(optval)));
}

int zmq_getsockopt (int socket, int option, string optval)
{
   // Automatically calculating the length of the option value.
   return(mql4zmq_getsockopt(socket, option, optval, StringLen(optval)));
}

int zmq_bind (int socket, string addr)
{
   return(mql4zmq_bind(socket, addr));
}

int zmq_connect (int socket, string addr)
{
   return(mql4zmq_connect(socket, addr));
}

// Defaults to no flags; meaning the flag is an optional paramater. 
// Common flags are: ZMQ_NOBLOCK, ZMQ_SNDMORE
int zmq_send (int socket, int &msg[], int flags=0)
{
   return(mql4zmq_send(socket, msg, flags));
}

// Defaults to no flags; meaning the flag is an optional paramater. 
// Common flags are: ZMQ_NOBLOCK, ZMQ_SNDMORE
int zmq_recv (int socket, int &msg[], int flags=0)
{
   return(mql4zmq_recv(socket, msg, flags));
}

// I/O multiplexing.
int zmq_poll (int items, int nitems, int timeout)
{
   return(mql4zmq_poll(items, nitems, timeout));
}

// Built-in devices.
int zmq_device (int device, int insocket, int outsocket)
{
   return(mql4zmq_device(device, insocket, outsocket));
}

// zhelper functions.
string s_recv (int socket, int flags=0)
{
   return(mql4s_recv(socket, flags));
}
int s_send (int socket, string text)
{
   return(mql4s_send(socket, text));
}
int s_sendmore (int socket, string text)
{
   return(mql4s_sendmore(socket, text));
}
 

//+---------------------------------------------------------------------------------+
//| Types and Options variables. Copied from zmq.h     
//+---------------------------------------------------------------------------------+

// Message Flags.
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
#define ZMQ_MSG_MASK 129

// Socket types.                                                              
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

//  Socket options.                                                           
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
#define ZMQ_RECOVERY_IVL_MSEC 20   /*  opt. recovery time, reconcile in 3.x   */
#define ZMQ_RECONNECT_IVL_MAX 21

//  Send/recv options.                                                        
#define ZMQ_NOBLOCK 1
#define ZMQ_SNDMORE 2

// I/O Multplexing options.
#define ZMQ_POLLIN 1
#define ZMQ_POLLOUT 2
#define ZMQ_POLLERR 4

// Device types.
#define ZMQ_STREAMER 1
#define ZMQ_FORWARDER 2
#define ZMQ_QUEUE 3
