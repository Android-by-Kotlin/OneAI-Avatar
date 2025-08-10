.class public Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;
.super Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;
.source "NioTlsWebSocketMessageProcessor.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field sslClientCtx:Ljavax/net/ssl/SSLContext;

.field sslServerCtx:Ljavax/net/ssl/SSLContext;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 43
    const-class v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V
    .locals 2
    .param p1, "ipAddress"    # Ljava/net/InetAddress;
    .param p2, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p3, "port"    # I

    .line 50
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 51
    const-string/jumbo v0, "WSS"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->transport:Ljava/lang/String;

    .line 53
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->init()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    nop

    .line 57
    return-void

    .line 54
    :catch_0
    move-exception v0

    .line 55
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public createMessageChannel(Landroid/gov/nist/core/HostPort;)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 7
    .param p1, "targetHostPort"    # Landroid/gov/nist/core/HostPort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "NioTlsWebSocketMessageProcessor::createMessageChannel: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 78
    :cond_0
    const/4 v0, 0x0

    .line 80
    .local v0, "retval":Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->transport:Ljava/lang/String;

    invoke-static {p1, v2}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Landroid/gov/nist/core/HostPort;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 82
    .local v2, "key":Ljava/lang/String;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 83
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object v0, v3

    .line 84
    nop

    .line 103
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 104
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "MessageChannel::createMessageChannel - exit "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 86
    :cond_2
    :try_start_1
    new-instance v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v3, v4, v5, v6, p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V

    move-object v0, v3

    .line 90
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->messageChannels:Ljava/util/Map;

    monitor-enter v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 91
    :try_start_2
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v4, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 93
    const/4 v3, 0x1

    :try_start_3
    iput-boolean v3, v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->isCached:Z

    .line 94
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 95
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "key "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 96
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Creating "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 98
    :cond_3
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v3}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 99
    nop

    .line 103
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 104
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "MessageChannel::createMessageChannel - exit "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_4
    return-object v0

    .line 92
    :catchall_0
    move-exception v4

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .end local v0    # "retval":Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    .end local p1    # "targetHostPort":Landroid/gov/nist/core/HostPort;
    :try_start_5
    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 103
    .end local v2    # "key":Ljava/lang/String;
    .restart local v0    # "retval":Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    .restart local p1    # "targetHostPort":Landroid/gov/nist/core/HostPort;
    :catchall_1
    move-exception v2

    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 104
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "MessageChannel::createMessageChannel - exit "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_5
    throw v2
.end method

.method public createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 5
    .param p1, "targetHost"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 111
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->transport:Ljava/lang/String;

    invoke-static {p1, p2, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 112
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 113
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/MessageChannel;

    return-object v1

    .line 115
    :cond_0
    new-instance v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v1, p1, p2, v2, p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V

    .line 117
    .local v1, "retval":Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 119
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->isCached:Z

    .line 121
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 122
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 123
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 125
    :cond_1
    return-object v1
.end method

.method public createMessageChannel(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    .locals 3
    .param p1, "nioTcpMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    .param p2, "client"    # Ljava/nio/channels/SocketChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "NioTlsWebSocketMessageProcessor::createMessageChannel: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " client "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 64
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->getMessageChannel(Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    .line 65
    .local v0, "retval":Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    if-nez v0, :cond_1

    .line 66
    new-instance v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v1, v2, p1, p2}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)V

    move-object v0, v1

    .line 68
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v1, p2, v0}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putMessageChannel(Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;)V

    .line 70
    :cond_1
    return-object v0
.end method

.method public init()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;,
            Ljava/security/cert/CertificateException;,
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getKeyManagers(Z)[Ljavax/net/ssl/KeyManager;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getTrustManagers(Z)[Ljavax/net/ssl/TrustManager;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getTrustManagers(Z)[Ljavax/net/ssl/TrustManager;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 139
    :cond_0
    const-string/jumbo v0, "TLS"

    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sslServerCtx:Ljavax/net/ssl/SSLContext;

    .line 140
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sslServerCtx:Ljavax/net/ssl/SSLContext;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v4, v1}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getKeyManagers(Z)[Ljavax/net/ssl/KeyManager;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v5, v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v5, v1}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getTrustManagers(Z)[Ljavax/net/ssl/TrustManager;

    move-result-object v1

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v1, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 144
    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sslClientCtx:Ljavax/net/ssl/SSLContext;

    .line 145
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sslClientCtx:Ljavax/net/ssl/SSLContext;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getKeyManagers(Z)[Ljavax/net/ssl/KeyManager;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getTrustManagers(Z)[Ljavax/net/ssl/TrustManager;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 149
    return-void

    .line 133
    :cond_1
    :goto_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 134
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "TLS initialization failed due to NULL security config"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 136
    :cond_2
    return-void
.end method
