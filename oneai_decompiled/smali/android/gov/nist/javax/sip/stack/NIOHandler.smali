.class public Landroid/gov/nist/javax/sip/stack/NIOHandler;
.super Ljava/lang/Object;
.source "NIOHandler.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected channelMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/nio/channels/SocketChannel;",
            "Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;",
            ">;"
        }
    .end annotation
.end field

.field keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

.field private messageProcessor:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

.field private sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

.field private final socketTable:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/nio/channels/SocketChannel;",
            ">;"
        }
    .end annotation
.end field

.field protected socketTimeoutAuditor:Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;

.field private stopped:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 63
    const-class v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V
    .locals 9
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "messageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTimeoutAuditor:Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;

    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->stopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 75
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 77
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    .line 97
    new-instance v0, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    .line 109
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 110
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->messageProcessor:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    .line 111
    iget-wide v0, p1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->nioSocketMaxIdleTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    instance-of v0, p2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    if-eqz v0, :cond_0

    .line 113
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;

    iget-wide v1, p1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->nioSocketMaxIdleTime:J

    invoke-direct {v0, v1, v2, p0}, Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;-><init>(JLandroid/gov/nist/javax/sip/stack/NIOHandler;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTimeoutAuditor:Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;

    .line 114
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTimeoutAuditor:Landroid/gov/nist/javax/sip/stack/SocketTimeoutAuditor;

    iget-wide v5, p1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->nioSocketMaxIdleTime:J

    iget-wide v7, p1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->nioSocketMaxIdleTime:J

    invoke-interface/range {v3 .. v8}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->scheduleWithFixedDelay(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;JJ)Z

    .line 116
    :cond_0
    return-void
.end method

.method protected static makeKey(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "addr"    # Ljava/lang/String;
    .param p1, "port"    # I

    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;
    .locals 2
    .param p0, "addr"    # Ljava/net/InetAddress;
    .param p1, "port"    # I

    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private openOutgoingConnection(Ljava/net/InetAddress;Ljava/net/InetAddress;IZLjava/lang/String;)Ljava/nio/channels/SocketChannel;
    .locals 18
    .param p1, "senderAddress"    # Ljava/net/InetAddress;
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "contactPort"    # I
    .param p4, "retry"    # Z
    .param p5, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 252
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    const-string/jumbo v7, "inaddr = "

    const/4 v8, 0x0

    .line 253
    .local v8, "retry_count":I
    if-eqz v5, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    move v10, v0

    .line 254
    .local v10, "max_retry":I
    const/4 v11, 0x0

    .line 256
    .local v11, "clientSock":Ljava/nio/channels/SocketChannel;
    const/4 v12, 0x0

    .line 257
    .local v12, "entered":Z
    const/4 v13, 0x0

    .line 258
    .local v13, "connected":Z
    const/4 v14, 0x0

    .line 260
    .local v14, "attempted":Z
    const/16 v9, 0x20

    const/4 v15, 0x0

    :try_start_0
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;->enterIOCriticalSection(Ljava/lang/String;)V

    .line 261
    const/4 v12, 0x1

    .line 263
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->getSocket(Ljava/lang/String;)Ljava/nio/channels/SocketChannel;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move-object v11, v0

    .line 266
    if-eqz v11, :cond_2

    :try_start_1
    invoke-virtual {v11}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v11}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {v11}, Ljava/nio/channels/SocketChannel;->isConnectionPending()Z

    move-result v0

    if-nez v0, :cond_2

    .line 268
    invoke-direct {v1, v6, v15}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->removeSocket(Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 269
    const/4 v0, 0x0

    move-object v11, v0

    .end local v11    # "clientSock":Ljava/nio/channels/SocketChannel;
    .local v0, "clientSock":Ljava/nio/channels/SocketChannel;
    goto :goto_1

    .line 370
    .end local v0    # "clientSock":Ljava/nio/channels/SocketChannel;
    .restart local v11    # "clientSock":Ljava/nio/channels/SocketChannel;
    :catchall_0
    move-exception v0

    move/from16 v16, v8

    move/from16 v17, v10

    goto/16 :goto_6

    .line 312
    :catch_0
    move-exception v0

    move/from16 v16, v8

    move/from16 v17, v10

    goto/16 :goto_4

    .line 271
    :cond_2
    :goto_1
    if-nez v11, :cond_7

    .line 272
    const/4 v14, 0x1

    .line 274
    if-ge v8, v10, :cond_6

    .line 276
    if-nez v11, :cond_5

    .line 277
    :try_start_2
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v0, :cond_3

    .line 278
    :try_start_3
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 280
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "port = "

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 290
    :cond_3
    :try_start_4
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->messageProcessor:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    new-instance v9, Ljava/net/InetSocketAddress;

    invoke-direct {v9, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    iget-object v15, v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->messageProcessor:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v15, v15, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v15, v15, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->connTimeout:I

    invoke-virtual {v0, v9, v2, v15}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->connect(Ljava/net/InetSocketAddress;Ljava/net/InetAddress;I)Ljava/nio/channels/SocketChannel;

    move-result-object v0
    :try_end_4
    .catch Ljava/net/SocketException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object v11, v0

    .line 304
    nop

    .line 305
    :try_start_5
    invoke-virtual {v1, v6, v11}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putSocket(Ljava/lang/String;Ljava/nio/channels/SocketChannel;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move/from16 v16, v8

    move/from16 v17, v10

    goto/16 :goto_3

    .line 294
    :catch_1
    move-exception v0

    .line 295
    .local v0, "e":Ljava/net/SocketException;
    :try_start_6
    sget-object v9, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v15, 0x10

    invoke-interface {v9, v15}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    const-string v15, " "

    if-eqz v9, :cond_4

    .line 296
    :try_start_7
    sget-object v9, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    move/from16 v16, v8

    .end local v8    # "retry_count":I
    .local v16, "retry_count":I
    :try_start_8
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    move/from16 v17, v10

    .end local v10    # "max_retry":I
    .local v17, "max_retry":I
    :try_start_9
    const-string/jumbo v10, "Problem connecting "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v9, v8}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    goto :goto_2

    .line 370
    .end local v0    # "e":Ljava/net/SocketException;
    .end local v17    # "max_retry":I
    .restart local v10    # "max_retry":I
    :catchall_1
    move-exception v0

    move/from16 v17, v10

    .end local v10    # "max_retry":I
    .restart local v17    # "max_retry":I
    goto/16 :goto_6

    .line 312
    .end local v17    # "max_retry":I
    .restart local v10    # "max_retry":I
    :catch_2
    move-exception v0

    move/from16 v17, v10

    .end local v10    # "max_retry":I
    .restart local v17    # "max_retry":I
    goto/16 :goto_4

    .line 295
    .end local v16    # "retry_count":I
    .end local v17    # "max_retry":I
    .restart local v0    # "e":Ljava/net/SocketException;
    .restart local v8    # "retry_count":I
    .restart local v10    # "max_retry":I
    :cond_4
    move/from16 v16, v8

    move/from16 v17, v10

    .line 301
    .end local v8    # "retry_count":I
    .end local v10    # "max_retry":I
    .restart local v16    # "retry_count":I
    .restart local v17    # "max_retry":I
    :goto_2
    const/4 v8, 0x0

    invoke-direct {v1, v6, v8}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->removeSocket(Ljava/lang/String;Z)V

    .line 302
    new-instance v8, Ljava/net/SocketException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Ljava/net/SocketException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Ljava/net/SocketException;->getCause()Ljava/lang/Throwable;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " Problem connecting "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    .end local v11    # "clientSock":Ljava/nio/channels/SocketChannel;
    .end local v12    # "entered":Z
    .end local v13    # "connected":Z
    .end local v14    # "attempted":Z
    .end local v16    # "retry_count":I
    .end local v17    # "max_retry":I
    .end local p1    # "senderAddress":Ljava/net/InetAddress;
    .end local p2    # "receiverAddress":Ljava/net/InetAddress;
    .end local p3    # "contactPort":I
    .end local p4    # "retry":Z
    .end local p5    # "key":Ljava/lang/String;
    throw v8
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 312
    .end local v0    # "e":Ljava/net/SocketException;
    .restart local v11    # "clientSock":Ljava/nio/channels/SocketChannel;
    .restart local v12    # "entered":Z
    .restart local v13    # "connected":Z
    .restart local v14    # "attempted":Z
    .restart local v16    # "retry_count":I
    .restart local v17    # "max_retry":I
    .restart local p1    # "senderAddress":Ljava/net/InetAddress;
    .restart local p2    # "receiverAddress":Ljava/net/InetAddress;
    .restart local p3    # "contactPort":I
    .restart local p4    # "retry":Z
    .restart local p5    # "key":Ljava/lang/String;
    :catch_3
    move-exception v0

    goto :goto_4

    .line 276
    .end local v16    # "retry_count":I
    .end local v17    # "max_retry":I
    .restart local v8    # "retry_count":I
    .restart local v10    # "max_retry":I
    :cond_5
    move/from16 v16, v8

    move/from16 v17, v10

    .end local v8    # "retry_count":I
    .end local v10    # "max_retry":I
    .restart local v16    # "retry_count":I
    .restart local v17    # "max_retry":I
    goto :goto_3

    .line 274
    .end local v16    # "retry_count":I
    .end local v17    # "max_retry":I
    .restart local v8    # "retry_count":I
    .restart local v10    # "max_retry":I
    :cond_6
    move/from16 v16, v8

    move/from16 v17, v10

    .end local v8    # "retry_count":I
    .end local v10    # "max_retry":I
    .restart local v16    # "retry_count":I
    .restart local v17    # "max_retry":I
    goto :goto_3

    .line 271
    .end local v16    # "retry_count":I
    .end local v17    # "max_retry":I
    .restart local v8    # "retry_count":I
    .restart local v10    # "max_retry":I
    :cond_7
    move/from16 v16, v8

    move/from16 v17, v10

    .line 370
    .end local v8    # "retry_count":I
    .end local v10    # "max_retry":I
    .restart local v16    # "retry_count":I
    .restart local v17    # "max_retry":I
    :goto_3
    if-eqz v12, :cond_10

    .line 371
    if-eqz v14, :cond_8

    if-nez v13, :cond_8

    .line 377
    const/4 v7, 0x1

    invoke-direct {v1, v6, v7}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->removeSocket(Ljava/lang/String;Z)V

    .line 379
    :cond_8
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;->leaveIOCriticalSection(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 370
    .end local v16    # "retry_count":I
    .end local v17    # "max_retry":I
    .restart local v8    # "retry_count":I
    .restart local v10    # "max_retry":I
    :catchall_2
    move-exception v0

    move/from16 v16, v8

    move/from16 v17, v10

    .end local v8    # "retry_count":I
    .end local v10    # "max_retry":I
    .restart local v16    # "retry_count":I
    .restart local v17    # "max_retry":I
    goto/16 :goto_6

    .line 312
    .end local v16    # "retry_count":I
    .end local v17    # "max_retry":I
    .restart local v8    # "retry_count":I
    .restart local v10    # "max_retry":I
    :catch_4
    move-exception v0

    move/from16 v16, v8

    move/from16 v17, v10

    .line 313
    .end local v8    # "retry_count":I
    .end local v10    # "max_retry":I
    .local v0, "ex":Ljava/io/IOException;
    .restart local v16    # "retry_count":I
    .restart local v17    # "max_retry":I
    :goto_4
    :try_start_a
    sget-object v8, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x10

    invoke-interface {v8, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v8
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    const-string v9, " port = "

    if-eqz v8, :cond_9

    .line 314
    :try_start_b
    sget-object v8, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Problem OpeningConn:  inAddr "

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual/range {p2 .. p2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v15, " retry "

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v10}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 321
    :cond_9
    const/4 v8, 0x0

    invoke-direct {v1, v6, v8}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->removeSocket(Ljava/lang/String;Z)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 341
    if-nez v5, :cond_11

    .line 342
    if-gtz v4, :cond_a

    .line 343
    const/16 v4, 0x13c4

    .line 345
    .end local p3    # "contactPort":I
    .local v4, "contactPort":I
    :cond_a
    :try_start_c
    invoke-static {v3, v4}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v8
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    move-object v6, v8

    .line 346
    .end local p5    # "key":Ljava/lang/String;
    .local v6, "key":Ljava/lang/String;
    :try_start_d
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->getSocket(Ljava/lang/String;)Ljava/nio/channels/SocketChannel;

    move-result-object v8

    move-object v11, v8

    .line 347
    if-eqz v11, :cond_b

    invoke-virtual {v11}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v8

    if-eqz v8, :cond_b

    invoke-virtual {v11}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v8

    if-nez v8, :cond_d

    .line 348
    :cond_b
    const/4 v8, 0x0

    invoke-direct {v1, v6, v8}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->removeSocket(Ljava/lang/String;Z)V

    .line 349
    sget-object v8, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v10, 0x20

    invoke-interface {v8, v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 350
    sget-object v8, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v8, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 354
    :cond_c
    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->messageProcessor:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    new-instance v8, Ljava/net/InetSocketAddress;

    invoke-direct {v8, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    iget-object v9, v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->messageProcessor:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v9, v9, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v9, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->connTimeout:I

    invoke-virtual {v7, v8, v2, v9}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->connect(Ljava/net/InetSocketAddress;Ljava/net/InetAddress;I)Ljava/nio/channels/SocketChannel;

    move-result-object v7

    move-object v11, v7

    .line 356
    invoke-virtual {v1, v6, v11}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putSocket(Ljava/lang/String;Ljava/nio/channels/SocketChannel;)V

    .line 359
    :cond_d
    sget-object v7, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v8, 0x20

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 360
    sget-object v7, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "sending to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 370
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_e
    if-eqz v12, :cond_10

    .line 371
    if-eqz v14, :cond_f

    if-nez v13, :cond_f

    .line 377
    const/4 v7, 0x1

    invoke-direct {v1, v6, v7}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->removeSocket(Ljava/lang/String;Z)V

    .line 379
    :cond_f
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;->leaveIOCriticalSection(Ljava/lang/String;)V

    .line 382
    :cond_10
    :goto_5
    return-object v11

    .line 370
    :catchall_3
    move-exception v0

    goto :goto_6

    .end local v6    # "key":Ljava/lang/String;
    .restart local p5    # "key":Ljava/lang/String;
    :catchall_4
    move-exception v0

    goto :goto_6

    .line 366
    .end local v4    # "contactPort":I
    .restart local v0    # "ex":Ljava/io/IOException;
    .restart local p3    # "contactPort":I
    :cond_11
    :try_start_e
    sget-object v7, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v8, "IOException occured at "

    invoke-interface {v7, v8, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 367
    nop

    .end local v11    # "clientSock":Ljava/nio/channels/SocketChannel;
    .end local v12    # "entered":Z
    .end local v13    # "connected":Z
    .end local v14    # "attempted":Z
    .end local v16    # "retry_count":I
    .end local v17    # "max_retry":I
    .end local p1    # "senderAddress":Ljava/net/InetAddress;
    .end local p2    # "receiverAddress":Ljava/net/InetAddress;
    .end local p3    # "contactPort":I
    .end local p4    # "retry":Z
    .end local p5    # "key":Ljava/lang/String;
    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    .line 370
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v11    # "clientSock":Ljava/nio/channels/SocketChannel;
    .restart local v12    # "entered":Z
    .restart local v13    # "connected":Z
    .restart local v14    # "attempted":Z
    .restart local v16    # "retry_count":I
    .restart local v17    # "max_retry":I
    .restart local p1    # "senderAddress":Ljava/net/InetAddress;
    .restart local p2    # "receiverAddress":Ljava/net/InetAddress;
    .restart local p3    # "contactPort":I
    .restart local p4    # "retry":Z
    .restart local p5    # "key":Ljava/lang/String;
    :catchall_5
    move-exception v0

    .end local p3    # "contactPort":I
    .end local p5    # "key":Ljava/lang/String;
    .restart local v4    # "contactPort":I
    .restart local v6    # "key":Ljava/lang/String;
    :goto_6
    if-eqz v12, :cond_13

    .line 371
    if-eqz v14, :cond_12

    if-nez v13, :cond_12

    .line 377
    const/4 v7, 0x1

    invoke-direct {v1, v6, v7}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->removeSocket(Ljava/lang/String;Z)V

    .line 379
    :cond_12
    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-virtual {v7, v6}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;->leaveIOCriticalSection(Ljava/lang/String;)V

    :cond_13
    throw v0
.end method

.method private removeSocket(Ljava/lang/String;Z)V
    .locals 10
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "removeLock"    # Z

    .line 162
    const/4 v0, 0x0

    .line 164
    .local v0, "entered":Z
    const/16 v1, 0x20

    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-virtual {v2, p1}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;->enterIOCriticalSection(Ljava/lang/String;)V

    .line 165
    const/4 v0, 0x1

    .line 166
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/nio/channels/SocketChannel;

    .line 167
    .local v2, "removed":Ljava/nio/channels/SocketChannel;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v4, ", removed:"

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v3, :cond_1

    .line 168
    if-eqz v2, :cond_0

    move v3, v5

    goto :goto_0

    :cond_0
    move v3, v6

    .line 169
    .local v3, "wasRemoved":Z
    :goto_0
    :try_start_1
    sget-object v7, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "removed Socket for key "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 171
    .end local v3    # "wasRemoved":Z
    :cond_1
    if-eqz p2, :cond_3

    .line 172
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-virtual {v3, p1}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;->remove(Ljava/lang/String;)V

    .line 173
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 174
    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    move v5, v6

    :goto_1
    move v3, v5

    .line 175
    .restart local v3    # "wasRemoved":Z
    sget-object v5, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "removed Semaphore for key "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 185
    .end local v2    # "removed":Ljava/nio/channels/SocketChannel;
    .end local v3    # "wasRemoved":Z
    :cond_3
    if-eqz v0, :cond_5

    .line 188
    :goto_2
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;->leaveIOCriticalSection(Ljava/lang/String;)V

    goto :goto_3

    .line 185
    :catchall_0
    move-exception v1

    goto :goto_4

    .line 179
    :catch_0
    move-exception v2

    .line 181
    .local v2, "ioExp":Ljava/io/IOException;
    :try_start_2
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 182
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Failed on putting socket"

    invoke-interface {v1, v3, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 185
    .end local v2    # "ioExp":Ljava/io/IOException;
    :cond_4
    if-eqz v0, :cond_5

    .line 188
    goto :goto_2

    .line 191
    :cond_5
    :goto_3
    return-void

    .line 185
    :goto_4
    if-eqz v0, :cond_6

    .line 188
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-virtual {v2, p1}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;->leaveIOCriticalSection(Ljava/lang/String;)V

    :cond_6
    throw v1
.end method

.method private writeChunks(Ljava/nio/channels/SocketChannel;[BI)V
    .locals 1
    .param p1, "channel"    # Ljava/nio/channels/SocketChannel;
    .param p2, "bytes"    # [B
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 237
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->messageProcessor:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-virtual {v0, p1, p2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->send(Ljava/nio/channels/SocketChannel;[B)V

    .line 238
    return-void
.end method


# virtual methods
.method public closeAll()V
    .locals 3

    .line 469
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 470
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Closing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " sockets from IOHandler"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 475
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 476
    .local v0, "values":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/nio/channels/SocketChannel;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 477
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/channels/SocketChannel;

    .line 479
    .local v1, "s":Ljava/nio/channels/SocketChannel;
    :try_start_0
    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 481
    goto :goto_1

    .line 480
    :catch_0
    move-exception v2

    .line 482
    .end local v1    # "s":Ljava/nio/channels/SocketChannel;
    :goto_1
    goto :goto_0

    .line 484
    .end local v0    # "values":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/nio/channels/SocketChannel;>;"
    :cond_1
    return-void
.end method

.method public createOrReuseSocket(Ljava/net/InetAddress;I)Ljava/nio/channels/SocketChannel;
    .locals 9
    .param p1, "inetAddress"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 514
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->stopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 515
    const/4 v0, 0x0

    return-object v0

    .line 517
    :cond_0
    invoke-static {p1, p2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v0

    .line 518
    .local v0, "key":Ljava/lang/String;
    const/4 v1, 0x0

    .line 519
    .local v1, "channel":Ljava/nio/channels/SocketChannel;
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->getSocket(Ljava/lang/String;)Ljava/nio/channels/SocketChannel;

    move-result-object v1

    .line 520
    const/16 v7, 0x20

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v2

    if-nez v2, :cond_3

    :cond_1
    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isConnectionPending()Z

    move-result v2

    if-nez v2, :cond_3

    .line 522
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 523
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Channel disconnected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 524
    :cond_2
    const/4 v1, 0x0

    move-object v8, v1

    goto :goto_0

    .line 526
    :cond_3
    move-object v8, v1

    .end local v1    # "channel":Ljava/nio/channels/SocketChannel;
    .local v8, "channel":Ljava/nio/channels/SocketChannel;
    :goto_0
    if-nez v8, :cond_4

    .line 527
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->messageProcessor:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    const/4 v5, 0x0

    move-object v1, p0

    move-object v3, p1

    move v4, p2

    move-object v6, v0

    invoke-direct/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->openOutgoingConnection(Ljava/net/InetAddress;Ljava/net/InetAddress;IZLjava/lang/String;)Ljava/nio/channels/SocketChannel;

    move-result-object v8

    .line 530
    :cond_4
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 531
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Returning socket "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " channel = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 532
    :cond_5
    return-object v8
.end method

.method public getCurrentChannelSize()I
    .locals 1

    .line 94
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public getMessageChannel(Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    .locals 1
    .param p1, "socketChannel"    # Ljava/nio/channels/SocketChannel;

    .line 81
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    return-object v0
.end method

.method protected getSocket(Ljava/lang/String;)Ljava/nio/channels/SocketChannel;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 149
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/channels/SocketChannel;

    return-object v0
.end method

.method public putMessageChannel(Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;)V
    .locals 1
    .param p1, "socketChannel"    # Ljava/nio/channels/SocketChannel;
    .param p2, "nioTcpMessageChannel"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    .line 86
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    return-void
.end method

.method protected putSocket(Ljava/lang/String;Ljava/nio/channels/SocketChannel;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "sock"    # Ljava/nio/channels/SocketChannel;

    .line 124
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->stopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    return-void

    .line 127
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 128
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "adding socket for key "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 130
    :cond_1
    const/4 v0, 0x0

    .line 132
    .local v0, "entered":Z
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-virtual {v2, p1}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;->enterIOCriticalSection(Ljava/lang/String;)V

    .line 133
    const/4 v0, 0x1

    .line 134
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    if-eqz v0, :cond_3

    .line 142
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;->leaveIOCriticalSection(Ljava/lang/String;)V

    goto :goto_1

    .line 141
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 135
    :catch_0
    move-exception v2

    .line 137
    .local v2, "ioExp":Ljava/io/IOException;
    :try_start_1
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 138
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Failed on putting socket"

    invoke-interface {v1, v3, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 141
    .end local v2    # "ioExp":Ljava/io/IOException;
    :cond_2
    if-eqz v0, :cond_3

    .line 142
    goto :goto_0

    .line 145
    :cond_3
    :goto_1
    return-void

    .line 141
    :goto_2
    if-eqz v0, :cond_4

    .line 142
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->keyedSemaphore:Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;

    invoke-virtual {v2, p1}, Landroid/gov/nist/javax/sip/stack/KeyedSemaphore;->leaveIOCriticalSection(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method

.method public removeMessageChannel(Ljava/nio/channels/SocketChannel;)V
    .locals 1
    .param p1, "socketChannel"    # Ljava/nio/channels/SocketChannel;

    .line 90
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    return-void
.end method

.method protected removeSocket(Ljava/nio/channels/SocketChannel;)V
    .locals 9
    .param p1, "channel"    # Ljava/nio/channels/SocketChannel;

    .line 206
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    const-string v2, " socketChannel = "

    if-eqz v0, :cond_0

    .line 207
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Trying to remove cached socketChannel without key"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 210
    :cond_0
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 212
    .local v0, "keys":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    .line 213
    .local v3, "e":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/nio/channels/SocketChannel;>;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 214
    .local v5, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/nio/channels/SocketChannel;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/nio/channels/SocketChannel;

    .line 215
    .local v6, "sc":Ljava/nio/channels/SocketChannel;
    invoke-virtual {v6, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 216
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 218
    .end local v5    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/nio/channels/SocketChannel;>;"
    .end local v6    # "sc":Ljava/nio/channels/SocketChannel;
    :cond_1
    goto :goto_0

    .line 219
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .restart local v4    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 220
    .local v5, "key":Ljava/lang/String;
    sget-object v6, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 221
    sget-object v6, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Removing cached socketChannel without key"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " key = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 224
    :cond_3
    const/4 v6, 0x1

    invoke-direct {p0, v5, v6}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->removeSocket(Ljava/lang/String;Z)V

    .line 225
    .end local v5    # "key":Ljava/lang/String;
    goto :goto_1

    .line 226
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_4
    return-void
.end method

.method public sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;)Ljava/nio/channels/SocketChannel;
    .locals 17
    .param p1, "senderAddress"    # Ljava/net/InetAddress;
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "contactPort"    # I
    .param p4, "transport"    # Ljava/lang/String;
    .param p5, "bytes"    # [B
    .param p6, "retry"    # Z
    .param p7, "messageChannel"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 405
    move-object/from16 v6, p0

    move-object/from16 v7, p2

    move/from16 v8, p3

    move-object/from16 v9, p5

    move-object/from16 v10, p7

    iget-object v0, v6, Landroid/gov/nist/javax/sip/stack/NIOHandler;->stopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 406
    const/4 v0, 0x0

    return-object v0

    .line 409
    :cond_0
    array-length v11, v9

    .line 410
    .local v11, "length":I
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 411
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sendBytes "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v12, p4

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " inAddr "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " port = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " length = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " retry "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v13, p6

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_0

    .line 410
    :cond_1
    move-object/from16 v12, p4

    move/from16 v13, p6

    .line 417
    :goto_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, v6, Landroid/gov/nist/javax/sip/stack/NIOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isLogStackTraceOnMessageSend()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 419
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace(I)V

    .line 422
    :cond_2
    invoke-static/range {p2 .. p3}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v14

    .line 424
    .local v14, "key":Ljava/lang/String;
    const/4 v0, 0x0

    .line 425
    .local v0, "newSocket":Z
    invoke-virtual {v6, v14}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->getSocket(Ljava/lang/String;)Ljava/nio/channels/SocketChannel;

    move-result-object v1

    .line 426
    .local v1, "clientSock":Ljava/nio/channels/SocketChannel;
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v2

    if-nez v2, :cond_4

    :cond_3
    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isConnectionPending()Z

    move-result v2

    if-nez v2, :cond_4

    .line 428
    const/4 v1, 0x0

    move-object v15, v1

    goto :goto_1

    .line 430
    :cond_4
    move-object v15, v1

    .end local v1    # "clientSock":Ljava/nio/channels/SocketChannel;
    .local v15, "clientSock":Ljava/nio/channels/SocketChannel;
    :goto_1
    if-nez v15, :cond_5

    .line 431
    const/16 v16, 0x1

    .line 432
    .end local v0    # "newSocket":Z
    .local v16, "newSocket":Z
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p6

    move-object v5, v14

    invoke-direct/range {v0 .. v5}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->openOutgoingConnection(Ljava/net/InetAddress;Ljava/net/InetAddress;IZLjava/lang/String;)Ljava/nio/channels/SocketChannel;

    move-result-object v15

    .line 433
    iput v8, v10, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->peerPort:I

    move/from16 v0, v16

    .line 436
    .end local v16    # "newSocket":Z
    .restart local v0    # "newSocket":Z
    :cond_5
    if-eqz v15, :cond_7

    .line 437
    if-eqz v0, :cond_6

    instance-of v1, v10, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    if-eqz v1, :cond_6

    .line 440
    new-instance v1, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-object v2, v10

    check-cast v2, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-direct {v1, v2, v15}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;Ljava/nio/channels/SocketChannel;)V

    .line 441
    .local v1, "listner":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    move-object v2, v10

    check-cast v2, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v2, v1}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->setHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 443
    .end local v1    # "listner":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    goto :goto_2

    .line 444
    :cond_6
    invoke-direct {v6, v15, v9, v11}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->writeChunks(Ljava/nio/channels/SocketChannel;[BI)V

    .line 448
    :cond_7
    :goto_2
    if-nez v15, :cond_9

    .line 450
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    const-string v2, ":"

    const-string v3, "Could not connect to "

    if-eqz v1, :cond_8

    .line 451
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    iget-object v4, v6, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 453
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 458
    :cond_8
    new-instance v1, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 461
    :cond_9
    return-object v15
.end method

.method public stop()V
    .locals 8

    .line 487
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->stopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 490
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 491
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "keys to check for inactivity removal "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 492
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "existing socket in NIOHandler "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 494
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 495
    .local v0, "entriesIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;>;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 496
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 497
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/channels/SocketChannel;

    .line 498
    .local v3, "socketChannel":Ljava/nio/channels/SocketChannel;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    .line 500
    .local v4, "messageChannel":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    sget-object v5, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 501
    sget-object v5, Landroid/gov/nist/javax/sip/stack/NIOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "stop() : Removing socket "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->key:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " socketChannel = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 504
    :cond_1
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->close()V

    .line 505
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 506
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NIOHandler;->channelMap:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v5

    .line 507
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;>;"
    .end local v3    # "socketChannel":Ljava/nio/channels/SocketChannel;
    .end local v4    # "messageChannel":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    goto :goto_0

    .line 510
    .end local v0    # "entriesIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;>;>;"
    :cond_2
    goto :goto_1

    .line 508
    :catch_0
    move-exception v0

    .line 511
    :goto_1
    return-void
.end method
