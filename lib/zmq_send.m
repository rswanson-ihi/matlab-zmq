% zmq_send - Send a message part on a socket.
%
% Usage: msgLen = zmq_send(socket, message)
%        msgLen = zmq_send(socket, message)
%        msgLen = zmq_send(socket, message, option1, ...)
%        msgLen = zmq_send(socket, message, option1, option2, ...)
%
% Input: socket   - Instantiated ZMQ socket handle (see zmq_socket).
%        message  - uint8 array containing binary data to be queued for transmission
<<<<<<< HEAD
%        options  - List of strings containing the name of option for transmission.
=======
%        options  - List of strings containing the options' names for transmission.
>>>>>>> 387c819da2b753383aefd85df9090ea8861870a5
%
% Output:  number of bytes in the message if successful, otherwise -1.
%
% If the message cannot be queued on the socket, the zmq_send() function shall
% fail with zmq:send:EAGAIN error code.
%
% The following options are considered valid:
%
% * ZMQ_DONTWAIT
<<<<<<< HEAD
%       For socket types (DEALER, PUSH) that block when there are noavailable peers
=======
%       For socket types (DEALER, PUSH) that block when there are no available peers
>>>>>>> 387c819da2b753383aefd85df9090ea8861870a5
%       (or all peers have full high-water mark), specifies that the operation should
%       be performed in non-blocking mode.
% * ZMQ_SNDMORE
%       Specifies that the message being sent is a multi-part message, and that
%       further message parts are to follow.
%
%
% NOTICE
%  - A successful invocation of zmq_send() does not indicate that the message
%    has been transmitted to the network, only that it has been queued on the
%    socket and ZMQ has assumed responsibility for the message.
<<<<<<< HEAD
%  - The message to be sent should be a uint8 row vector. Please consider using
%    functions like `uint8`, `cast` and `typecast` before send it. It's also
%    interesting when sending strings, to ensure use UTF-8 encoding, you can do
%    this using, for example:
%      `native2unicode(str, 'UTF-8')` or
%      `feature('DefaultCharacterSet', 'UTF-8')`.
%  - Please consider splitting long messages in short parts using 'ZMQ SNDMORE'
%    option to avoid truncating, due the buffer length in the receiver.
=======
%  - The message to be sent should be a uint8 row vector. It's recommended that
%    you use functions like `uint8`, `cast` and `typecast` before send it. When
%    sending scripts, it's also recommended that you ensure the use of UTF-8 encoding.
%    You can do by this using, for example:
%      `native2unicode(str, 'UTF-8')` or
%      `feature('DefaultCharacterSet', 'UTF-8')`.
%  - Consider splitting long messages in shorter parts by using 'ZMQ_SNDMORE' option
%    to avoid truncating them, due to the buffer length set in the receiver.
>>>>>>> 387c819da2b753383aefd85df9090ea8861870a5
%
% EXAMPLE
%     feature('DefaultCharacterSet', 'UTF-8');
%     % Send a multi-part message consisting of three parts to socket
%     rc = zmq_send(socket, uint8('ABC'), 'ZMQ_SNDMORE');
%     assert(rc == 3);
%     rc = zmq_send(socket, uint8('DEFGH'), 'ZMQ_SNDMORE');
%     assert(rc == 5);
%     % Final part; no more parts to follow
<<<<<<< HEAD
%     rc = zmq_send(socket, uint8('JK'));
=======
%     rc = zmq_send(socket, uint8('IJ'));
>>>>>>> 387c819da2b753383aefd85df9090ea8861870a5
%     assert (rc == 2);
%
% Please refer to http://api.zeromq.org/4-0:zmq-send for further information.
%