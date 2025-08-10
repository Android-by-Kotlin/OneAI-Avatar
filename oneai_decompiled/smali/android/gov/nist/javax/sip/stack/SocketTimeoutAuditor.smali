.class public Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SocketTimeoutAuditor.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

.field nioSocketMaxIdleTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    const-class v0, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(JLandroid/gov/nist/javax/sip/stack/NIOHandler;)V
    .locals 0
    .param p1, "nioSocketMaxIdleTime"    # J
    .param p3, "nioHandler"    # Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 44
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 45
    iput-wide p1, p0, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->nioSocketMaxIdleTime:J

    .line 46
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 47
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 51
    const/4 v0, 0x0

    return-object v0
.end method

.method public runTask()V
    .locals 10

    .line 57
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "keys to check for inactivity removal "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 60
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 61
    .local v0, "entriesIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;>;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 62
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 63
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/channels/SocketChannel;

    .line 64
    .local v3, "socketChannel":Ljava/nio/channels/SocketChannel;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    .line 65
    .local v4, "messageChannel":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->getLastActivityTimestamp()J

    move-result-wide v7

    sub-long/2addr v5, v7

    iget-wide v7, p0, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->nioSocketMaxIdleTime:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    cmp-long v5, v5, v7

    const-string v6, " socketChannel = "

    if-lez v5, :cond_2

    .line 66
    :try_start_1
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 67
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Will remove socket "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " lastActivity="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->getLastActivityTimestamp()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " current= "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 72
    :cond_1
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->close()V

    .line 73
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    iget-object v5, v5, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-object v0, v5

    goto :goto_1

    .line 75
    :cond_2
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 76
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "don\'t remove socket "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " as lastActivity="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->getLastActivityTimestamp()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " and current= "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 82
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;>;"
    .end local v3    # "socketChannel":Ljava/nio/channels/SocketChannel;
    .end local v4    # "messageChannel":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    :cond_3
    :goto_1
    goto/16 :goto_0

    .line 85
    .end local v0    # "entriesIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;>;>;"
    :cond_4
    goto :goto_2

    .line 83
    :catch_0
    move-exception v0

    .line 86
    :goto_2
    return-void
.end method
