.class public Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;
.super Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;
.source "TLSMessageProcessor.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 72
    const-class v0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V
    .locals 1
    .param p1, "ipAddress"    # Ljava/net/InetAddress;
    .param p2, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p3, "port"    # I

    .line 82
    const-string/jumbo v0, "tls"

    invoke-direct {p0, p1, p3, v0, p2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;-><init>(Ljava/net/InetAddress;ILjava/lang/String;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 83
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

    .line 238
    :try_start_0
    const-string/jumbo v0, "TLS"

    invoke-static {p1, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Landroid/gov/nist/core/HostPort;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 239
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 240
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 242
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;
    :cond_0
    :try_start_1
    new-instance v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v1, v2, v3, v4, p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;)V

    .line 244
    .local v1, "retval":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->isCached:Z

    .line 246
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 247
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 248
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 250
    :cond_1
    monitor-exit p0

    return-object v1

    .line 237
    .end local v0    # "key":Ljava/lang/String;
    .end local v1    # "retval":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
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

    .line 257
    :try_start_0
    const-string/jumbo v0, "TLS"

    invoke-static {p1, p2, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 258
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 259
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 261
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;
    :cond_0
    :try_start_1
    new-instance v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v1, p1, p2, v2, p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;)V

    .line 262
    .local v1, "retval":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->isCached:Z

    .line 264
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 265
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 266
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 268
    :cond_1
    monitor-exit p0

    return-object v1

    .line 256
    .end local v0    # "key":Ljava/lang/String;
    .end local v1    # "retval":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    .end local p1    # "host":Ljava/net/InetAddress;
    .end local p2    # "port":I
    :catchall_0
    move-exception p1

    goto :goto_0

    .line 270
    .restart local p1    # "host":Ljava/net/InetAddress;
    .restart local p2    # "port":I
    :catch_0
    move-exception v0

    .line 271
    .local v0, "ex":Ljava/net/UnknownHostException;
    :try_start_2
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/net/UnknownHostException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 256
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

    .line 279
    const/16 v0, 0x13c5

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .line 286
    const/4 v0, 0x1

    return v0
.end method

.method public run()V
    .locals 6

    .line 134
    nop

    :goto_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->isRunning:Z

    if-eqz v0, :cond_7

    .line 135
    const/4 v0, 0x0

    .line 138
    .local v0, "newsock":Ljava/net/Socket;
    const/4 v1, 0x0

    const/16 v2, 0x20

    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 144
    :goto_1
    :try_start_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v3, v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxConnections:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->nConnections:I

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxConnections:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-lt v3, v4, :cond_1

    .line 147
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 149
    iget-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->isRunning:Z
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v3, :cond_0

    .line 150
    :try_start_3
    monitor-exit p0

    return-void

    .line 153
    :cond_0
    goto :goto_1

    .line 151
    :catch_0
    move-exception v3

    .line 152
    .local v3, "ex":Ljava/lang/InterruptedException;
    nop

    .line 155
    .end local v3    # "ex":Ljava/lang/InterruptedException;
    :cond_1
    iget v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->nConnections:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->nConnections:I

    .line 156
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 157
    :try_start_4
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 158
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, " waiting to accept new connection!"

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 161
    :cond_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    invoke-virtual {v3}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v3

    move-object v0, v3

    .line 163
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 164
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Accepting new connection!"

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/net/SocketException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljavax/net/ssl/SSLException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    .line 156
    :catchall_0
    move-exception v3

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .end local v0    # "newsock":Ljava/net/Socket;
    :try_start_6
    throw v3
    :try_end_6
    .catch Ljava/net/SocketException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljavax/net/ssl/SSLException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 183
    .restart local v0    # "newsock":Ljava/net/Socket;
    :catch_1
    move-exception v1

    .line 184
    .local v1, "ex":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "Unexpected Exception!"

    invoke-interface {v2, v3, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 185
    goto :goto_0

    .line 179
    .end local v1    # "ex":Ljava/lang/Exception;
    :catch_2
    move-exception v1

    .line 181
    .local v1, "ex":Ljava/io/IOException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "Problem Accepting Connection"

    invoke-interface {v2, v3, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 182
    goto :goto_0

    .line 174
    .end local v1    # "ex":Ljava/io/IOException;
    :catch_3
    move-exception v2

    .line 175
    .local v2, "ex":Ljavax/net/ssl/SSLException;
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->isRunning:Z

    .line 176
    sget-object v1, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Fatal - SSSLException occured while Accepting connection"

    invoke-interface {v1, v3, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 178
    goto/16 :goto_4

    .line 167
    .end local v2    # "ex":Ljavax/net/ssl/SSLException;
    :catch_4
    move-exception v3

    .line 168
    .local v3, "ex":Ljava/net/SocketException;
    iget-boolean v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->isRunning:Z

    if-eqz v4, :cond_3

    .line 169
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Fatal - SocketException occured while Accepting connection"

    invoke-interface {v2, v4, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 171
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->isRunning:Z

    .line 172
    goto :goto_4

    .line 186
    .end local v3    # "ex":Ljava/net/SocketException;
    :cond_3
    :goto_2
    nop

    .line 190
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->isRunning:Z

    if-eqz v1, :cond_6

    .line 194
    :try_start_7
    new-instance v1, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "TLSMessageChannelThread-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->nConnections:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v0, v3, p0, v4}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;-><init>(Ljava/net/Socket;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;Ljava/lang/String;)V

    .line 195
    .local v1, "newChannel":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 196
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " adding incoming channel "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 198
    :cond_4
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->isHandshakeCompleted()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 199
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->incomingMessageChannels:Ljava/util/Map;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    .line 203
    .end local v1    # "newChannel":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    :cond_5
    goto :goto_3

    .line 201
    :catch_5
    move-exception v1

    .line 202
    .local v1, "ex":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "A problem occured while Accepting connection"

    invoke-interface {v2, v3, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 205
    .end local v0    # "newsock":Ljava/net/Socket;
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_6
    :goto_3
    goto/16 :goto_0

    .line 206
    :cond_7
    :goto_4
    return-void
.end method

.method public start()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 89
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 90
    .local v0, "thread":Ljava/lang/Thread;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageProcessorThread-TLS-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 92
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadPriority()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 93
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 95
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getNetworkLayer()Landroid/gov/nist/core/net/NetworkLayer;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->getPort()I

    move-result v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v2, v3, v5, v4}, Landroid/gov/nist/core/net/NetworkLayer;->createSSLServerSocket(IILjava/net/InetAddress;)Ljavax/net/ssl/SSLServerSocket;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    .line 97
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v2

    sget-object v3, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Want:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    if-eq v2, v3, :cond_1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v2

    sget-object v3, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Default:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    if-ne v2, v3, :cond_0

    goto :goto_0

    .line 101
    :cond_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    check-cast v2, Ljavax/net/ssl/SSLServerSocket;

    invoke-virtual {v2, v5}, Ljavax/net/ssl/SSLServerSocket;->setWantClientAuth(Z)V

    goto :goto_1

    .line 99
    :cond_1
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    check-cast v2, Ljavax/net/ssl/SSLServerSocket;

    invoke-virtual {v2, v1}, Ljavax/net/ssl/SSLServerSocket;->setWantClientAuth(Z)V

    .line 103
    :goto_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v2

    sget-object v3, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Enabled:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    if-ne v2, v3, :cond_2

    .line 104
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    check-cast v2, Ljavax/net/ssl/SSLServerSocket;

    invoke-virtual {v2, v1}, Ljavax/net/ssl/SSLServerSocket;->setNeedClientAuth(Z)V

    goto :goto_2

    .line 106
    :cond_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    check-cast v2, Ljavax/net/ssl/SSLServerSocket;

    invoke-virtual {v2, v5}, Ljavax/net/ssl/SSLServerSocket;->setNeedClientAuth(Z)V

    .line 108
    :goto_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    check-cast v2, Ljavax/net/ssl/SSLServerSocket;

    invoke-virtual {v2, v5}, Ljavax/net/ssl/SSLServerSocket;->setUseClientMode(Z)V

    .line 109
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v2, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v2

    .line 110
    .local v2, "enabledCiphers":[Ljava/lang/String;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    check-cast v3, Ljavax/net/ssl/SSLServerSocket;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v4, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljavax/net/ssl/SSLServerSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 111
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    check-cast v3, Ljavax/net/ssl/SSLServerSocket;

    invoke-virtual {v3, v2}, Ljavax/net/ssl/SSLServerSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 112
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v3

    sget-object v4, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Want:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    if-eq v3, v4, :cond_4

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v3

    sget-object v4, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Default:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    if-ne v3, v4, :cond_3

    goto :goto_3

    .line 116
    :cond_3
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    check-cast v3, Ljavax/net/ssl/SSLServerSocket;

    invoke-virtual {v3, v5}, Ljavax/net/ssl/SSLServerSocket;->setWantClientAuth(Z)V

    goto :goto_4

    .line 114
    :cond_4
    :goto_3
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    check-cast v3, Ljavax/net/ssl/SSLServerSocket;

    invoke-virtual {v3, v1}, Ljavax/net/ssl/SSLServerSocket;->setWantClientAuth(Z)V

    .line 119
    :goto_4
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 120
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SSLServerSocket want client auth "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    check-cast v5, Ljavax/net/ssl/SSLServerSocket;

    invoke-virtual {v5}, Ljavax/net/ssl/SSLServerSocket;->getWantClientAuth()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 121
    sget-object v3, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SSLServerSocket need client auth "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    check-cast v5, Ljavax/net/ssl/SSLServerSocket;

    invoke-virtual {v5}, Ljavax/net/ssl/SSLServerSocket;->getNeedClientAuth()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 124
    :cond_5
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->isRunning:Z

    .line 125
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 127
    return-void
.end method

.method public declared-synchronized stop()V
    .locals 3

    monitor-enter p0

    .line 212
    :try_start_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->isRunning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 213
    monitor-exit p0

    return-void

    .line 215
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->isRunning:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 217
    :try_start_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->sock:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 220
    goto :goto_0

    .line 218
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;
    :catch_0
    move-exception v0

    .line 219
    .local v0, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 222
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    .line 223
    .local v0, "en":Ljava/util/Collection;
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 224
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    .line 225
    .local v2, "next":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->close()V

    .line 226
    .end local v2    # "next":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    goto :goto_1

    .line 227
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;->incomingMessageChannels:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 228
    .local v1, "incomingMCIterator":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 229
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    .line 230
    .restart local v2    # "next":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->close()V

    .line 231
    .end local v2    # "next":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    goto :goto_2

    .line 232
    .end local v1    # "incomingMCIterator":Ljava/util/Iterator;
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 234
    monitor-exit p0

    return-void

    .line 211
    .end local v0    # "en":Ljava/util/Collection;
    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0
.end method
