.class public Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
.super Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
.source "NioTcpMessageChannel.java"


# static fields
.field private static final BUF_SIZE:I = 0x1000

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private final byteBuffer:Ljava/nio/ByteBuffer;

.field protected lastActivityTimeStamp:J

.field nioParser:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

.field protected socketChannel:Ljava/nio/channels/SocketChannel;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 60
    const-class v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)V
    .locals 6
    .param p1, "nioTcpMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    .param p2, "socketChannel"    # Ljava/nio/channels/SocketChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 137
    const-string v0, " socketChannel = "

    const-string v1, "Done creating NioTcpMessageChannel "

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v2

    invoke-direct {p0, v2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 65
    const/4 v2, 0x0

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->nioParser:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    .line 69
    const/16 v2, 0x1000

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 138
    invoke-virtual {p2}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 140
    const/16 v2, 0x20

    :try_start_0
    invoke-virtual {p2}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 141
    invoke-virtual {p2}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/Socket;->getPort()I

    move-result v3

    iput v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPort:I

    .line 142
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    .line 143
    invoke-virtual {p2}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->mySock:Ljava/net/Socket;

    .line 145
    new-instance v3, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxMessageSize()I

    move-result v5

    invoke-direct {v3, v4, p0, v5}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/parser/SIPMessageListener;I)V

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->nioParser:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    .line 147
    iget-object v3, p1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->transport:Ljava/lang/String;

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerProtocol:Ljava/lang/String;

    .line 148
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->lastActivityTimeStamp:J

    .line 149
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPort:I

    iget-object v5, p1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->transport:Ljava/lang/String;

    invoke-static {v3, v4, v5}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    .line 151
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->myAddress:Ljava/lang/String;

    .line 152
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getPort()I

    move-result v3

    iput v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->myPort:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 156
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 160
    :cond_0
    return-void

    .line 155
    :catchall_0
    move-exception v3

    sget-object v4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 156
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_1
    throw v3
.end method

.method public constructor <init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V
    .locals 7
    .param p1, "inetAddress"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p4, "nioTcpMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 165
    const-string v0, " socketChannel = "

    const-string v1, "NioTcpMessageChannel::NioTcpMessageChannel: Done creating NioTcpMessageChannel "

    invoke-direct {p0, p3}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 65
    const/4 v2, 0x0

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->nioParser:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    .line 69
    const/16 v2, 0x1000

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 166
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 167
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NioTcpMessageChannel::NioTcpMessageChannel: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 171
    :cond_0
    :try_start_0
    iput-object p4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 173
    iget-object v2, p4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v2, p1, p2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->createOrReuseSocket(Ljava/net/InetAddress;I)Ljava/nio/channels/SocketChannel;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    .line 175
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 176
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Socket;->getPort()I

    move-result v2

    iput v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPort:I

    .line 177
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->mySock:Ljava/net/Socket;

    .line 178
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerProtocol:Ljava/lang/String;

    .line 179
    new-instance v2, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxMessageSize()I

    move-result v4

    invoke-direct {v2, p3, p0, v4}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/parser/SIPMessageListener;I)V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->nioParser:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    .line 181
    iget-object v2, p4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 182
    .local v2, "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2, v4, p0}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putMessageChannel(Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;)V

    .line 183
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->lastActivityTimeStamp:J

    .line 184
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPort:I

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    .line 186
    invoke-virtual {p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->myAddress:Ljava/lang/String;

    .line 187
    invoke-virtual {p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getPort()I

    move-result v4

    iput v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->myPort:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    .end local v2    # "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 192
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 196
    :cond_1
    return-void

    .line 191
    :catchall_0
    move-exception v2

    sget-object v4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 192
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_2
    throw v2
.end method


# virtual methods
.method protected addBytes([B)V
    .locals 1
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 132
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->nioParser:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->addBytes([B)V

    .line 133
    return-void
.end method

.method protected close(ZZ)V
    .locals 5
    .param p1, "removeSocket"    # Z
    .param p2, "stopKeepAliveTask"    # Z

    .line 205
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, " socketChannel = "

    if-eqz v0, :cond_0

    .line 206
    :try_start_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Closing NioTcpMessageChannel "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 209
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 210
    .local v0, "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->removeMessageChannel(Ljava/nio/channels/SocketChannel;)V

    .line 211
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eqz v3, :cond_1

    .line 212
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v3}, Ljava/nio/channels/SocketChannel;->close()V

    .line 214
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->nioParser:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    if-eqz v3, :cond_2

    .line 215
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->nioParser:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->close()V

    .line 217
    :cond_2
    const/4 v3, 0x0

    iput-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->isRunning:Z

    .line 218
    if-eqz p1, :cond_4

    .line 219
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 220
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Removing NioTcpMessageChannel "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 223
    :cond_3
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->removeSocket(Ljava/nio/channels/SocketChannel;)V

    .line 224
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    invoke-virtual {v1, p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->remove(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V

    .line 226
    :cond_4
    if-eqz p2, :cond_5

    .line 227
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->cancelPingKeepAliveTimeoutTaskIfStarted()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 231
    .end local v0    # "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    :cond_5
    goto :goto_0

    .line 229
    :catch_0
    move-exception v0

    .line 230
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "Problem occured while closing"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 233
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 437
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 438
    return v1

    .line 440
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    .line 441
    .local v0, "that":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    iget-object v3, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eq v2, v3, :cond_1

    .line 442
    return v1

    .line 444
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method public getLastActivityTimestamp()J
    .locals 2

    .line 456
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->lastActivityTimeStamp:J

    return-wide v0
.end method

.method public getSocketChannel()Ljava/nio/channels/SocketChannel;
    .locals 1

    .line 199
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    return-object v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 241
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->transport:Ljava/lang/String;

    return-object v0
.end method

.method public handleException(Ljava/text/ParseException;Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "ex"    # Ljava/text/ParseException;
    .param p2, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p3, "hdrClass"    # Ljava/lang/Class;
    .param p4, "header"    # Ljava/lang/String;
    .param p5, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 382
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 383
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "Parsing Exception: "

    invoke-interface {v0, v2, p1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 385
    :cond_0
    if-eqz p3, :cond_5

    const-class v0, Landroid/gov/nist/javax/sip/header/From;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/To;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/Via;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/CallID;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 393
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 394
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Encountered Bad Message \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 400
    :cond_2
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->toString()Ljava/lang/String;

    move-result-object v0

    .line 401
    .local v0, "msgString":Ljava/lang/String;
    const-string/jumbo v1, "SIP/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "ACK "

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 402
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eqz v1, :cond_4

    .line 403
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 404
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Malformed mandatory headers: closing socket! :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 410
    :cond_3
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 418
    goto :goto_0

    .line 412
    :catch_0
    move-exception v1

    .line 413
    .local v1, "ie":Ljava/io/IOException;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 414
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception while closing socket! :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 422
    .end local v1    # "ie":Ljava/io/IOException;
    :cond_4
    :goto_0
    throw p1

    .line 424
    .end local v0    # "msgString":Ljava/lang/String;
    :cond_5
    invoke-virtual {p2, p4}, Landroid/gov/nist/javax/sip/message/SIPMessage;->addUnparsed(Ljava/lang/String;)V

    .line 426
    return-void
.end method

.method public isSecure()Z
    .locals 1

    .line 452
    const/4 v0, 0x0

    return v0
.end method

.method public onNewSocket([B)V
    .locals 0
    .param p1, "message"    # [B

    .line 363
    return-void
.end method

.method public readChannel()V
    .locals 9

    .line 72
    const-string v0, ":"

    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 73
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "NioTcpMessageChannel::readChannel"

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 76
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->isRunning:Z

    .line 78
    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4, v5}, Ljava/nio/channels/SocketChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v4

    .line 79
    .local v4, "nbytes":I
    sget-object v5, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 80
    sget-object v5, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Read "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " from socketChannel"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 82
    :cond_1
    const/4 v5, -0x1

    if-ne v4, v5, :cond_2

    move v5, v1

    goto :goto_0

    :cond_2
    move v5, v3

    .line 83
    .local v5, "streamError":Z
    :goto_0
    if-nez v5, :cond_4

    .line 87
    if-eqz v4, :cond_3

    .line 91
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 92
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    new-array v6, v6, [B

    .line 93
    .local v6, "msg":[B
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v7, v6}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 94
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 97
    invoke-virtual {p0, v6}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->addBytes([B)V

    .line 98
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    iput-wide v7, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->lastActivityTimeStamp:J

    .line 123
    .end local v4    # "nbytes":I
    .end local v5    # "streamError":Z
    .end local v6    # "msg":[B
    goto/16 :goto_2

    .line 88
    .restart local v4    # "nbytes":I
    .restart local v5    # "streamError":Z
    :cond_3
    new-instance v6, Ljava/io/IOException;

    const-string/jumbo v7, "The socket is giving us empty TCP packets. This is usually an indication we are stuck and it is better to disconnect."

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 84
    :cond_4
    new-instance v6, Ljava/io/IOException;

    const-string v7, "End-of-stream read (-1). This is usually an indication we are stuck and it is better to disconnect."

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .end local v4    # "nbytes":I
    .end local v5    # "streamError":Z
    :catch_0
    move-exception v4

    .line 102
    .local v4, "ex":Ljava/lang/Exception;
    instance-of v5, v4, Ljava/io/IOException;

    if-eqz v5, :cond_5

    instance-of v5, v4, Ljavax/net/ssl/SSLException;

    if-nez v5, :cond_5

    .line 104
    :try_start_1
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->nioParser:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    const-string v6, "\r\n\r\n"

    const-string/jumbo v7, "UTF-8"

    invoke-virtual {v6, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->addBytes([B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 107
    goto :goto_1

    .line 105
    :catch_1
    move-exception v5

    .line 111
    :cond_5
    :goto_1
    :try_start_2
    sget-object v5, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 112
    sget-object v5, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "I/O Issue closing sock "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "myAddress:myport "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->myAddress:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->myPort:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", remoteAddress:remotePort "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v6, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPort:I

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 113
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 116
    :cond_6
    invoke-virtual {p0, v1, v3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->close(ZZ)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 122
    goto :goto_2

    .line 119
    :catch_2
    move-exception v0

    .line 120
    .local v0, "ex1":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 121
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Issue closing the socket "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 128
    .end local v0    # "ex1":Ljava/lang/Exception;
    .end local v4    # "ex":Ljava/lang/Exception;
    :cond_7
    :goto_2
    return-void
.end method

.method public sendMessage([BLjava/net/InetAddress;IZ)V
    .locals 0
    .param p1, "message"    # [B
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .param p4, "retry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 280
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendTCPMessage([BLjava/net/InetAddress;IZ)V

    .line 281
    return-void
.end method

.method protected sendMessage([BZ)V
    .locals 3
    .param p1, "msg"    # [B
    .param p2, "isClient"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 254
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 255
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sendMessage isClient  = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 257
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->lastActivityTimeStamp:J

    .line 259
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 260
    .local v0, "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 261
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPort:I

    invoke-static {v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putSocket(Ljava/lang/String;Ljava/nio/channels/SocketChannel;)V

    .line 263
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPort:I

    invoke-virtual {p0, p1, v1, v2, p2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendTCPMessage([BLjava/net/InetAddress;IZ)V

    .line 264
    return-void
.end method

.method public sendTCPMessage([BLjava/net/InetAddress;IZ)V
    .locals 9
    .param p1, "message"    # [B
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .param p4, "retry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 296
    if-eqz p1, :cond_7

    if-eqz p2, :cond_7

    .line 300
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->lastActivityTimeStamp:J

    .line 302
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPortAdvertisedInHeaders:I

    if-gtz v0, :cond_2

    .line 303
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    const-string v2, " key "

    const-string v3, " for this channel "

    if-eqz v0, :cond_0

    .line 304
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "receiver port = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 307
    :cond_0
    if-gtz p3, :cond_1

    .line 309
    const/16 v0, 0x13c4

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPortAdvertisedInHeaders:I

    goto :goto_0

    .line 311
    :cond_1
    iput p3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPortAdvertisedInHeaders:I

    .line 313
    :goto_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 314
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "2.Storing peerPortAdvertisedInHeaders = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 319
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 321
    .local v0, "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->transport:Ljava/lang/String;

    move-object v1, v0

    move-object v3, p2

    move v4, p3

    move-object v6, p1

    move v7, p4

    move-object v8, p0

    invoke-virtual/range {v1 .. v8}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;)Ljava/nio/channels/SocketChannel;

    move-result-object v1

    .line 325
    .local v1, "sock":Ljava/nio/channels/SocketChannel;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eq v1, v2, :cond_6

    if-eqz v1, :cond_6

    .line 326
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    const/16 v3, 0x8

    if-eqz v2, :cond_4

    .line 327
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 328
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "[2] Old socket different than new socket on channel "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 331
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 332
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Old socket local ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v5}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 334
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Old socket remote ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v5}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 336
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "New socket local ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 338
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "New socket remote ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 341
    :cond_3
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->close(ZZ)V

    .line 343
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    .line 344
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v2, p0}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putMessageChannel(Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;)V

    .line 346
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->onNewSocket([B)V

    .line 349
    :cond_4
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eqz v2, :cond_5

    .line 350
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 351
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "There was no exception for the retry mechanism so we keep going "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 356
    :cond_5
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    .line 359
    :cond_6
    return-void

    .line 297
    .end local v0    # "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    .end local v1    # "sock":Ljava/nio/channels/SocketChannel;
    :cond_7
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "receiverAddress = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 298
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Null argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized triggerConnectFailure(Ljava/util/Queue;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;",
            ">;)V"
        }
    .end annotation

    .local p1, "failedMsgs":Ljava/util/Queue;, "Ljava/util/Queue<Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;>;"
    monitor-enter p0

    .line 468
    nop

    :goto_0
    if-eqz p1, :cond_3

    :try_start_0
    invoke-interface {p1}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 469
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;

    .line 471
    .local v0, "pData":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;->txId:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findTransaction(Ljava/lang/String;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v1

    .line 472
    .local v1, "transaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    if-eqz v1, :cond_2

    .line 473
    instance-of v2, v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    if-eqz v2, :cond_1

    .line 475
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ACK"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 478
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 479
    .local v2, "req":Landroid/gov/nist/javax/sip/message/SIPRequest;
    const-string/jumbo v3, "Transport error sending request."

    const/16 v4, 0x1f7

    invoke-virtual {v2, v4, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(ILjava/lang/String;)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 481
    .local v3, "unavRes":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :try_start_1
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 486
    goto :goto_1

    .line 482
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    :catch_0
    move-exception v4

    .line 483
    .local v4, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v5, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v6, 0x20

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 484
    sget-object v5, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v6, "failed to report transport error"

    invoke-interface {v5, v6, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 487
    .end local v2    # "req":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v3    # "unavRes":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_1
    goto :goto_2

    .line 490
    :cond_1
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->raiseIOExceptionEvent()V

    .line 493
    .end local v0    # "pData":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;
    .end local v1    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    :cond_2
    :goto_2
    goto :goto_0

    .line 494
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 495
    monitor-exit p0

    return-void

    .line 467
    .end local p1    # "failedMsgs":Ljava/util/Queue;, "Ljava/util/Queue<Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;>;"
    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1
.end method

.method public triggerConnectSuccess()V
    .locals 2

    .line 460
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 461
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "Connection Success. Nothing else to do."

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 464
    :cond_0
    return-void
.end method
