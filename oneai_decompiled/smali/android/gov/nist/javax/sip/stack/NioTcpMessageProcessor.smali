.class public Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
.super Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;
.source "NioTcpMessageProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;,
        Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;,
        Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;
    }
.end annotation


# static fields
.field private static final MAX_CHANGE_REQS:I = 0x2710

.field private static final MAX_PENDING_DATA:I = 0x2710

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected final changeRequests:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;",
            ">;"
        }
    .end annotation
.end field

.field protected channel:Ljava/nio/channels/ServerSocketChannel;

.field protected nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

.field private final pendingData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/nio/channels/SocketChannel;",
            "Ljava/util/Queue<",
            "Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;",
            ">;>;"
        }
    .end annotation
.end field

.field protected selector:Ljava/nio/channels/Selector;

.field protected selectorThread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 52
    const-class v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V
    .locals 1
    .param p1, "ipAddress"    # Ljava/net/InetAddress;
    .param p2, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p3, "port"    # I

    .line 495
    const-string/jumbo v0, "TCP"

    invoke-direct {p0, p1, p3, v0, p2}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;-><init>(Ljava/net/InetAddress;ILjava/lang/String;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 59
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->changeRequests:Ljava/util/Queue;

    .line 62
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->pendingData:Ljava/util/Map;

    .line 496
    new-instance v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-direct {v0, p2, p0}, Landroid/gov/nist/javax/sip/stack/NIOHandler;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 497
    return-void
.end method

.method static synthetic access$000()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 47
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method static synthetic access$100(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    .line 47
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->pendingData:Ljava/util/Map;

    return-object v0
.end method

.method private blockingConnect(Ljava/net/InetSocketAddress;Ljava/net/InetAddress;I)Ljava/nio/channels/SocketChannel;
    .locals 7
    .param p1, "address"    # Ljava/net/InetSocketAddress;
    .param p2, "myAddress"    # Ljava/net/InetAddress;
    .param p3, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 103
    invoke-static {}, Ljava/nio/channels/SocketChannel;->open()Ljava/nio/channels/SocketChannel;

    move-result-object v0

    .line 104
    .local v0, "socketChannel":Ljava/nio/channels/SocketChannel;
    const/4 v1, 0x0

    if-eqz p2, :cond_0

    .line 106
    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v2

    new-instance v3, Ljava/net/InetSocketAddress;

    invoke-direct {v3, p2, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v2, v3}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 108
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/nio/channels/SocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 110
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 111
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Init connect "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 112
    :cond_1
    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v3

    invoke-virtual {v3, p1, p3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 113
    invoke-virtual {v0, v1}, Ljava/nio/channels/SocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 114
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 115
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Blocking set to false now "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 118
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->changeRequests:Ljava/util/Queue;

    new-instance v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;

    invoke-direct {v3, v0, v2, v2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;-><init>(Ljava/nio/channels/SocketChannel;II)V

    invoke-interface {v1, v3}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 120
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 121
    return-object v0
.end method

.method private declared-synchronized createMessageChannel(Ljava/lang/String;Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "targetHost"    # Ljava/net/InetAddress;
    .param p3, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 521
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    .line 523
    .local v0, "retval":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    if-nez v0, :cond_1

    .line 524
    invoke-virtual {p0, p2, p3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->constructMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    move-result-object v1

    move-object v0, v1

    .line 526
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->isCached:Z

    .line 528
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 529
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "key "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 530
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Creating "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 532
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->nioMode:Landroid/gov/nist/javax/sip/stack/NIOMode;

    sget-object v2, Landroid/gov/nist/javax/sip/stack/NIOMode;->BLOCKING:Landroid/gov/nist/javax/sip/stack/NIOMode;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOMode;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 533
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 536
    :cond_1
    monitor-exit p0

    return-object v0

    .line 520
    .end local v0    # "retval":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    .end local p1    # "key":Ljava/lang/String;
    .end local p2    # "targetHost":Ljava/net/InetAddress;
    .end local p3    # "port":I
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private nonBlockingConnect(Ljava/net/InetSocketAddress;Ljava/net/InetAddress;I)Ljava/nio/channels/SocketChannel;
    .locals 5
    .param p1, "address"    # Ljava/net/InetSocketAddress;
    .param p2, "myAddress"    # Ljava/net/InetAddress;
    .param p3, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    invoke-static {}, Ljava/nio/channels/SocketChannel;->open()Ljava/nio/channels/SocketChannel;

    move-result-object v0

    .line 126
    .local v0, "socketChannel":Ljava/nio/channels/SocketChannel;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/channels/SocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 127
    if-eqz p2, :cond_0

    .line 129
    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v2

    new-instance v3, Ljava/net/InetSocketAddress;

    invoke-direct {v3, p2, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v2, v3}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 131
    :cond_0
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 132
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Init connect "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 134
    :cond_1
    invoke-virtual {v0, p1}, Ljava/nio/channels/SocketChannel;->connect(Ljava/net/SocketAddress;)Z

    .line 135
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->changeRequests:Ljava/util/Queue;

    new-instance v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;

    const/4 v3, 0x1

    const/16 v4, 0x8

    invoke-direct {v2, v0, v3, v4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;-><init>(Ljava/nio/channels/SocketChannel;II)V

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 137
    return-object v0
.end method


# virtual methods
.method public connect(Ljava/net/InetSocketAddress;Ljava/net/InetAddress;I)Ljava/nio/channels/SocketChannel;
    .locals 2
    .param p1, "address"    # Ljava/net/InetSocketAddress;
    .param p2, "localAddress"    # Ljava/net/InetAddress;
    .param p3, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->nioMode:Landroid/gov/nist/javax/sip/stack/NIOMode;

    sget-object v1, Landroid/gov/nist/javax/sip/stack/NIOMode;->BLOCKING:Landroid/gov/nist/javax/sip/stack/NIOMode;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/NIOMode;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->blockingConnect(Ljava/net/InetSocketAddress;Ljava/net/InetAddress;I)Ljava/nio/channels/SocketChannel;

    move-result-object v0

    return-object v0

    .line 145
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nonBlockingConnect(Ljava/net/InetSocketAddress;Ljava/net/InetAddress;I)Ljava/nio/channels/SocketChannel;

    move-result-object v0

    return-object v0
.end method

.method constructMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    .locals 2
    .param p1, "targetHost"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 501
    new-instance v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v0, p1, p2, v1, p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V

    return-object v0
.end method

.method public createMessageChannel(Landroid/gov/nist/core/HostPort;)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 6
    .param p1, "targetHostPort"    # Landroid/gov/nist/core/HostPort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 541
    const-string v0, "MessageChannel::createMessageChannel - exit "

    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 542
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NioTcpMessageProcessor::createMessageChannel: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 544
    :cond_0
    const/4 v1, 0x0

    .line 546
    .local v1, "retval":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :try_start_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->transport:Ljava/lang/String;

    invoke-static {p1, v3}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Landroid/gov/nist/core/HostPort;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 547
    .local v3, "key":Ljava/lang/String;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-object v1, v4

    .line 549
    if-nez v1, :cond_1

    .line 550
    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v5

    invoke-direct {p0, v3, v4, v5}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->createMessageChannel(Ljava/lang/String;Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v1, v4

    .line 554
    .end local v3    # "key":Ljava/lang/String;
    :cond_1
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 555
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 558
    :cond_2
    return-object v1

    .line 554
    :catchall_0
    move-exception v3

    sget-object v4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 555
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_3
    throw v3
.end method

.method public createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 2
    .param p1, "targetHost"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 563
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->transport:Ljava/lang/String;

    invoke-static {p1, p2, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 564
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->messageChannels:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 566
    .local v1, "retval":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    if-nez v1, :cond_0

    .line 567
    invoke-direct {p0, v0, p1, p2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->createMessageChannel(Ljava/lang/String;Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v1

    .line 569
    :cond_0
    return-object v1
.end method

.method public createMessageChannel(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    .locals 2
    .param p1, "nioTcpMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    .param p2, "client"    # Ljava/nio/channels/SocketChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 483
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->getMessageChannel(Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    move-result-object v0

    .line 484
    .local v0, "retval":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    if-nez v0, :cond_0

    .line 485
    new-instance v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    invoke-direct {v1, p1, p2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)V

    move-object v0, v1

    .line 487
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v1, p2, v0}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putMessageChannel(Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;)V

    .line 489
    :cond_0
    iput-object p1, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 490
    invoke-virtual {p2}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    iput-object v1, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 491
    return-object v0
.end method

.method protected createProcessorTask()Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;
    .locals 1

    .line 609
    new-instance v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;-><init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V

    return-object v0
.end method

.method public getDefaultTargetPort()I
    .locals 1

    .line 585
    const/16 v0, 0x13c4

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .line 590
    const/4 v0, 0x0

    return v0
.end method

.method protected declared-synchronized remove(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V
    .locals 3
    .param p1, "messageChannel"    # Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    monitor-enter p0

    .line 576
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 577
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " removing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->getSocketChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " from processor "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 579
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->pendingData:Ljava/util/Map;

    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->getSocketChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 580
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->remove(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 581
    monitor-exit p0

    return-void

    .line 575
    .end local p1    # "messageChannel":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public send(Ljava/nio/channels/SocketChannel;[B)V
    .locals 7
    .param p1, "socket"    # Ljava/nio/channels/SocketChannel;
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 150
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Sending data "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes on socket "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 154
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->pendingData:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Queue;

    .line 157
    .local v0, "queue":Ljava/util/Queue;, "Ljava/util/Queue<Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;>;"
    if-nez v0, :cond_2

    .line 160
    monitor-enter p1

    .line 162
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->pendingData:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 163
    new-instance v2, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    move-object v0, v2

    .line 164
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->pendingData:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 166
    :cond_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->pendingData:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Queue;

    move-object v0, v2

    .line 168
    :goto_0
    monitor-exit p1

    goto :goto_1

    :catchall_0
    move-exception v1

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 171
    :cond_2
    :goto_1
    new-instance v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;

    sget-object v3, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageTxId:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;-><init>(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 172
    .local v2, "pData":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;
    invoke-interface {v0, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 174
    invoke-virtual {p1}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 175
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 176
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Connected. lets set WRITE ops."

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 178
    :cond_3
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->changeRequests:Ljava/util/Queue;

    new-instance v4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;

    const/4 v5, 0x2

    const/4 v6, 0x4

    invoke-direct {v4, p1, v5, v6}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;-><init>(Ljava/nio/channels/SocketChannel;II)V

    invoke-interface {v3, v4}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 181
    :cond_4
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 182
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "Waking up selector thread"

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 183
    :cond_5
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 184
    return-void
.end method

.method public start()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 597
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    .line 598
    invoke-static {}, Ljava/nio/channels/ServerSocketChannel;->open()Ljava/nio/channels/ServerSocketChannel;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->channel:Ljava/nio/channels/ServerSocketChannel;

    .line 599
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->channel:Ljava/nio/channels/ServerSocketChannel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/channels/ServerSocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 600
    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->getPort()I

    move-result v2

    invoke-direct {v0, v1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 601
    .local v0, "isa":Ljava/net/InetSocketAddress;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->channel:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/ServerSocketChannel;->socket()Ljava/net/ServerSocket;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;)V

    .line 602
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->channel:Ljava/nio/channels/ServerSocketChannel;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    const/16 v3, 0x10

    invoke-virtual {v1, v2, v3}, Ljava/nio/channels/ServerSocketChannel;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;

    .line 603
    new-instance v1, Ljava/lang/Thread;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->createProcessorTask()Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selectorThread:Ljava/lang/Thread;

    .line 604
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selectorThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 605
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selectorThread:Ljava/lang/Thread;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "NioSelector-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 606
    return-void
.end method

.method public stop()V
    .locals 3

    .line 615
    const-string/jumbo v0, "Problem closing channel "

    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 616
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->close()V

    .line 618
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 621
    goto :goto_0

    .line 619
    :catch_0
    move-exception v1

    .line 620
    .local v1, "ex":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v0, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 623
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_0
    :try_start_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->channel:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/ServerSocketChannel;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 626
    goto :goto_1

    .line 624
    :catch_1
    move-exception v1

    .line 625
    .restart local v1    # "ex":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v0, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 627
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_1
    return-void
.end method
