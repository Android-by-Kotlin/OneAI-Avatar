.class public Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
.super Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
.source "TCPMessageChannel.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected myClientOutputStream:Ljava/io/OutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 74
    const-class v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    .locals 0
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 79
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 80
    return-void
.end method

.method protected constructor <init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;)V
    .locals 3
    .param p1, "inetAddr"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p4, "messageProcessor"    # Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    invoke-direct {p0, p3}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 141
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 142
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "creating new TCPMessageChannel "

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 144
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 146
    :cond_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 147
    iput p2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    .line 148
    invoke-virtual {p4}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getPort()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myPort:I

    .line 149
    const-string/jumbo v0, "TCP"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerProtocol:Ljava/lang/String;

    .line 150
    invoke-virtual {p4}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myAddress:Ljava/lang/String;

    .line 152
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    invoke-static {v1, v2, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    .line 153
    iput-object p4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 155
    return-void
.end method

.method protected constructor <init>(Ljava/net/Socket;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;Ljava/lang/String;)V
    .locals 3
    .param p1, "sock"    # Ljava/net/Socket;
    .param p2, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p3, "msgProcessor"    # Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;
    .param p4, "threadName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    invoke-direct {p0, p2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 101
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 102
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "creating new TCPMessageChannel "

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 104
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 106
    :cond_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    .line 107
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 108
    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myAddress:Ljava/lang/String;

    .line 109
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 110
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myClientOutputStream:Ljava/io/OutputStream;

    .line 111
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mythread:Ljava/lang/Thread;

    .line 112
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mythread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 113
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mythread:Ljava/lang/Thread;

    invoke-virtual {v0, p4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 114
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getPort()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    .line 115
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    const-string/jumbo v2, "TCP"

    invoke-static {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    .line 117
    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getPort()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myPort:I

    .line 119
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 121
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mythread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 122
    return-void
.end method


# virtual methods
.method public close(ZZ)V
    .locals 5
    .param p1, "removeSocket"    # Z
    .param p2, "stopKeepAliveTask"    # Z

    .line 161
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->isRunning:Z

    .line 164
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    const/16 v1, 0x20

    if-eqz v0, :cond_1

    .line 165
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 166
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Closing socket "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 168
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 169
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    goto :goto_0

    .line 170
    :catch_0
    move-exception v0

    .line 171
    .local v0, "ex":Ljava/io/IOException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 172
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 175
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_1
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    if-eqz v0, :cond_3

    .line 176
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 177
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Closing my parser "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 178
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->close()V

    .line 181
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myClientOutputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_5

    .line 182
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 183
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Closing client output stream "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myClientOutputStream:Ljava/io/OutputStream;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 185
    :cond_4
    :try_start_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myClientOutputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 189
    goto :goto_1

    .line 186
    :catch_1
    move-exception v0

    .line 187
    .restart local v0    # "ex":Ljava/io/IOException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 188
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error closing client output stream"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 191
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_5
    :goto_1
    const/4 v0, 0x4

    if-eqz p1, :cond_8

    .line 193
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 194
    .local v0, "ioHandlerKey":Ljava/lang/String;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 195
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Closing TCP socket "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 197
    :cond_6
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/stack/IOHandler;->removeSocket(Ljava/lang/String;)V

    .line 198
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 199
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Closing message Channel (key = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

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

    .line 201
    .end local v0    # "ioHandlerKey":Ljava/lang/String;
    :cond_7
    goto :goto_2

    .line 202
    :cond_8
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 203
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 204
    .restart local v0    # "ioHandlerKey":Ljava/lang/String;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 207
    .end local v0    # "ioHandlerKey":Ljava/lang/String;
    :cond_9
    :goto_2
    if-eqz p2, :cond_a

    .line 208
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->cancelPingKeepAliveTimeoutTaskIfStarted()V

    .line 211
    :cond_a
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 494
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 495
    return v1

    .line 497
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;

    .line 498
    .local v0, "that":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    iget-object v3, v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    if-eq v2, v3, :cond_1

    .line 499
    return v1

    .line 501
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 219
    const-string/jumbo v0, "TCP"

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

    .line 439
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 440
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "Parsing Exception: "

    invoke-interface {v0, v2, p1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 442
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

    .line 450
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 451
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 457
    :cond_2
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->toString()Ljava/lang/String;

    move-result-object v0

    .line 458
    .local v0, "msgString":Ljava/lang/String;
    const-string/jumbo v1, "SIP/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "ACK "

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 459
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    if-eqz v1, :cond_4

    .line 461
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 462
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Malformed mandatory headers: closing socket! :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v4}, Ljava/net/Socket;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 467
    :cond_3
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 475
    goto :goto_0

    .line 469
    :catch_0
    move-exception v1

    .line 471
    .local v1, "ie":Ljava/io/IOException;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 472
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception while closing socket! :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v4}, Ljava/net/Socket;->toString()Ljava/lang/String;

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

    .line 479
    .end local v1    # "ie":Ljava/io/IOException;
    :cond_4
    :goto_0
    throw p1

    .line 481
    .end local v0    # "msgString":Ljava/lang/String;
    :cond_5
    invoke-virtual {p2, p4}, Landroid/gov/nist/javax/sip/message/SIPMessage;->addUnparsed(Ljava/lang/String;)V

    .line 483
    return-void
.end method

.method public isSecure()Z
    .locals 1

    .line 509
    const/4 v0, 0x0

    return v0
.end method

.method public declared-synchronized sendMessage([BLjava/net/InetAddress;IZ)V
    .locals 15
    .param p1, "message"    # [B
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .param p4, "retry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object v9, p0

    move-object/from16 v10, p2

    move/from16 v11, p3

    monitor-enter p0

    .line 329
    if-eqz p1, :cond_d

    if-eqz v10, :cond_d

    .line 332
    :try_start_0
    iget v0, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    if-gtz v0, :cond_2

    .line 333
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 334
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "receiver port = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " for this channel "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " key "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 336
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    :cond_0
    if-gtz v11, :cond_1

    .line 338
    const/16 v0, 0x13c4

    iput v0, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    goto :goto_0

    .line 340
    :cond_1
    iput v11, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    .line 342
    :goto_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 343
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "2.Storing peerPortAdvertisedInHeaders = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

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

    iget-object v2, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 347
    :cond_2
    const/4 v12, 0x0

    .line 348
    .local v12, "sock":Ljava/net/Socket;
    const/4 v13, 0x0

    .line 350
    .local v13, "problem":Ljava/io/IOException;
    :try_start_1
    iget-object v0, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v1, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    iget-object v0, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    const-string/jumbo v5, "TCP"

    move-object/from16 v3, p2

    move/from16 v4, p3

    move-object/from16 v6, p1

    move/from16 v7, p4

    move-object v8, p0

    invoke-virtual/range {v1 .. v8}, Landroid/gov/nist/javax/sip/stack/IOHandler;->sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/MessageChannel;)Ljava/net/Socket;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v12, v0

    .line 357
    goto :goto_1

    .line 352
    :catch_0
    move-exception v0

    .line 353
    .local v0, "any":Ljava/io/IOException;
    move-object v13, v0

    .line 354
    :try_start_2
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to connect "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " but trying the advertised port="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " if it\'s different than the port we just failed on"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 355
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Error is "

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 358
    .end local v0    # "any":Ljava/io/IOException;
    :goto_1
    const/16 v0, 0x8

    if-nez v12, :cond_6

    .line 359
    iget-object v1, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddressAdvertisedInHeaders:Ljava/lang/String;

    if-eqz v1, :cond_5

    iget v1, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    if-lez v1, :cond_5

    .line 360
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 361
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Couldn\'t connect to receiverAddress = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " receiverPort = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " key = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " retrying on peerPortAdvertisedInHeaders "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 365
    :cond_3
    iget-object v1, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddressAdvertisedInHeaders:Ljava/lang/String;

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    move-object v14, v1

    .line 366
    .local v14, "address":Ljava/net/InetAddress;
    iget-object v1, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    iget-object v2, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    iget v4, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    const-string/jumbo v5, "TCP"

    move-object v3, v14

    move-object/from16 v6, p1

    move/from16 v7, p4

    move-object v8, p0

    invoke-virtual/range {v1 .. v8}, Landroid/gov/nist/javax/sip/stack/IOHandler;->sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/MessageChannel;)Ljava/net/Socket;

    move-result-object v1

    move-object v12, v1

    .line 368
    iget v1, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    iput v1, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    .line 369
    iput-object v14, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 370
    iget-object v1, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    const-string/jumbo v3, "TCP"

    invoke-static {v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    .line 371
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 372
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "retry suceeded to peerAddress = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " peerPort = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " key = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 375
    .end local v14    # "address":Ljava/net/InetAddress;
    :cond_4
    goto :goto_2

    .line 376
    :cond_5
    throw v13

    .line 380
    :cond_6
    :goto_2
    iget-object v1, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    if-eq v12, v1, :cond_c

    if-eqz v12, :cond_c

    .line 381
    iget-object v1, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    if-eqz v1, :cond_8

    .line 382
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 383
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Old socket different than new socket on channel "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 385
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 386
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Old socket local ip address "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 388
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Old socket remote ip address "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 390
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "New socket local ip address "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v12}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 392
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "New socket remote ip address "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v12}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 395
    :cond_7
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v1}, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->close(ZZ)V

    .line 397
    :cond_8
    if-nez v13, :cond_a

    .line 398
    iget-object v1, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    if-eqz v1, :cond_9

    .line 399
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 400
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "There was no exception for the retry mechanism so creating a new thread based on the new socket for incoming "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 404
    :cond_9
    iput-object v12, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    .line 405
    iget-object v0, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 406
    iget-object v0, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myClientOutputStream:Ljava/io/OutputStream;

    .line 408
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 409
    .local v0, "mythread":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 410
    const-string/jumbo v1, "TCPMessageChannelThread"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 411
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 412
    .end local v0    # "mythread":Ljava/lang/Thread;
    goto :goto_3

    .line 413
    :cond_a
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 414
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "There was an exception for the retry mechanism so not creating a new thread based on the new socket for incoming "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 417
    :cond_b
    iput-object v12, v9, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 421
    :cond_c
    :goto_3
    monitor-exit p0

    return-void

    .line 330
    .end local v12    # "sock":Ljava/net/Socket;
    .end local v13    # "problem":Ljava/io/IOException;
    :cond_d
    :try_start_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Null argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 328
    .end local p1    # "message":[B
    .end local p2    # "receiverAddress":Ljava/net/InetAddress;
    .end local p3    # "receiverPort":I
    .end local p4    # "retry":Z
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method

.method protected declared-synchronized sendMessage([BZ)V
    .locals 12
    .param p1, "msg"    # [B
    .param p2, "isClient"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 232
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 233
    sget-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 236
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    :cond_0
    const/4 v0, 0x0

    .line 237
    .local v0, "sock":Ljava/net/Socket;
    const/4 v1, 0x0

    .line 239
    .local v1, "problem":Ljava/io/IOException;
    :try_start_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v3, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v6, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerProtocol:Ljava/lang/String;

    move-object v8, p1

    move v9, p2

    move-object v10, p0

    invoke-virtual/range {v3 .. v10}, Landroid/gov/nist/javax/sip/stack/IOHandler;->sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/MessageChannel;)Ljava/net/Socket;

    move-result-object v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, v2

    .line 244
    goto :goto_0

    .line 241
    :catch_0
    move-exception v2

    .line 242
    .local v2, "any":Ljava/io/IOException;
    move-object v1, v2

    .line 243
    :try_start_2
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to connect "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " but trying the advertised port="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " if it\'s different than the port we just failed on"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 245
    .end local v2    # "any":Ljava/io/IOException;
    :goto_0
    const/16 v2, 0x8

    if-nez v0, :cond_4

    .line 246
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddressAdvertisedInHeaders:Ljava/lang/String;

    if-eqz v3, :cond_3

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    if-lez v3, :cond_3

    .line 247
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 248
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Couldn\'t connect to peerAddress = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " peerPort = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " key = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " retrying on peerPortAdvertisedInHeaders "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 252
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddressAdvertisedInHeaders:Ljava/lang/String;

    invoke-static {v3}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v3

    .line 253
    .local v3, "address":Ljava/net/InetAddress;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v5

    iget v7, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerProtocol:Ljava/lang/String;

    move-object v6, v3

    move-object v9, p1

    move v10, p2

    move-object v11, p0

    invoke-virtual/range {v4 .. v11}, Landroid/gov/nist/javax/sip/stack/IOHandler;->sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/MessageChannel;)Ljava/net/Socket;

    move-result-object v4

    move-object v0, v4

    .line 255
    iget v4, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    iput v4, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    .line 256
    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 257
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPort:I

    const-string/jumbo v6, "TCP"

    invoke-static {v4, v5, v6}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    .line 258
    sget-object v4, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 259
    sget-object v4, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "retry suceeded to peerAddress = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " peerPortAdvertisedInHeaders = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " key = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 262
    .end local v3    # "address":Ljava/net/InetAddress;
    :cond_2
    goto :goto_1

    .line 263
    :cond_3
    throw v1

    .line 273
    :cond_4
    :goto_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    if-eq v0, v3, :cond_a

    if-eqz v0, :cond_a

    .line 274
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    if-eqz v3, :cond_6

    .line 275
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 276
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Old socket different than new socket on channel "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 278
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 279
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Old socket local ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 281
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Old socket remote ip address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 283
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

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

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 285
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

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

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 288
    :cond_5
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v3}, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->close(ZZ)V

    .line 290
    :cond_6
    if-nez v1, :cond_8

    .line 291
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    if-eqz v3, :cond_7

    .line 292
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 293
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "There was no exception for the retry mechanism so creating a new thread based on the new socket for incoming "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 297
    :cond_7
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    .line 298
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 299
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->myClientOutputStream:Ljava/io/OutputStream;

    .line 300
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 301
    .local v2, "thread":Ljava/lang/Thread;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 302
    const-string/jumbo v3, "TCPMessageChannelThread"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 303
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 304
    .end local v2    # "thread":Ljava/lang/Thread;
    goto :goto_2

    .line 305
    :cond_8
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 306
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "There was an exception for the retry mechanism so not creating a new thread based on the new socket for incoming "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 309
    :cond_9
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->mySock:Ljava/net/Socket;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 313
    :cond_a
    :goto_2
    monitor-exit p0

    return-void

    .line 231
    .end local v0    # "sock":Ljava/net/Socket;
    .end local v1    # "problem":Ljava/io/IOException;
    .end local p1    # "msg":[B
    .end local p2    # "isClient":Z
    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1
.end method
