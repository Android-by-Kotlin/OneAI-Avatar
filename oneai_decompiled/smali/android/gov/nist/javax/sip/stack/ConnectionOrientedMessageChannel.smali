.class public abstract Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
.super Landroid/gov/nist/javax/sip/stack/MessageChannel;
.source "ConnectionOrientedMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/SIPMessageListener;
.implements Ljava/lang/Runnable;
.implements Landroid/gov/nist/javax/sip/stack/RawMessageChannel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;
    }
.end annotation


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected isCached:Z

.field protected isRunning:Z

.field private keepAliveSemaphore:Ljava/util/concurrent/Semaphore;

.field private keepAliveTimeout:J

.field protected key:Ljava/lang/String;

.field private volatile lastKeepAliveReceivedTime:J

.field protected myAddress:Ljava/lang/String;

.field protected myClientInputStream:Ljava/io/InputStream;

.field protected myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

.field protected myPort:I

.field protected mySock:Ljava/net/Socket;

.field protected mythread:Ljava/lang/Thread;

.field protected peerAddress:Ljava/net/InetAddress;

.field protected peerAddressAdvertisedInHeaders:Ljava/lang/String;

.field protected peerPort:I

.field protected peerPortAdvertisedInHeaders:I

.field protected peerProtocol:Ljava/lang/String;

.field private pingKeepAliveTimeoutTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

.field protected sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 69
    const-class v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    .locals 5
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 108
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;-><init>()V

    .line 81
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->isRunning:Z

    .line 94
    const/4 v1, -0x1

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPortAdvertisedInHeaders:I

    .line 109
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 110
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getReliableConnectionKeepAliveTimeout()I

    move-result v1

    int-to-long v1, v1

    iput-wide v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    .line 111
    iget-wide v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    .line 112
    new-instance v1, Ljava/util/concurrent/Semaphore;

    invoke-direct {v1, v0}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveSemaphore:Ljava/util/concurrent/Semaphore;

    .line 114
    :cond_0
    return-void
.end method

.method static synthetic access$000()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 66
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method


# virtual methods
.method public cancelPingKeepAliveTimeoutTaskIfStarted()V
    .locals 4

    .line 742
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->pingKeepAliveTimeoutTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->pingKeepAliveTimeoutTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->getSipTimerTask()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 744
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 748
    nop

    .line 750
    :try_start_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 751
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "~~~ cancelPingKeepAliveTimeoutTaskIfStarted for MessageChannel(key="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), clientAddress="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", clientPort="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", timeout="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 754
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->pingKeepAliveTimeoutTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 756
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 757
    goto :goto_0

    .line 756
    :catchall_0
    move-exception v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    throw v0

    .line 745
    :catch_0
    move-exception v0

    .line 746
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Couldn\'t acquire keepAliveSemaphore"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 747
    return-void

    .line 759
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_1
    :goto_0
    return-void
.end method

.method public close()V
    .locals 1

    .line 127
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->close(ZZ)V

    .line 128
    return-void
.end method

.method protected abstract close(ZZ)V
.end method

.method public getKeepAliveTimeout()J
    .locals 2

    .line 786
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    return-wide v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 3

    .line 677
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 678
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    return-object v0

    .line 680
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    .line 682
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getPeerAddress()Ljava/lang/String;
    .locals 1

    .line 148
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 151
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPeerInetAddress()Ljava/net/InetAddress;
    .locals 1

    .line 155
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getPeerPacketSourceAddress()Ljava/net/InetAddress;
    .locals 1

    .line 718
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getPeerPacketSourcePort()I
    .locals 1

    .line 714
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    return v0
.end method

.method public getPeerPort()I
    .locals 1

    .line 710
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    return v0
.end method

.method public getPeerProtocol()Ljava/lang/String;
    .locals 1

    .line 159
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerProtocol:Ljava/lang/String;

    return-object v0
.end method

.method public getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1

    .line 138
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    return-object v0
.end method

.method public getViaHost()Ljava/lang/String;
    .locals 1

    .line 692
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getViaPort()I
    .locals 1

    .line 701
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myPort:I

    return v0
.end method

.method public isReliable()Z
    .locals 1

    .line 120
    const/4 v0, 0x1

    return v0
.end method

.method public processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 18
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 285
    move-object/from16 v1, p0

    move-object/from16 v9, p1

    const-string/jumbo v0, "rport"

    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v2

    if-eqz v2, :cond_26

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v2

    if-eqz v2, :cond_26

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v2

    if-eqz v2, :cond_26

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v2

    if-eqz v2, :cond_26

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getViaHeaders()Landroid/gov/nist/javax/sip/header/ViaList;

    move-result-object v2

    if-nez v2, :cond_0

    goto/16 :goto_b

    .line 298
    :cond_0
    iget-object v2, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v9, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemoteAddress(Ljava/net/InetAddress;)V

    .line 299
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getPeerPort()I

    move-result v2

    invoke-virtual {v9, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemotePort(I)V

    .line 300
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalAddress(Ljava/net/InetAddress;)V

    .line 301
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getPort()I

    move-result v2

    invoke-virtual {v9, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalPort(I)V

    .line 303
    iget-object v2, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v9, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setPeerPacketSourceAddress(Ljava/net/InetAddress;)V

    .line 304
    iget v2, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    invoke-virtual {v9, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setPeerPacketSourcePort(I)V

    .line 306
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getViaHeaders()Landroid/gov/nist/javax/sip/header/ViaList;

    move-result-object v2

    move-object v10, v2

    .line 311
    .local v10, "viaList":Landroid/gov/nist/javax/sip/header/ViaList;
    instance-of v2, v9, Landroid/gov/nist/javax/sip/message/SIPRequest;

    const/16 v3, 0x20

    if-eqz v2, :cond_d

    .line 312
    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/header/ViaList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/Via;

    .line 314
    .local v2, "v":Landroid/gov/nist/javax/sip/header/Via;
    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addressResolver:Landroid/gov/nist/core/net/AddressResolver;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Via;->getHop()Landroid/javax/sip/address/Hop;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/net/AddressResolver;->resolveAddress(Landroid/javax/sip/address/Hop;)Landroid/javax/sip/address/Hop;

    move-result-object v4

    .line 315
    .local v4, "hop":Landroid/javax/sip/address/Hop;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerProtocol:Ljava/lang/String;

    .line 317
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v5

    .line 318
    .local v5, "hopPort":I
    sget-object v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const-string v7, " key "

    const-string v8, " for this channel "

    if-eqz v6, :cond_1

    .line 319
    :try_start_1
    sget-object v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "hop port = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " for request "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v6, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 321
    :cond_1
    if-gtz v5, :cond_2

    .line 323
    const/16 v6, 0x13c4

    iput v6, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPortAdvertisedInHeaders:I

    goto :goto_0

    .line 325
    :cond_2
    iput v5, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPortAdvertisedInHeaders:I

    .line 327
    :goto_0
    sget-object v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 328
    sget-object v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "3.Storing peerPortAdvertisedInHeaders = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v6, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 332
    :cond_3
    iget-object v6, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddressAdvertisedInHeaders:Ljava/lang/String;

    if-nez v6, :cond_4

    .line 333
    invoke-interface {v4}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddressAdvertisedInHeaders:Ljava/lang/String;

    .line 334
    sget-object v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 335
    sget-object v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "3.Storing peerAddressAdvertisedInHeaders = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddressAdvertisedInHeaders:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 339
    :cond_4
    iget-object v6, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isPatchReceivedRport()Z

    move-result v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-nez v6, :cond_a

    .line 342
    :try_start_2
    iget-object v6, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->mySock:Ljava/net/Socket;

    if-eqz v6, :cond_5

    .line 344
    iget-object v6, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v6}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v6

    iput-object v6, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 356
    :cond_5
    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/header/Via;->hasParameter(Ljava/lang/String;)Z

    move-result v6

    .line 357
    .local v6, "hasRPort":Z
    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isPatchRport()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 358
    if-nez v6, :cond_7

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v7

    iget v8, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    if-eq v7, v8, :cond_7

    .line 360
    sget-object v7, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 361
    sget-object v7, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "setting rport since viaPort "

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v11, " different than peerPacketSourcePort "

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v11, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v11, " so that the response can be routed back"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 365
    :cond_6
    const/4 v6, 0x1

    .line 367
    :cond_7
    if-nez v6, :cond_8

    invoke-interface {v4}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v7

    iget-object v8, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v8}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_9

    .line 370
    :cond_8
    const-string/jumbo v7, "received"

    iget-object v8, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v8}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Landroid/gov/nist/javax/sip/header/Via;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    :cond_9
    iget v7, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v0, v7}, Landroid/gov/nist/javax/sip/header/Via;->setParameter(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .end local v6    # "hasRPort":Z
    goto :goto_1

    .line 378
    :catch_0
    move-exception v0

    .line 379
    .local v0, "ex":Ljava/text/ParseException;
    :try_start_3
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 380
    .end local v0    # "ex":Ljava/text/ParseException;
    :goto_1
    goto :goto_2

    .line 384
    :cond_a
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 385
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v6, "We did not use recived and rport"

    invoke-interface {v0, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 388
    :cond_b
    :goto_2
    iget-boolean v0, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->isCached:Z

    if-nez v0, :cond_d

    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->mySock:Ljava/net/Socket;

    if-eqz v0, :cond_d

    .line 391
    const/4 v0, 0x1

    iput-boolean v0, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->isCached:Z

    .line 392
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v0

    check-cast v0, Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v0

    .line 394
    .local v0, "remotePort":I
    iget-object v6, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v6}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v6

    invoke-static {v6, v0}, Landroid/gov/nist/javax/sip/stack/IOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v6

    .line 396
    .local v6, "key":Ljava/lang/String;
    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    instance-of v7, v7, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    if-eqz v7, :cond_c

    .line 398
    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v7, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v7, v7, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    iget-object v8, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v8}, Ljava/net/Socket;->getChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v8

    invoke-virtual {v7, v6, v8}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putSocket(Ljava/lang/String;Ljava/nio/channels/SocketChannel;)V

    goto :goto_3

    .line 400
    :cond_c
    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v7, v7, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    iget-object v8, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v7, v6, v8}, Landroid/gov/nist/javax/sip/stack/IOHandler;->putSocket(Ljava/lang/String;Ljava/net/Socket;)V

    .line 404
    :goto_3
    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v7, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    invoke-virtual {v7, v1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->cacheMessageChannel(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V

    .line 410
    .end local v0    # "remotePort":I
    .end local v2    # "v":Landroid/gov/nist/javax/sip/header/Via;
    .end local v4    # "hop":Landroid/javax/sip/address/Hop;
    .end local v5    # "hopPort":I
    .end local v6    # "key":Ljava/lang/String;
    :cond_d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 413
    .local v7, "receptionTime":J
    instance-of v0, v9, Landroid/gov/nist/javax/sip/message/SIPRequest;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const-string v11, "Message size exceeded"

    const/4 v12, 0x0

    if-eqz v0, :cond_1a

    .line 415
    :try_start_4
    move-object v0, v9

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-object v13, v0

    .line 419
    .local v13, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 420
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "----Processing Message---"

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 423
    :cond_e
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x10

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 426
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverLogger:Landroid/gov/nist/core/ServerLogger;

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getPeerHostPort()Landroid/gov/nist/core/HostPort;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ":"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v3, p1

    invoke-interface/range {v2 .. v8}, Landroid/gov/nist/core/ServerLogger;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;ZJ)V

    .line 436
    :cond_f
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxMessageSize()I

    move-result v0

    if-lez v0, :cond_12

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getSize()I

    move-result v0

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getContentLength()Landroid/javax/sip/header/ContentLengthHeader;

    move-result-object v2

    if-nez v2, :cond_10

    move v2, v12

    goto :goto_4

    :cond_10
    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getContentLength()Landroid/javax/sip/header/ContentLengthHeader;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/header/ContentLengthHeader;->getContentLength()I

    move-result v2

    :goto_4
    add-int/2addr v0, v2

    iget-object v2, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxMessageSize()I

    move-result v2

    if-gt v0, v2, :cond_11

    goto :goto_5

    .line 442
    :cond_11
    const/16 v0, 0x201

    invoke-virtual {v13, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 444
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 446
    .local v2, "resp":[B
    invoke-virtual {v1, v2, v12}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sendMessage([BZ)V

    .line 447
    new-instance v3, Ljava/lang/Exception;

    invoke-direct {v3, v11}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    throw v3

    .line 450
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v2    # "resp":[B
    .restart local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :cond_12
    :goto_5
    move-object v0, v9

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestLine()Landroid/gov/nist/javax/sip/header/RequestLine;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RequestLine;->getSipVersion()Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    .line 452
    .local v2, "sipVersion":Ljava/lang/String;
    const-string/jumbo v0, "SIP/2.0"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 461
    move-object v0, v9

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    move-object v3, v0

    .line 462
    .local v3, "method":Ljava/lang/String;
    move-object v0, v9

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeqHeader()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v0

    move-object v4, v0

    .line 465
    .local v4, "cseqMethod":Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 476
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v13, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->newSIPServerRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    move-result-object v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-object v5, v0

    .line 479
    .local v5, "sipServerRequest":Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    if-eqz v5, :cond_16

    .line 481
    :try_start_5
    invoke-interface {v5, v13, v1}, Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;->processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 483
    :try_start_6
    instance-of v0, v5, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_14

    .line 484
    move-object v0, v5

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 485
    .local v0, "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    move-result v6

    if-nez v6, :cond_13

    .line 486
    move-object v6, v5

    check-cast v6, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    .line 488
    .end local v0    # "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_13
    nop

    :cond_14
    goto :goto_7

    .line 483
    :catchall_0
    move-exception v0

    move-object v6, v0

    instance-of v0, v5, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_15

    .line 484
    move-object v0, v5

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 485
    .restart local v0    # "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    move-result v11

    if-nez v11, :cond_15

    .line 486
    move-object v11, v5

    check-cast v11, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v11}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    .line 488
    .end local v0    # "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_15
    nop

    .end local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    throw v6

    .line 491
    .restart local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :cond_16
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageValves:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_17

    .line 492
    const/16 v0, 0x1f7

    invoke-virtual {v13, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    move-object v6, v0

    .line 495
    .local v6, "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    new-instance v0, Landroid/gov/nist/javax/sip/header/RetryAfter;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RetryAfter;-><init>()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    move-object v11, v0

    .line 499
    .local v11, "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    :try_start_7
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v14

    const-wide/high16 v16, 0x4024000000000000L    # 10.0

    mul-double v14, v14, v16

    double-to-int v0, v14

    invoke-virtual {v11, v0}, Landroid/gov/nist/javax/sip/header/RetryAfter;->setRetryAfter(I)V

    .line 500
    invoke-virtual {v6, v11}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 501
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 504
    goto :goto_6

    .line 502
    :catch_1
    move-exception v0

    .line 505
    :goto_6
    :try_start_8
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 506
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v12, "Dropping message -- could not acquire semaphore"

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 511
    .end local v2    # "sipVersion":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/String;
    .end local v4    # "cseqMethod":Ljava/lang/String;
    .end local v5    # "sipServerRequest":Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    .end local v6    # "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v11    # "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    .end local v13    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_17
    :goto_7
    goto/16 :goto_a

    .line 466
    .restart local v2    # "sipVersion":Ljava/lang/String;
    .restart local v3    # "method":Ljava/lang/String;
    .restart local v4    # "cseqMethod":Ljava/lang/String;
    .restart local v13    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_18
    const/16 v0, 0x190

    invoke-virtual {v13, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 468
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/message/SIPResponse;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v5

    .line 470
    .local v5, "resp":[B
    invoke-virtual {v1, v5, v12}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sendMessage([BZ)V

    .line 471
    new-instance v6, Ljava/lang/Exception;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Bad CSeq method"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " method "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v6, v11}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    throw v6

    .line 453
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v3    # "method":Ljava/lang/String;
    .end local v4    # "cseqMethod":Ljava/lang/String;
    .end local v5    # "resp":[B
    .restart local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :cond_19
    move-object v0, v9

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad SIP version "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x1f9

    invoke-virtual {v0, v4, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(ILjava/lang/String;)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 456
    .local v0, "versionNotSupported":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v1, v3, v12}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sendMessage([BZ)V

    .line 458
    new-instance v3, Ljava/lang/Exception;

    const-string v4, "Bad version "

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    throw v3

    .line 512
    .end local v0    # "versionNotSupported":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v2    # "sipVersion":Ljava/lang/String;
    .end local v13    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :cond_1a
    move-object v0, v9

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    move-object v2, v0

    .line 517
    .local v2, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :try_start_9
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->checkHeaders()V
    :try_end_9
    .catch Ljava/text/ParseException; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 524
    nop

    .line 528
    :try_start_a
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxMessageSize()I

    move-result v0

    if-lez v0, :cond_1d

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getSize()I

    move-result v0

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContentLength()Landroid/javax/sip/header/ContentLengthHeader;

    move-result-object v4

    if-nez v4, :cond_1b

    :goto_8
    goto :goto_9

    :cond_1b
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContentLength()Landroid/javax/sip/header/ContentLengthHeader;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/header/ContentLengthHeader;->getContentLength()I

    move-result v12

    goto :goto_8

    :goto_9
    add-int/2addr v0, v12

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxMessageSize()I

    move-result v4

    if-le v0, v4, :cond_1d

    .line 534
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 535
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 537
    :cond_1c
    return-void

    .line 541
    :cond_1d
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v2, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->newSIPServerResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    move-result-object v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    move-object v4, v0

    .line 543
    .local v4, "sipServerResponse":Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    if-eqz v4, :cond_23

    .line 545
    :try_start_b
    instance-of v0, v4, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    if-eqz v0, :cond_20

    move-object v0, v4

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v0, v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->checkFromTag(Landroid/gov/nist/javax/sip/message/SIPResponse;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 548
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 549
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Dropping response message with invalid tag >>> "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 557
    :cond_1e
    :try_start_c
    instance-of v0, v4, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_1f

    move-object v0, v4

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->passToListener()Z

    move-result v0

    if-nez v0, :cond_1f

    .line 563
    move-object v0, v4

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    :cond_1f
    return-void

    .line 555
    :cond_20
    :try_start_d
    invoke-interface {v4, v2, v1}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 557
    :try_start_e
    instance-of v0, v4, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_21

    move-object v0, v4

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->passToListener()Z

    move-result v0

    if-nez v0, :cond_21

    .line 563
    move-object v0, v4

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    :cond_21
    goto :goto_a

    .line 557
    :catchall_1
    move-exception v0

    instance-of v3, v4, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v3, :cond_22

    move-object v3, v4

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->passToListener()Z

    move-result v3

    if-nez v3, :cond_22

    .line 563
    move-object v3, v4

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    :cond_22
    nop

    .end local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    throw v0

    .line 567
    .restart local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :cond_23
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 568
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "null sipServerResponse as could not acquire semaphore or the valve dropped the message."

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 572
    .end local v2    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v4    # "sipServerResponse":Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    .end local v7    # "receptionTime":J
    .end local v10    # "viaList":Landroid/gov/nist/javax/sip/header/ViaList;
    :cond_24
    :goto_a
    nop

    .line 573
    return-void

    .line 518
    .restart local v2    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v7    # "receptionTime":J
    .restart local v10    # "viaList":Landroid/gov/nist/javax/sip/header/ViaList;
    :catch_2
    move-exception v0

    move-object v3, v0

    move-object v0, v3

    .line 519
    .local v0, "ex":Ljava/text/ParseException;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v3

    if-eqz v3, :cond_25

    .line 520
    sget-object v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Dropping Badly formatted response message >>> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 523
    :cond_25
    return-void

    .line 290
    .end local v0    # "ex":Ljava/text/ParseException;
    .end local v2    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v7    # "receptionTime":J
    .end local v10    # "viaList":Landroid/gov/nist/javax/sip/header/ViaList;
    :cond_26
    :goto_b
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 291
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encode()Ljava/lang/String;

    move-result-object v0

    .line 292
    .local v0, "badmsg":Ljava/lang/String;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "bad message "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 293
    sget-object v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, ">>> Dropped Bad Msg"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 295
    .end local v0    # "badmsg":Ljava/lang/String;
    :cond_27
    return-void

    .line 571
    :catchall_2
    move-exception v0

    throw v0
.end method

.method public processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;)V
    .locals 3
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p2, "address"    # Ljava/net/InetAddress;

    .line 260
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 262
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    goto :goto_0

    .line 263
    :catch_0
    move-exception v0

    .line 264
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 266
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "ERROR processing self routing"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 270
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public rescheduleKeepAliveTimeout(J)V
    .locals 12
    .param p1, "newKeepAliveTimeout"    # J

    .line 795
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 797
    .local v0, "methodLog":Ljava/lang/StringBuilder;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    const-string v3, ", timeout="

    const-string v4, ", clientPort="

    const-string v5, "), clientAddress="

    if-eqz v1, :cond_1

    .line 798
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "~~~ rescheduleKeepAliveTimeout for MessageChannel(key="

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v6, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v6, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, "): newKeepAliveTimeout="

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 800
    const-wide v6, 0x7fffffffffffffffL

    cmp-long v1, p1, v6

    if-nez v1, :cond_0

    .line 801
    const-string v1, "Long.MAX_VALUE"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 803
    :cond_0
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 813
    :cond_1
    :goto_0
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 817
    nop

    .line 819
    :try_start_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->pingKeepAliveTimeoutTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v6, " seconds"

    const-wide/16 v7, 0x3e8

    const-string v9, ", scheduling pingKeepAliveTimeoutTask to execute after "

    if-nez v1, :cond_3

    .line 820
    :try_start_2
    new-instance v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;

    invoke-direct {v1, p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->pingKeepAliveTimeoutTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 821
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 822
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 823
    iget-wide v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    div-long/2addr v1, v7

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 824
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 825
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 827
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->pingKeepAliveTimeoutTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    iget-wide v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    invoke-interface {v1, v2, v3, v4}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    goto/16 :goto_1

    .line 829
    :cond_3
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 830
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "~~~ cancelPingKeepAliveTimeout for MessageChannel(key="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v10, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 833
    :cond_4
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->pingKeepAliveTimeoutTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    invoke-interface {v1, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 834
    new-instance v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;

    invoke-direct {v1, p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->pingKeepAliveTimeoutTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 835
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 836
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 837
    iget-wide v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    div-long/2addr v1, v7

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 838
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 839
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 841
    :cond_5
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->pingKeepAliveTimeoutTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    iget-wide v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    invoke-interface {v1, v2, v3, v4}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 844
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 845
    nop

    .line 846
    return-void

    .line 844
    :catchall_0
    move-exception v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    throw v1

    .line 814
    :catch_0
    move-exception v1

    .line 815
    .local v1, "e":Ljava/lang/InterruptedException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Couldn\'t acquire keepAliveSemaphore"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 816
    return-void
.end method

.method public run()V
    .locals 9

    .line 584
    const/4 v0, 0x0

    .line 586
    .local v0, "hispipe":Landroid/gov/nist/javax/sip/parser/Pipeline;
    new-instance v1, Landroid/gov/nist/javax/sip/parser/Pipeline;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v3, v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->readTimeout:I

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Landroid/gov/nist/javax/sip/parser/Pipeline;-><init>(Ljava/io/InputStream;ILandroid/gov/nist/javax/sip/stack/timers/SipTimer;)V

    move-object v0, v1

    .line 590
    new-instance v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxMessageSize()I

    move-result v3

    invoke-direct {v1, v2, p0, v0, v3}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/parser/SIPMessageListener;Landroid/gov/nist/javax/sip/parser/Pipeline;I)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    .line 593
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->processInput()V

    .line 595
    const/16 v1, 0x1000

    .line 596
    .local v1, "bufferSize":I
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    iget v3, v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->useCount:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iput v3, v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->useCount:I

    .line 597
    iput-boolean v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->isRunning:Z

    .line 601
    :goto_0
    const/4 v2, -0x1

    const/4 v3, 0x0

    :try_start_0
    new-array v5, v1, [B

    .line 602
    .local v5, "msg":[B
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    invoke-virtual {v6, v5, v3, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    .line 604
    .local v6, "nbytes":I
    if-ne v6, v2, :cond_2

    .line 605
    const-string v7, "\r\n\r\n"

    const-string/jumbo v8, "UTF-8"

    invoke-virtual {v7, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/gov/nist/javax/sip/parser/Pipeline;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 607
    :try_start_1
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v7, v7, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxConnections:I

    if-eq v7, v2, :cond_0

    .line 608
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    monitor-enter v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 609
    :try_start_2
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v7, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    iget v8, v7, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->nConnections:I

    sub-int/2addr v8, v4

    iput v8, v7, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->nConnections:I

    .line 610
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v7}, Ljava/lang/Object;->notify()V

    .line 611
    monitor-exit v2

    goto :goto_1

    :catchall_0
    move-exception v7

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .end local v0    # "hispipe":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .end local v1    # "bufferSize":I
    .end local v5    # "msg":[B
    .end local v6    # "nbytes":I
    :try_start_3
    throw v7

    .line 613
    .restart local v0    # "hispipe":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .restart local v1    # "bufferSize":I
    .restart local v5    # "msg":[B
    .restart local v6    # "nbytes":I
    :cond_0
    :goto_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/Pipeline;->close()V

    .line 614
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 616
    goto :goto_2

    .line 615
    :catch_0
    move-exception v2

    .line 654
    :goto_2
    iput-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->isRunning:Z

    .line 655
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    invoke-virtual {v2, p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->remove(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V

    .line 656
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    iget v3, v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->useCount:I

    sub-int/2addr v3, v4

    iput v3, v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->useCount:I

    .line 658
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    if-eqz v2, :cond_1

    .line 659
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->close()V

    :cond_1
    return-void

    .line 620
    :cond_2
    :try_start_4
    invoke-virtual {v0, v5, v3, v6}, Landroid/gov/nist/javax/sip/parser/Pipeline;->write([BII)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .end local v5    # "msg":[B
    .end local v6    # "nbytes":I
    goto :goto_3

    .line 654
    :catchall_1
    move-exception v2

    goto :goto_7

    .line 649
    :catch_1
    move-exception v2

    .line 650
    .local v2, "ex":Ljava/lang/Exception;
    :try_start_5
    sget-object v5, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-static {v2, v5}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;Landroid/gov/nist/core/StackLogger;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 651
    .end local v2    # "ex":Ljava/lang/Exception;
    :goto_3
    goto :goto_0

    .line 622
    :catch_2
    move-exception v5

    .line 625
    .local v5, "ex":Ljava/io/IOException;
    :try_start_6
    const-string v6, "\r\n\r\n"

    const-string/jumbo v7, "UTF-8"

    invoke-virtual {v6, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/parser/Pipeline;->write([B)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 628
    goto :goto_4

    .line 626
    :catch_3
    move-exception v6

    .line 631
    :goto_4
    :try_start_7
    sget-object v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v7, 0x20

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 632
    sget-object v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "IO issue while closing socket "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 635
    :cond_3
    :try_start_8
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v6, v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxConnections:I

    if-eq v6, v2, :cond_4

    .line 636
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    monitor-enter v2
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 637
    :try_start_9
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    iget v7, v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->nConnections:I

    sub-int/2addr v7, v4

    iput v7, v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->nConnections:I

    .line 638
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v6}, Ljava/lang/Object;->notify()V

    .line 639
    monitor-exit v2

    goto :goto_5

    :catchall_2
    move-exception v6

    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .end local v0    # "hispipe":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .end local v1    # "bufferSize":I
    .end local v5    # "ex":Ljava/io/IOException;
    :try_start_a
    throw v6

    .line 641
    .restart local v0    # "hispipe":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .restart local v1    # "bufferSize":I
    .restart local v5    # "ex":Ljava/io/IOException;
    :cond_4
    :goto_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->close()V

    .line 642
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/Pipeline;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 644
    goto :goto_6

    .line 643
    :catch_4
    move-exception v2

    .line 647
    :goto_6
    goto :goto_8

    .line 654
    .end local v5    # "ex":Ljava/io/IOException;
    :goto_7
    iput-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->isRunning:Z

    .line 655
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    invoke-virtual {v3, p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->remove(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V

    .line 656
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    iget v5, v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->useCount:I

    sub-int/2addr v5, v4

    iput v5, v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->useCount:I

    .line 658
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    if-eqz v3, :cond_5

    .line 659
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->close()V

    :cond_5
    throw v2

    .line 645
    .restart local v5    # "ex":Ljava/io/IOException;
    :catch_5
    move-exception v2

    .line 654
    :goto_8
    iput-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->isRunning:Z

    .line 655
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    invoke-virtual {v2, p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->remove(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V

    .line 656
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    iget v3, v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->useCount:I

    sub-int/2addr v3, v4

    iput v3, v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->useCount:I

    .line 658
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    if-eqz v2, :cond_6

    .line 659
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->close()V

    :cond_6
    return-void
.end method

.method public sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 10
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 173
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->isNullRequest()Z

    move-result v0

    if-nez v0, :cond_0

    .line 174
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "sendMessage:: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFirstLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " cseq method = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 177
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageProcessors()[Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    .local v0, "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v4, v0, v3

    .line 179
    .local v4, "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getPeerAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getPeerPort()I

    move-result v6

    if-ne v5, v6, :cond_2

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getPeerProtocol()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 184
    new-instance v5, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$1;

    invoke-direct {v5, p0, p1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$1;-><init>(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 205
    .local v5, "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v6

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v6

    invoke-interface {v6, v5}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 208
    sget-object v6, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 210
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v6, "Self routing message"

    invoke-interface {v1, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 212
    :cond_1
    return-void

    .line 177
    .end local v4    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v5    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 217
    .end local v0    # "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v2    # "len$":I
    .end local v3    # "i$":I
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 219
    .local v0, "msg":[B
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 223
    .local v8, "time":J
    iget v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPortAdvertisedInHeaders:I

    if-gtz v2, :cond_5

    .line 224
    instance-of v2, p1, Landroid/gov/nist/javax/sip/message/SIPResponse;

    if-eqz v2, :cond_5

    .line 225
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 226
    .local v2, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v3

    .line 227
    .local v3, "via":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Via;->getRPort()I

    move-result v4

    if-lez v4, :cond_5

    .line 228
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v4

    if-gtz v4, :cond_4

    .line 230
    const/16 v4, 0x13c4

    iput v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPortAdvertisedInHeaders:I

    goto :goto_1

    .line 232
    :cond_4
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v4

    iput v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPortAdvertisedInHeaders:I

    .line 234
    :goto_1
    sget-object v4, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 235
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "1.Storing peerPortAdvertisedInHeaders = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPortAdvertisedInHeaders:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " for via port = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " via rport = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Via;->getRPort()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " and peer port = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " for this channel "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " key "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 243
    .end local v2    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v3    # "via":Landroid/gov/nist/javax/sip/header/Via;
    :cond_5
    instance-of v1, p1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sendMessage([BZ)V

    .line 247
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemoteAddress(Ljava/net/InetAddress;)V

    .line 248
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemotePort(I)V

    .line 249
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalAddress(Ljava/net/InetAddress;)V

    .line 250
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getPort()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalPort(I)V

    .line 252
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x10

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 254
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    move-object v2, p0

    move-object v3, p1

    move-wide v6, v8

    invoke-virtual/range {v2 .. v7}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V

    .line 255
    :cond_6
    return-void
.end method

.method protected abstract sendMessage([BZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public sendSingleCLRF()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 726
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->lastKeepAliveReceivedTime:J

    .line 728
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->mySock:Ljava/net/Socket;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->mySock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 729
    const-string v0, "\r\n"

    const-string/jumbo v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sendMessage([BZ)V

    .line 732
    :cond_0
    monitor-enter p0

    .line 733
    :try_start_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->isRunning:Z

    if-eqz v0, :cond_1

    .line 734
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 735
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->rescheduleKeepAliveTimeout(J)V

    .line 738
    :cond_1
    monitor-exit p0

    .line 739
    return-void

    .line 738
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setKeepAliveTimeout(J)V
    .locals 5
    .param p1, "keepAliveTimeout"    # J

    .line 762
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gez v2, :cond_0

    .line 763
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->cancelPingKeepAliveTimeoutTaskIfStarted()V

    .line 765
    :cond_0
    cmp-long v2, p1, v0

    if-nez v2, :cond_1

    .line 766
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getReliableConnectionKeepAliveTimeout()I

    move-result v2

    int-to-long p1, v2

    .line 769
    :cond_1
    sget-object v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 770
    sget-object v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "~~~ setKeepAliveTimeout for MessageChannel(key="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "), clientAddress="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", clientPort="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", timeout="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 774
    :cond_2
    iput-wide p1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveTimeout:J

    .line 775
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveSemaphore:Ljava/util/concurrent/Semaphore;

    const/4 v3, 0x1

    if-nez v2, :cond_3

    .line 776
    new-instance v2, Ljava/util/concurrent/Semaphore;

    invoke-direct {v2, v3}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->keepAliveSemaphore:Ljava/util/concurrent/Semaphore;

    .line 779
    :cond_3
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->pingKeepAliveTimeoutTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    if-eqz v2, :cond_4

    goto :goto_0

    :cond_4
    const/4 v3, 0x0

    :goto_0
    move v2, v3

    .line 780
    .local v2, "isKeepAliveTimeoutTaskScheduled":Z
    if-eqz v2, :cond_5

    cmp-long v0, p1, v0

    if-lez v0, :cond_5

    .line 781
    invoke-virtual {p0, p1, p2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->rescheduleKeepAliveTimeout(J)V

    .line 783
    :cond_5
    return-void
.end method

.method protected uncache()V
    .locals 1

    .line 667
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->isCached:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->isRunning:Z

    if-nez v0, :cond_0

    .line 668
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->remove(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V

    .line 670
    :cond_0
    return-void
.end method
