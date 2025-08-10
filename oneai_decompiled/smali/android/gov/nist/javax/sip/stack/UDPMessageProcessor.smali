.class public Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;
.super Landroid/gov/nist/javax/sip/stack/MessageProcessor;
.source "UDPMessageProcessor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor$SocketIOExceptionEvent;
    }
.end annotation


# static fields
.field private static final HIGHWAT:I = 0x1388

.field private static final LOWAT:I = 0x9c4

.field private static final MAX_EXCEPTIONS_TO_REPORT:I = 0xa

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field congestionAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

.field private exceptionsReportedCounter:I

.field protected isRunning:Z

.field private maxMessageSize:I

.field protected messageChannels:Ljava/util/LinkedList;

.field protected messageQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Landroid/gov/nist/javax/sip/stack/DatagramQueuedMessageDispatch;",
            ">;"
        }
    .end annotation
.end field

.field private port:I

.field protected sock:Ljava/net/DatagramSocket;

.field protected threadPoolSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 75
    const-class v0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V
    .locals 3
    .param p1, "ipAddress"    # Ljava/net/InetAddress;
    .param p2, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p3, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    const-string/jumbo v0, "udp"

    invoke-direct {p0, p1, p3, v0, p2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;-><init>(Ljava/net/InetAddress;ILjava/lang/String;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 113
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->MAX_DATAGRAM_SIZE:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->maxMessageSize:I

    .line 127
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 128
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxMessageSize()I

    move-result v0

    sget-object v1, Landroid/gov/nist/javax/sip/SipStackImpl;->MAX_DATAGRAM_SIZE:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxMessageSize()I

    move-result v0

    if-lez v0, :cond_0

    .line 129
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxMessageSize()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->maxMessageSize:I

    .line 131
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 132
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Max Message size is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->maxMessageSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 134
    :cond_1
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->messageQueue:Ljava/util/concurrent/BlockingQueue;

    .line 136
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getStackCongestionControlTimeout()I

    move-result v0

    if-lez v0, :cond_2

    .line 137
    new-instance v0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->messageQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;-><init>(Ljava/util/Queue;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->congestionAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    .line 138
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->congestionAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getStackCongestionControlTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->setTimeout(I)V

    .line 139
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->congestionAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    const/16 v1, 0x7d0

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->start(I)V

    .line 142
    :cond_2
    iput p3, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->port:I

    .line 144
    :try_start_0
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getNetworkLayer()Landroid/gov/nist/core/net/NetworkLayer;

    move-result-object v0

    invoke-interface {v0, p3, p1}, Landroid/gov/nist/core/net/NetworkLayer;->createDatagramSocket(ILjava/net/InetAddress;)Ljava/net/DatagramSocket;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    .line 147
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getReceiveUdpBufferSize()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->setReceiveBufferSize(I)V

    .line 148
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSendUdpBufferSize()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->setSendBufferSize(I)V

    .line 155
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/core/ThreadAuditor;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 156
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/core/ThreadAuditor;->getPingIntervalInMillisecs()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 158
    :cond_3
    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    const-string v1, "0.0.0.0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    const-string v1, "::0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 164
    :cond_4
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->setIpAddress(Ljava/net/InetAddress;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    :cond_5
    nop

    .line 171
    return-void

    .line 167
    :catch_0
    move-exception v0

    .line 168
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->congestionAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    if-eqz v1, :cond_6

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->congestionAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->stop()V

    .line 169
    :cond_6
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static synthetic access$000(Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;)I
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;

    .line 73
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->port:I

    return v0
.end method

.method private reportSockeException(Ljava/lang/Exception;)V
    .locals 6
    .param p1, "e"    # Ljava/lang/Exception;

    .line 277
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->exceptionsReportedCounter:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_2

    .line 278
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->exceptionsReportedCounter:I

    const/4 v2, 0x1

    add-int/2addr v0, v2

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->exceptionsReportedCounter:I

    .line 279
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->exceptionsReportedCounter:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    move v0, v2

    .line 280
    .local v0, "lastBeforeFloodingChecker":Z
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    invoke-virtual {v2}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->getPort()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    if-eqz v0, :cond_1

    const-string v5, "(Flooding checker active, no more socket IO-exceptions will be reported)"

    goto :goto_1

    :cond_1
    const-string v5, ""

    :goto_1
    filled-new-array {v1, v2, v3, v4, v5}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Caught \'%s\' on UDP receive socket on %s:%s, message \'%s\'. Trying to ignore it ... %s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 282
    .local v1, "msg":Ljava/lang/String;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 283
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, p1}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 284
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v2

    .line 285
    .local v2, "listener":Landroid/javax/sip/SipListener;
    if-eqz v2, :cond_2

    .line 286
    new-instance v3, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor$SocketIOExceptionEvent;

    invoke-direct {v3, p0, v1}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor$SocketIOExceptionEvent;-><init>(Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Landroid/javax/sip/SipListener;->processIOException(Landroid/javax/sip/IOExceptionEvent;)V

    .line 289
    .end local v0    # "lastBeforeFloodingChecker":Z
    .end local v1    # "msg":Ljava/lang/String;
    .end local v2    # "listener":Landroid/javax/sip/SipListener;
    :cond_2
    return-void
.end method


# virtual methods
.method public createMessageChannel(Landroid/gov/nist/core/HostPort;)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 4
    .param p1, "targetHostPort"    # Landroid/gov/nist/core/HostPort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 349
    new-instance v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;

    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v0, v1, v2, v3, p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;)V

    return-object v0
.end method

.method public createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 2
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 355
    new-instance v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v0, p1, p2, v1, p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;)V

    return-object v0
.end method

.method public getDefaultTargetPort()I
    .locals 1

    .line 362
    const/16 v0, 0x13c4

    return v0
.end method

.method public getMaximumMessageSize()I
    .locals 1

    .line 376
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getReceiveUdpBufferSize()I

    move-result v0

    return v0
.end method

.method public getPort()I
    .locals 1

    .line 181
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->port:I

    return v0
.end method

.method public getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1

    .line 341
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    return-object v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 332
    const-string/jumbo v0, "udp"

    return-object v0
.end method

.method public inUse()Z
    .locals 1

    .line 383
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->messageQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .line 369
    const/4 v0, 0x0

    return v0
.end method

.method public run()V
    .locals 9

    .line 205
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->messageChannels:Ljava/util/LinkedList;

    .line 208
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPoolSize:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 209
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPoolSize:I

    if-ge v0, v2, :cond_0

    .line 210
    new-instance v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v5, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipStackImpl;->getStackName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-UDPMessageChannelThread-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, p0, v4}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;Ljava/lang/String;)V

    .line 212
    .local v2, "channel":Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->messageChannels:Ljava/util/LinkedList;

    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 209
    .end local v2    # "channel":Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 218
    .end local v0    # "i":I
    :cond_0
    const/4 v0, 0x0

    .line 220
    .local v0, "threadHandle":Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 221
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/ThreadAuditor;->addCurrentThread()Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    move-result-object v0

    .line 225
    :cond_1
    :goto_1
    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->isRunning:Z

    if-eqz v2, :cond_6

    .line 229
    if-eqz v0, :cond_2

    .line 230
    :try_start_0
    invoke-virtual {v0}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;->ping()V

    .line 232
    :cond_2
    iget v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->maxMessageSize:I

    .line 233
    .local v2, "bufsize":I
    new-array v3, v2, [B

    .line 234
    .local v3, "message":[B
    new-instance v4, Ljava/net/DatagramPacket;

    invoke-direct {v4, v3, v2}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 235
    .local v4, "packet":Ljava/net/DatagramPacket;
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    invoke-virtual {v5, v4}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 239
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v5, v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPoolSize:I

    if-eq v5, v1, :cond_3

    .line 246
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->messageQueue:Ljava/util/concurrent/BlockingQueue;

    new-instance v6, Landroid/gov/nist/javax/sip/stack/DatagramQueuedMessageDispatch;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-direct {v6, v4, v7, v8}, Landroid/gov/nist/javax/sip/stack/DatagramQueuedMessageDispatch;-><init>(Ljava/net/DatagramPacket;J)V

    invoke-interface {v5, v6}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_2

    .line 249
    :cond_3
    new-instance v5, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v5, v6, p0, v4}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;Ljava/net/DatagramPacket;)V

    .line 251
    :goto_2
    const/4 v5, 0x0

    iput v5, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->exceptionsReportedCounter:I
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2    # "bufsize":I
    .end local v3    # "message":[B
    .end local v4    # "packet":Ljava/net/DatagramPacket;
    goto :goto_3

    .line 270
    :catch_0
    move-exception v2

    .line 271
    .local v2, "ex":Ljava/lang/Exception;
    invoke-direct {p0, v2}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->reportSockeException(Ljava/lang/Exception;)V

    .end local v2    # "ex":Ljava/lang/Exception;
    goto :goto_3

    .line 267
    :catch_1
    move-exception v2

    .line 268
    .local v2, "ex":Ljava/io/IOException;
    invoke-direct {p0, v2}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->reportSockeException(Ljava/lang/Exception;)V

    .end local v2    # "ex":Ljava/io/IOException;
    goto :goto_3

    .line 256
    :catch_2
    move-exception v2

    .line 257
    .local v2, "ex":Ljava/net/SocketException;
    iget-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->isRunning:Z

    if-nez v3, :cond_5

    .line 258
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 259
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "UDPMessageProcessor: Stopping"

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 261
    :cond_4
    return-void

    .line 264
    :cond_5
    invoke-direct {p0, v2}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->reportSockeException(Ljava/lang/Exception;)V

    .end local v2    # "ex":Ljava/net/SocketException;
    goto :goto_3

    .line 253
    :catch_3
    move-exception v2

    .line 272
    :goto_3
    goto :goto_1

    .line 274
    :cond_6
    return-void
.end method

.method public start()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->isRunning:Z

    .line 191
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 192
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageProcessorThread-UDP-"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v2, 0x2f

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->getPort()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 196
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadPriority()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setPriority(I)V

    .line 197
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 198
    return-void
.end method

.method public stop()V
    .locals 3

    .line 314
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->isRunning:Z

    .line 315
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 317
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->messageChannels:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 318
    .local v1, "messageChannel":Ljava/lang/Object;
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->close()V

    .line 319
    .end local v1    # "messageChannel":Ljava/lang/Object;
    goto :goto_0

    .line 321
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getStackCongestionControlTimeout()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->congestionAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    if-eqz v0, :cond_1

    .line 322
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->congestionAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->stop()V

    .line 324
    :cond_1
    return-void
.end method
