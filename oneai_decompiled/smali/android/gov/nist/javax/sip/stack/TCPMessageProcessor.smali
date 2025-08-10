.class public Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;
.super Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;
.source "TCPMessageProcessor.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 66
    const-class v0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V
    .locals 1
    .param p1, "ipAddress"    # Ljava/net/InetAddress;
    .param p2, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p3, "port"    # I

    .line 75
    const-string/jumbo v0, "tcp"

    invoke-direct {p0, p1, p3, v0, p2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;-><init>(Ljava/net/InetAddress;ILjava/lang/String;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 76
    return-void
.end method


# virtual methods
.method public declared-synchronized createMessageChannel(Landroid/gov/nist/core/HostPort;)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 5
    .param p1, "targetHostPort"    # Landroid/gov/nist/core/HostPort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 186
    :try_start_0
    const-string/jumbo v0, "TCP"

    invoke-static {p1, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Landroid/gov/nist/core/HostPort;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 187
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 188
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 190
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;
    :cond_0
    :try_start_1
    new-instance v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;

    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v1, v2, v3, v4, p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;)V

    .line 192
    .local v1, "retval":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->isCached:Z

    .line 194
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 195
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "key "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 196
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Creating "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 198
    :cond_1
    monitor-exit p0

    return-object v1

    .line 185
    .end local v0    # "key":Ljava/lang/String;
    .end local v1    # "retval":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    .end local p1    # "targetHostPort":Landroid/gov/nist/core/HostPort;
    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public declared-synchronized createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 5
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 205
    :try_start_0
    const-string/jumbo v0, "TCP"

    invoke-static {p1, p2, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 207
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 209
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;
    :cond_0
    :try_start_1
    new-instance v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v1, p1, p2, v2, p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;)V

    .line 210
    .local v1, "retval":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->isCached:Z

    .line 212
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 213
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "key "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 214
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Creating "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 216
    :cond_1
    monitor-exit p0

    return-object v1

    .line 204
    .end local v0    # "key":Ljava/lang/String;
    .end local v1    # "retval":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    .end local p1    # "host":Ljava/net/InetAddress;
    .end local p2    # "port":I
    :catchall_0
    move-exception p1

    goto :goto_0

    .line 218
    .restart local p1    # "host":Ljava/net/InetAddress;
    .restart local p2    # "port":I
    :catch_0
    move-exception v0

    .line 219
    .local v0, "ex":Ljava/net/UnknownHostException;
    :try_start_2
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/net/UnknownHostException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 204
    .end local v0    # "ex":Ljava/net/UnknownHostException;
    .end local p1    # "host":Ljava/net/InetAddress;
    .end local p2    # "port":I
    :goto_0
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public getDefaultTargetPort()I
    .locals 1

    .line 227
    const/16 v0, 0x13c4

    return v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 154
    const-string/jumbo v0, "tcp"

    return-object v0
.end method

.method public isSecure()Z
    .locals 1

    .line 234
    const/4 v0, 0x0

    return v0
.end method

.method public run()V
    .locals 6

    .line 103
    nop

    :goto_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->isRunning:Z

    if-eqz v0, :cond_5

    .line 105
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 111
    :goto_1
    :try_start_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxConnections:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->nConnections:I

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxConnections:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-lt v0, v1, :cond_1

    .line 113
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 115
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->isRunning:Z
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v0, :cond_0

    .line 116
    :try_start_3
    monitor-exit p0

    return-void

    .line 119
    :cond_0
    goto :goto_1

    .line 117
    :catch_0
    move-exception v0

    .line 118
    .local v0, "ex":Ljava/lang/InterruptedException;
    nop

    .line 121
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :cond_1
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->nConnections:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->nConnections:I

    .line 122
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 124
    :try_start_4
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->sock:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0

    .line 125
    .local v0, "newsock":Ljava/net/Socket;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 126
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Accepting new connection!"

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 131
    :cond_2
    new-instance v1, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "TCPMessageChannelThread-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->nConnections:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v0, v3, p0, v4}, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;-><init>(Ljava/net/Socket;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;Ljava/lang/String;)V

    .line 132
    .local v1, "newChannel":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 133
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " adding incoming channel "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for processor "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getPort()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 134
    :cond_3
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->incomingMessageChannels:Ljava/util/Map;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/net/SocketException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 144
    nop

    .end local v0    # "newsock":Ljava/net/Socket;
    .end local v1    # "newChannel":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    goto/16 :goto_0

    .line 122
    :catchall_0
    move-exception v0

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v0
    :try_end_6
    .catch Ljava/net/SocketException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 142
    :catch_1
    move-exception v0

    .line 143
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .end local v0    # "ex":Ljava/lang/Exception;
    goto :goto_2

    .line 137
    :catch_2
    move-exception v0

    .line 139
    .local v0, "ex":Ljava/io/IOException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 140
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 141
    :cond_4
    goto/16 :goto_0

    .line 135
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_3
    move-exception v0

    .line 136
    .local v0, "ex":Ljava/net/SocketException;
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->isRunning:Z

    .line 144
    .end local v0    # "ex":Ljava/net/SocketException;
    :goto_2
    goto/16 :goto_0

    .line 146
    :cond_5
    return-void
.end method

.method public start()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 83
    .local v0, "thread":Ljava/lang/Thread;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageProcessorThread-TCP-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 84
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadPriority()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 85
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 86
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getNetworkLayer()Landroid/gov/nist/core/net/NetworkLayer;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getPort()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v5

    invoke-interface {v2, v3, v4, v5}, Landroid/gov/nist/core/net/NetworkLayer;->createServerSocket(IILjava/net/InetAddress;)Ljava/net/ServerSocket;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->sock:Ljava/net/ServerSocket;

    .line 87
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    const-string v3, "0.0.0.0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    const-string v3, "::0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 90
    :cond_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->sock:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-super {p0, v2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->setIpAddress(Ljava/net/InetAddress;)V

    .line 93
    :cond_1
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->isRunning:Z

    .line 94
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 96
    return-void
.end method

.method public declared-synchronized stop()V
    .locals 3

    monitor-enter p0

    .line 161
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->isRunning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    :try_start_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->sock:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 167
    goto :goto_0

    .line 165
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;
    :catch_0
    move-exception v0

    .line 166
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 169
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    .line 170
    .local v0, "en":Ljava/util/Collection;
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 171
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;

    .line 172
    .local v2, "next":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->close()V

    .line 173
    .end local v2    # "next":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    goto :goto_1

    .line 175
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;->incomingMessageChannels:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 176
    .local v1, "incomingMCIterator":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 177
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;

    .line 178
    .restart local v2    # "next":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;->close()V

    .line 179
    .end local v2    # "next":Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    goto :goto_2

    .line 181
    .end local v1    # "incomingMCIterator":Ljava/util/Iterator;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 182
    monitor-exit p0

    return-void

    .line 160
    .end local v0    # "en":Ljava/util/Collection;
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method
