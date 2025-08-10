.class public abstract Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;
.super Landroid/gov/nist/javax/sip/stack/MessageProcessor;
.source "ConnectionOrientedMessageProcessor.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected final incomingMessageChannels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;",
            ">;"
        }
    .end annotation
.end field

.field protected isRunning:Z

.field protected final messageChannels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;",
            ">;"
        }
    .end annotation
.end field

.field protected nConnections:I

.field protected sock:Ljava/net/ServerSocket;

.field protected useCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    const-class v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;ILjava/lang/String;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    .locals 1
    .param p1, "ipAddress"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "transport"    # Ljava/lang/String;
    .param p4, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 62
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;-><init>(Ljava/net/InetAddress;ILjava/lang/String;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 64
    iput-object p4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 66
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->messageChannels:Ljava/util/Map;

    .line 67
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->incomingMessageChannels:Ljava/util/Map;

    .line 68
    return-void
.end method


# virtual methods
.method protected declared-synchronized cacheMessageChannel(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V
    .locals 6
    .param p1, "messageChannel"    # Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    monitor-enter p0

    .line 96
    :try_start_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    .line 98
    .local v1, "currentChannel":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    const/16 v2, 0x20

    if-eqz v1, :cond_1

    .line 99
    sget-object v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 100
    sget-object v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Closing "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 101
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;
    :cond_0
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->close()V

    .line 103
    :cond_1
    sget-object v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 104
    sget-object v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Caching "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 105
    :cond_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    monitor-exit p0

    return-void

    .line 95
    .end local v0    # "key":Ljava/lang/String;
    .end local v1    # "currentChannel":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    .end local p1    # "messageChannel":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public closeReliableConnection(Ljava/lang/String;I)Z
    .locals 7
    .param p1, "peerAddress"    # Ljava/lang/String;
    .param p2, "peerPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 121
    invoke-virtual {p0, p2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->validatePortInRange(I)V

    .line 123
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    .line 124
    .local v0, "hostPort":Landroid/gov/nist/core/HostPort;
    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-direct {v1, p1}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 125
    invoke-virtual {v0, p2}, Landroid/gov/nist/core/HostPort;->setPort(I)V

    .line 127
    const-string/jumbo v1, "TCP"

    invoke-static {v0, v1}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Landroid/gov/nist/core/HostPort;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 129
    .local v1, "messageChannelKey":Ljava/lang/String;
    monitor-enter p0

    .line 130
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    .line 132
    .local v2, "foundMessageChannel":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    const/4 v3, 0x1

    const/16 v4, 0x20

    if-eqz v2, :cond_1

    .line 133
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->close()V

    .line 134
    sget-object v5, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 135
    sget-object v4, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " Removing channel "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for processor "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getPort()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 136
    :cond_0
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->incomingMessageChannels:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    monitor-exit p0

    return v3

    .line 141
    :cond_1
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->incomingMessageChannels:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    move-object v2, v5

    .line 143
    if-eqz v2, :cond_3

    .line 144
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->close()V

    .line 145
    sget-object v5, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 146
    sget-object v4, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " Removing incoming channel "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for processor "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getPort()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 147
    :cond_2
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->incomingMessageChannels:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    monitor-exit p0

    return v3

    .line 151
    .end local v2    # "foundMessageChannel":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    :cond_3
    monitor-exit p0

    .line 152
    const/4 v2, 0x0

    return v2

    .line 151
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getMaximumMessageSize()I
    .locals 1

    .line 112
    const v0, 0x7fffffff

    return v0
.end method

.method public getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    return-object v0
.end method

.method public inUse()Z
    .locals 1

    .line 116
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->useCount:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected declared-synchronized remove(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V
    .locals 5
    .param p1, "messageChannel"    # Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    monitor-enter p0

    .line 81
    :try_start_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "key":Ljava/lang/String;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 83
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " removing "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for processor "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getPort()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 87
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_1

    .line 88
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    :cond_1
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 91
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Removing incoming channel "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " for processor "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 92
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->incomingMessageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    monitor-exit p0

    return-void

    .line 80
    .end local v0    # "key":Ljava/lang/String;
    .end local p1    # "messageChannel":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public setKeepAliveTimeout(Ljava/lang/String;IJ)Z
    .locals 11
    .param p1, "peerAddress"    # Ljava/lang/String;
    .param p2, "peerPort"    # I
    .param p3, "keepAliveTimeout"    # J

    .line 157
    invoke-virtual {p0, p2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->validatePortInRange(I)V

    .line 159
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    .line 160
    .local v0, "hostPort":Landroid/gov/nist/core/HostPort;
    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-direct {v1, p1}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 161
    invoke-virtual {v0, p2}, Landroid/gov/nist/core/HostPort;->setPort(I)V

    .line 163
    const-string/jumbo v1, "TCP"

    invoke-static {v0, v1}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Landroid/gov/nist/core/HostPort;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 165
    .local v1, "messageChannelKey":Ljava/lang/String;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    .line 166
    .local v2, "foundMessageChannel":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    const-string v5, "/"

    const-string v6, ":"

    const-string v7, " for processor "

    const-string v8, " : "

    if-eqz v3, :cond_0

    .line 167
    sget-object v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " checking channel with key "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getPort()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 169
    :cond_0
    const/4 v3, 0x1

    if-eqz v2, :cond_1

    .line 170
    invoke-virtual {v2, p3, p4}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->setKeepAliveTimeout(J)V

    .line 171
    return v3

    .line 174
    :cond_1
    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->incomingMessageChannels:Ljava/util/Map;

    invoke-interface {v9, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    move-object v2, v9

    check-cast v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    .line 176
    sget-object v9, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 177
    sget-object v4, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " checking incoming channel with key "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getPort()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 179
    :cond_2
    if-eqz v2, :cond_3

    .line 180
    invoke-virtual {v2, p3, p4}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->setKeepAliveTimeout(J)V

    .line 181
    return v3

    .line 184
    :cond_3
    const/4 v3, 0x0

    return v3
.end method

.method protected validatePortInRange(I)V
    .locals 3
    .param p1, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 188
    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    const v0, 0xffff

    if-gt p1, v0, :cond_0

    .line 191
    return-void

    .line 189
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Peer port should be greater than 0 and less 65535, port = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
