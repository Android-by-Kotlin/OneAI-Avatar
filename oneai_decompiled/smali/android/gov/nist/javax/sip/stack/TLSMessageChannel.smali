.class public Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
.super Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
.source "TLSMessageChannel.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private handshakeCompleted:Z

.field private handshakeCompletedListener:Ljavax/net/ssl/HandshakeCompletedListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 75
    const-class v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;)V
    .locals 3
    .param p1, "inetAddr"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p4, "messageProcessor"    # Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 152
    invoke-direct {p0, p3}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 78
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompleted:Z

    .line 153
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "creating new TLSMessageChannel (outgoing)"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 156
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 158
    :cond_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 159
    iput p2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPort:I

    .line 160
    invoke-virtual {p4}, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->getPort()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myPort:I

    .line 161
    const-string/jumbo v0, "TLS"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerProtocol:Ljava/lang/String;

    .line 162
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 163
    invoke-virtual {p4}, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myAddress:Ljava/lang/String;

    .line 164
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPort:I

    invoke-static {v1, v2, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    .line 165
    iput-object p4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 167
    return-void
.end method

.method protected constructor <init>(Ljava/net/Socket;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;Ljava/lang/String;)V
    .locals 5
    .param p1, "sock"    # Ljava/net/Socket;
    .param p2, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p3, "msgProcessor"    # Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;
    .param p4, "threadName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    invoke-direct {p0, p2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 78
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompleted:Z

    .line 102
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "creating new TLSMessageChannel (incoming)"

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 105
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 108
    :cond_0
    move-object v0, p1

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    .line 109
    instance-of v0, p1, Ljavax/net/ssl/SSLSocket;

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 110
    move-object v0, p1

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .line 111
    .local v0, "sslSock":Ljavax/net/ssl/SSLSocket;
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v3

    sget-object v4, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Want:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    if-eq v3, v4, :cond_1

    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v3

    sget-object v4, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Disabled:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    if-eq v3, v4, :cond_1

    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v3

    sget-object v4, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->DisabledAll:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    if-eq v3, v4, :cond_1

    .line 112
    invoke-virtual {v0, v2}, Ljavax/net/ssl/SSLSocket;->setNeedClientAuth(Z)V

    .line 114
    :cond_1
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 115
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "SSLServerSocket need client auth "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getNeedClientAuth()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 119
    .end local v0    # "sslSock":Ljavax/net/ssl/SSLSocket;
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 120
    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myAddress:Ljava/lang/String;

    .line 121
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 123
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mythread:Ljava/lang/Thread;

    .line 124
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mythread:Ljava/lang/Thread;

    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 125
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mythread:Ljava/lang/Thread;

    invoke-virtual {v0, p4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 127
    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->getPort()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myPort:I

    .line 128
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getPort()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPort:I

    .line 129
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPort:I

    const-string/jumbo v2, "TLS"

    invoke-static {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    .line 131
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 133
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mythread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 134
    return-void
.end method


# virtual methods
.method public close(ZZ)V
    .locals 5
    .param p1, "removeSocket"    # Z
    .param p2, "stopKeepAliveTask"    # Z

    .line 173
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->isRunning:Z

    .line 176
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    const/16 v1, 0x20

    if-eqz v0, :cond_1

    .line 177
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 178
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Closing socket "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 180
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    goto :goto_0

    .line 181
    :catch_0
    move-exception v0

    .line 182
    .local v0, "ex":Ljava/io/IOException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 183
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error closing socket "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 186
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_1
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    if-eqz v0, :cond_3

    .line 187
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 188
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Closing my parser "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 189
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->close()V

    .line 191
    :cond_3
    const/4 v0, 0x4

    if-eqz p1, :cond_6

    .line 193
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 194
    .local v0, "ioHandlerKey":Ljava/lang/String;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 195
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Closing TLS socket "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 197
    :cond_4
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/stack/IOHandler;->removeSocket(Ljava/lang/String;)V

    .line 199
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 200
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Closing message Channel (key = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 202
    .end local v0    # "ioHandlerKey":Ljava/lang/String;
    :cond_5
    goto :goto_1

    .line 203
    :cond_6
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 204
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 205
    .restart local v0    # "ioHandlerKey":Ljava/lang/String;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "not removing socket key from the cached map since it has already been updated by the iohandler.sendBytes "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 208
    .end local v0    # "ioHandlerKey":Ljava/lang/String;
    :cond_7
    :goto_1
    if-eqz p2, :cond_8

    .line 209
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->cancelPingKeepAliveTimeoutTaskIfStarted()V

    .line 211
    :cond_8
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 483
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 484
    return v1

    .line 486
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    .line 487
    .local v0, "that":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    iget-object v3, v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    if-eq v2, v3, :cond_1

    .line 488
    return v1

    .line 490
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method public getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    .locals 1

    .line 510
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompletedListener:Ljavax/net/ssl/HandshakeCompletedListener;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    return-object v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 219
    const-string/jumbo v0, "TLS"

    return-object v0
.end method

.method public handleException(Ljava/text/ParseException;Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
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

    .line 428
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 429
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "Parsing Exception: "

    invoke-interface {v0, v2, p1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 431
    :cond_0
    if-eqz p3, :cond_6

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

    if-eqz v0, :cond_6

    .line 439
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 440
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Encountered bad message \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 443
    :cond_2
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->toString()Ljava/lang/String;

    move-result-object v0

    .line 444
    .local v0, "msgString":Ljava/lang/String;
    const-string/jumbo v2, "SIP/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "ACK "

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 446
    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->createBadReqRes(Ljava/lang/String;Ljava/text/ParseException;)Ljava/lang/String;

    move-result-object v2

    .line 447
    .local v2, "badReqRes":Ljava/lang/String;
    if-eqz v2, :cond_4

    .line 448
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 449
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "Sending automatic 400 Bad Request:"

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 451
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 454
    :cond_3
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getPeerInetAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getPeerPort()I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {p0, v1, v3, v4, v5}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->sendMessage([BLjava/net/InetAddress;IZ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 457
    :catch_0
    move-exception v1

    .line 458
    .local v1, "e":Ljava/io/IOException;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 459
    .end local v1    # "e":Ljava/io/IOException;
    :goto_0
    goto :goto_1

    .line 461
    :cond_4
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 462
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Could not formulate automatic 400 Bad Request"

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 468
    .end local v2    # "badReqRes":Ljava/lang/String;
    :cond_5
    :goto_1
    throw p1

    .line 470
    .end local v0    # "msgString":Ljava/lang/String;
    :cond_6
    invoke-virtual {p2, p4}, Landroid/gov/nist/javax/sip/message/SIPMessage;->addUnparsed(Ljava/lang/String;)V

    .line 472
    return-void
.end method

.method public isHandshakeCompleted()Z
    .locals 1

    .line 567
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompleted:Z

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .line 498
    const/4 v0, 0x1

    return v0
.end method

.method public run()V
    .locals 5

    .line 517
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompleted:Z

    if-nez v0, :cond_1

    .line 518
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .line 519
    .local v0, "sslSock":Ljavax/net/ssl/SSLSocket;
    new-instance v1, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    invoke-direct {v1, p0, v0}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;-><init>(Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;Ljava/net/Socket;)V

    .line 520
    .local v1, "listener":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompletedListener:Ljavax/net/ssl/HandshakeCompletedListener;

    .line 521
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompletedListener:Ljavax/net/ssl/HandshakeCompletedListener;

    invoke-virtual {v0, v2}, Ljavax/net/ssl/SSLSocket;->addHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 522
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->startHandshakeWatchdog()V

    .line 524
    :try_start_0
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 525
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompleted:Z

    .line 526
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isSslRenegotiationEnabled()Z

    move-result v2

    if-nez v2, :cond_0

    .line 533
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v2

    invoke-interface {v2}, Ljavax/net/ssl/SSLSession;->invalidate()V

    .line 534
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljavax/net/ssl/SSLSocket;->setEnableSessionCreation(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 558
    :cond_0
    goto :goto_2

    .line 536
    :catch_0
    move-exception v2

    .line 537
    .local v2, "e":Ljava/io/IOException;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "A problem occured while Accepting connection"

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 539
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompletedListener:Ljavax/net/ssl/HandshakeCompletedListener;

    invoke-virtual {v0, v3}, Ljavax/net/ssl/SSLSocket;->removeHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 540
    const/4 v3, 0x0

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompletedListener:Ljavax/net/ssl/HandshakeCompletedListener;

    .line 542
    :try_start_1
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 546
    :catchall_0
    move-exception v4

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    throw v4

    .line 543
    :catch_1
    move-exception v4

    .line 546
    :goto_0
    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 547
    nop

    .line 550
    :try_start_2
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v4}, Ljava/net/Socket;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    .line 554
    :catchall_1
    move-exception v4

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    throw v4

    .line 551
    :catch_2
    move-exception v4

    .line 554
    :goto_1
    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    .line 555
    nop

    .line 557
    return-void

    .line 560
    .end local v0    # "sslSock":Ljavax/net/ssl/SSLSocket;
    .end local v1    # "listener":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    .end local v2    # "e":Ljava/io/IOException;
    :cond_1
    :goto_2
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->run()V

    .line 561
    return-void
.end method

.method public declared-synchronized sendMessage([BLjava/net/InetAddress;IZ)V
    .locals 11
    .param p1, "message"    # [B
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .param p4, "retry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 318
    if-eqz p1, :cond_b

    if-eqz p2, :cond_b

    .line 321
    :try_start_0
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    if-gtz v0, :cond_2

    .line 322
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 323
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "receiver port = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " for this channel "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " key "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 325
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    :cond_0
    if-gtz p3, :cond_1

    .line 327
    const/16 v0, 0x13c4

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    goto :goto_0

    .line 329
    :cond_1
    iput p3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    .line 331
    :goto_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 332
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "2.Storing peerPortAdvertisedInHeaders = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " for this channel "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " key "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 336
    :cond_2
    const/4 v0, 0x0

    .line 337
    .local v0, "sock":Ljava/net/Socket;
    const/4 v1, 0x0

    .line 339
    .local v1, "problem":Ljava/io/IOException;
    :try_start_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v3, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v4

    const-string/jumbo v7, "TLS"

    move-object v5, p2

    move v6, p3

    move-object v8, p1

    move v9, p4

    move-object v10, p0

    invoke-virtual/range {v3 .. v10}, Landroid/gov/nist/javax/sip/stack/IOHandler;->sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/MessageChannel;)Ljava/net/Socket;

    move-result-object v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, v2

    .line 350
    goto :goto_1

    .line 341
    :catch_0
    move-exception v2

    .line 342
    .local v2, "any":Ljava/io/IOException;
    move-object v1, v2

    .line 343
    :try_start_2
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to connect "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " but trying the advertised port="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " if it\'s different than the port we just failed on, rcv addr="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", port="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 349
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Error is "

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 351
    .end local v2    # "any":Ljava/io/IOException;
    :goto_1
    if-nez v0, :cond_4

    .line 352
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddressAdvertisedInHeaders:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    if-lez v2, :cond_3

    .line 353
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Couldn\'t connect to receiverAddress = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " receiverPort = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " key = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " retrying on peerPortAdvertisedInHeaders "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 354
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddressAdvertisedInHeaders:Ljava/lang/String;

    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    .line 355
    .local v2, "address":Ljava/net/InetAddress;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v4

    iget v6, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    const-string/jumbo v7, "TLS"

    move-object v5, v2

    move-object v8, p1

    move v9, p4

    move-object v10, p0

    invoke-virtual/range {v3 .. v10}, Landroid/gov/nist/javax/sip/stack/IOHandler;->sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/MessageChannel;)Ljava/net/Socket;

    move-result-object v3

    move-object v0, v3

    .line 357
    iget v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    iput v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPort:I

    .line 358
    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 359
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    const-string/jumbo v5, "TLS"

    invoke-static {v3, v4, v5}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    .line 361
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "retry suceeded to receiverAddress = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " peerPortAdvertisedInHeaders = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " key = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 362
    .end local v2    # "address":Ljava/net/InetAddress;
    goto :goto_2

    .line 363
    :cond_3
    throw v1

    .line 369
    :cond_4
    :goto_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    if-eq v0, v2, :cond_a

    if-eqz v0, :cond_a

    .line 370
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    const/16 v3, 0x8

    if-eqz v2, :cond_6

    .line 371
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 372
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Old socket different than new socket on channel "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 374
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 375
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Old socket local ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 377
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Old socket remote ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 379
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "New socket local ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 381
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "New socket remote ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 385
    :cond_5
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v2}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->close(ZZ)V

    .line 387
    :cond_6
    if-nez v1, :cond_8

    .line 388
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    if-eqz v2, :cond_7

    .line 389
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 390
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "There was no exception for the retry mechanism so creating a new thread based on the new socket for incoming "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 394
    :cond_7
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    .line 395
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 397
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 398
    .local v2, "mythread":Ljava/lang/Thread;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 399
    const-string/jumbo v3, "TCPMessageChannelThread"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 400
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 401
    .end local v2    # "mythread":Ljava/lang/Thread;
    goto :goto_3

    .line 402
    :cond_8
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 403
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "There was an exception for the retry mechanism so not creating a new thread based on the new socket for incoming "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 406
    :cond_9
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 410
    :cond_a
    :goto_3
    monitor-exit p0

    return-void

    .line 319
    .end local v0    # "sock":Ljava/net/Socket;
    .end local v1    # "problem":Ljava/io/IOException;
    :cond_b
    :try_start_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Null argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 317
    .end local p1    # "message":[B
    .end local p2    # "receiverAddress":Ljava/net/InetAddress;
    .end local p3    # "receiverPort":I
    .end local p4    # "retry":Z
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1
.end method

.method protected declared-synchronized sendMessage([BZ)V
    .locals 11
    .param p1, "msg"    # [B
    .param p2, "retry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 232
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 233
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sendMessage isClient  = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    :cond_0
    const/4 v0, 0x0

    .line 236
    .local v0, "sock":Ljava/net/Socket;
    const/4 v1, 0x0

    .line 238
    .local v1, "problem":Ljava/io/IOException;
    :try_start_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v3, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v6, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPort:I

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerProtocol:Ljava/lang/String;

    move-object v8, p1

    move v9, p2

    move-object v10, p0

    invoke-virtual/range {v3 .. v10}, Landroid/gov/nist/javax/sip/stack/IOHandler;->sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/MessageChannel;)Ljava/net/Socket;

    move-result-object v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, v2

    .line 245
    goto :goto_0

    .line 241
    :catch_0
    move-exception v2

    .line 242
    .local v2, "any":Ljava/io/IOException;
    move-object v1, v2

    .line 243
    :try_start_2
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to connect "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPort:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " but trying the advertised port="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " if it\'s different than the port we just failed on"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 244
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Error is "

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 246
    .end local v2    # "any":Ljava/io/IOException;
    :goto_0
    if-nez v0, :cond_2

    .line 247
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddressAdvertisedInHeaders:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    if-lez v2, :cond_1

    .line 248
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Couldn\'t connect to peerAddress = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " peerPort = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPort:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " key = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " retrying on peerPortAdvertisedInHeaders "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 249
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddressAdvertisedInHeaders:Ljava/lang/String;

    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    .line 250
    .local v2, "address":Ljava/net/InetAddress;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v4

    iget v6, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerProtocol:Ljava/lang/String;

    move-object v5, v2

    move-object v8, p1

    move v9, p2

    move-object v10, p0

    invoke-virtual/range {v3 .. v10}, Landroid/gov/nist/javax/sip/stack/IOHandler;->sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/MessageChannel;)Ljava/net/Socket;

    move-result-object v3

    move-object v0, v3

    .line 252
    iget v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    iput v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPort:I

    .line 253
    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 254
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPort:I

    const-string/jumbo v5, "TLS"

    invoke-static {v3, v4, v5}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    .line 255
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "retry suceeded to peerAddress = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " peerPortAdvertisedInHeaders = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " key = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 256
    .end local v2    # "address":Ljava/net/InetAddress;
    goto :goto_1

    .line 257
    :cond_1
    throw v1

    .line 263
    :cond_2
    :goto_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    if-eq v0, v2, :cond_8

    if-eqz v0, :cond_8

    .line 264
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    const/16 v3, 0x8

    if-eqz v2, :cond_4

    .line 265
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 266
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Old socket different than new socket on channel "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 268
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 269
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Old socket local ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 271
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Old socket remote ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 273
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "New socket local ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 275
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "New socket remote ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 278
    :cond_3
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v2}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->close(ZZ)V

    .line 280
    :cond_4
    if-nez v1, :cond_6

    .line 281
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    if-eqz v2, :cond_5

    .line 282
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 283
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "There was no exception for the retry mechanism so creating a new thread based on the new socket for incoming "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 287
    :cond_5
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    .line 288
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 289
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 290
    .local v2, "thread":Ljava/lang/Thread;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 291
    const-string/jumbo v3, "TCPMessageChannelThread"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 292
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 293
    .end local v2    # "thread":Ljava/lang/Thread;
    goto :goto_2

    .line 294
    :cond_6
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 295
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "There was an exception for the retry mechanism so not creating a new thread based on the new socket for incoming "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 298
    :cond_7
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->mySock:Ljava/net/Socket;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 302
    :cond_8
    :goto_2
    monitor-exit p0

    return-void

    .line 231
    .end local v0    # "sock":Ljava/net/Socket;
    .end local v1    # "problem":Ljava/io/IOException;
    .end local p1    # "msg":[B
    .end local p2    # "retry":Z
    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1
.end method

.method public setHandshakeCompleted(Z)V
    .locals 0
    .param p1, "handshakeCompleted"    # Z

    .line 574
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompleted:Z

    .line 575
    return-void
.end method

.method public setHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V
    .locals 0
    .param p1, "handshakeCompletedListenerImpl"    # Ljavax/net/ssl/HandshakeCompletedListener;

    .line 503
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->handshakeCompletedListener:Ljavax/net/ssl/HandshakeCompletedListener;

    .line 504
    return-void
.end method
