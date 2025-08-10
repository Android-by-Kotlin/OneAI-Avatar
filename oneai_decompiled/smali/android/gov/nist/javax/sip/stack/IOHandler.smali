.class public Landroid/gov/nist/javax/sip/stack/IOHandler;
.super Ljava/lang/Object;
.source "IOHandler.java"


# static fields
.field private static final TCP:Ljava/lang/String; = "tcp"

.field private static final TLS:Ljava/lang/String; = "tls"

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

.field private final socketCreationMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/Semaphore;",
            ">;"
        }
    .end annotation
.end field

.field private final socketTable:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 65
    const-class v0, Landroid/gov/nist/javax/sip/stack/IOHandler;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    .locals 1
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 78
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketCreationMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 92
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 93
    return-void
.end method

.method private enterIOCriticalSection(Ljava/lang/String;)V
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 530
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketCreationMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Semaphore;

    .line 531
    .local v0, "creationSemaphore":Ljava/util/concurrent/Semaphore;
    if-nez v0, :cond_0

    .line 532
    new-instance v1, Ljava/util/concurrent/Semaphore;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    .line 533
    .local v1, "newCreationSemaphore":Ljava/util/concurrent/Semaphore;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketCreationMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/util/concurrent/Semaphore;

    .line 534
    if-nez v0, :cond_0

    .line 535
    move-object v0, v1

    .line 536
    sget-object v2, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 537
    sget-object v2, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "new Semaphore added for key "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 543
    .end local v1    # "newCreationSemaphore":Ljava/util/concurrent/Semaphore;
    :cond_0
    :try_start_0
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0xa

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    .line 544
    .local v1, "retval":Z
    if-eqz v1, :cond_1

    .line 550
    .end local v1    # "retval":Z
    nop

    .line 551
    return-void

    .line 545
    .restart local v1    # "retval":Z
    :cond_1
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not acquire IO Semaphore\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' after 10 seconds -- giving up "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "creationSemaphore":Ljava/util/concurrent/Semaphore;
    .end local p1    # "key":Ljava/lang/String;
    throw v2
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 548
    .end local v1    # "retval":Z
    .restart local v0    # "creationSemaphore":Ljava/util/concurrent/Semaphore;
    .restart local p1    # "key":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 549
    .local v1, "e":Ljava/lang/InterruptedException;
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "exception in acquiring sem"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private leaveIOCriticalSection(Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 522
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketCreationMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Semaphore;

    .line 523
    .local v0, "creationSemaphore":Ljava/util/concurrent/Semaphore;
    if-eqz v0, :cond_0

    .line 524
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 526
    :cond_0
    return-void
.end method

.method protected static makeKey(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "addr"    # Ljava/lang/String;
    .param p1, "port"    # I

    .line 88
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

    .line 83
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

.method private writeChunks(Ljava/io/OutputStream;[BI)V
    .locals 3
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .param p2, "bytes"    # [B
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    monitor-enter p1

    .line 129
    const/16 v0, 0x2000

    .line 130
    .local v0, "chunksize":I
    const/4 v1, 0x0

    .local v1, "p":I
    :goto_0
    if-ge v1, p3, :cond_1

    .line 131
    add-int v2, v1, v0

    if-ge v2, p3, :cond_0

    move v2, v0

    goto :goto_1

    :cond_0
    sub-int v2, p3, v1

    .line 132
    .local v2, "chunk":I
    :goto_1
    :try_start_0
    invoke-virtual {p1, p2, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 130
    .end local v2    # "chunk":I
    add-int/2addr v1, v0

    goto :goto_0

    .line 134
    .end local v0    # "chunksize":I
    .end local v1    # "p":I
    :cond_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 136
    return-void

    .line 134
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public closeAll()V
    .locals 3

    .line 557
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 558
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Closing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

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

    .line 562
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 563
    .local v0, "values":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/Socket;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 564
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/Socket;

    .line 566
    .local v1, "s":Ljava/net/Socket;
    :try_start_0
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 568
    goto :goto_1

    .line 567
    :catch_0
    move-exception v2

    .line 569
    .end local v1    # "s":Ljava/net/Socket;
    :goto_1
    goto :goto_0

    .line 571
    .end local v0    # "values":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/Socket;>;"
    :cond_1
    return-void
.end method

.method public getLocalAddressForTcpDst(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/SocketAddress;
    .locals 3
    .param p1, "dst"    # Ljava/net/InetAddress;
    .param p2, "dstPort"    # I
    .param p3, "localAddress"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 161
    invoke-static {p1, p2}, Landroid/gov/nist/javax/sip/stack/IOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v0

    .line 163
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/IOHandler;->getSocket(Ljava/lang/String;)Ljava/net/Socket;

    move-result-object v1

    .line 165
    .local v1, "clientSock":Ljava/net/Socket;
    if-nez v1, :cond_0

    .line 166
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->getNetworkLayer()Landroid/gov/nist/core/net/NetworkLayer;

    move-result-object v2

    invoke-interface {v2, p1, p2, p3, p4}, Landroid/gov/nist/core/net/NetworkLayer;->createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v1

    .line 168
    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/stack/IOHandler;->putSocket(Ljava/lang/String;Ljava/net/Socket;)V

    .line 171
    :cond_0
    invoke-virtual {v1}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v2

    return-object v2
.end method

.method public getLocalAddressForTlsDst(Ljava/net/InetAddress;ILjava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;)Ljava/net/SocketAddress;
    .locals 7
    .param p1, "dst"    # Ljava/net/InetAddress;
    .param p2, "dstPort"    # I
    .param p3, "localAddress"    # Ljava/net/InetAddress;
    .param p4, "channel"    # Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 196
    invoke-static {p1, p2}, Landroid/gov/nist/javax/sip/stack/IOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v0

    .line 198
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/IOHandler;->getSocket(Ljava/lang/String;)Ljava/net/Socket;

    move-result-object v1

    .line 200
    .local v1, "clientSock":Ljava/net/Socket;
    if-nez v1, :cond_3

    .line 202
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->getNetworkLayer()Landroid/gov/nist/core/net/NetworkLayer;

    move-result-object v2

    invoke-interface {v2, p1, p2, p3}, Landroid/gov/nist/core/net/NetworkLayer;->createSSLSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;)Ljavax/net/ssl/SSLSocket;

    move-result-object v1

    .line 205
    move-object v2, v1

    check-cast v2, Ljavax/net/ssl/SSLSocket;

    .line 207
    .local v2, "sslsock":Ljavax/net/ssl/SSLSocket;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 208
    sget-object v3, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "inaddr = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 210
    sget-object v3, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "port = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 214
    :cond_0
    new-instance v3, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    invoke-direct {v3, p4, v2}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;-><init>(Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;Ljava/net/Socket;)V

    .line 217
    .local v3, "listner":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    invoke-virtual {p4, v3}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->setHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 218
    invoke-virtual {v2, v3}, Ljavax/net/ssl/SSLSocket;->addHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 219
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipStackImpl;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 220
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipStackImpl;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 222
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->startHandshakeWatchdog()V

    .line 223
    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 224
    const/4 v5, 0x1

    invoke-virtual {p4, v5}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->setHandshakeCompleted(Z)V

    .line 225
    sget-object v5, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 226
    sget-object v5, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v6, "Handshake passed"

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 233
    :cond_1
    :try_start_0
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipStackImpl;->getTlsSecurityPolicy()Landroid/gov/nist/javax/sip/TlsSecurityPolicy;

    move-result-object v5

    invoke-virtual {p4}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getEncapsulatedClientTransaction()Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/javax/sip/TlsSecurityPolicy;->enforceTlsPolicy(Landroid/gov/nist/javax/sip/ClientTransactionExt;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    nop

    .line 240
    sget-object v5, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 241
    sget-object v4, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v5, "TLS Security policy passed"

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 245
    :cond_2
    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/stack/IOHandler;->putSocket(Ljava/lang/String;Ljava/net/Socket;)V

    goto :goto_0

    .line 236
    :catch_0
    move-exception v4

    .line 237
    .local v4, "ex":Ljava/lang/SecurityException;
    new-instance v5, Ljava/io/IOException;

    invoke-virtual {v4}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 248
    .end local v2    # "sslsock":Ljavax/net/ssl/SSLSocket;
    .end local v3    # "listner":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    .end local v4    # "ex":Ljava/lang/SecurityException;
    :cond_3
    :goto_0
    invoke-virtual {v1}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v2

    return-object v2
.end method

.method protected getSocket(Ljava/lang/String;)Ljava/net/Socket;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 103
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    return-object v0
.end method

.method protected putSocket(Ljava/lang/String;Ljava/net/Socket;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "sock"    # Ljava/net/Socket;

    .line 96
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "adding socket for key "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 99
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    return-void
.end method

.method protected removeSocket(Ljava/lang/String;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .line 108
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketCreationMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Semaphore;

    .line 110
    .local v0, "s":Ljava/util/concurrent/Semaphore;
    if-eqz v0, :cond_0

    .line 111
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 113
    :cond_0
    sget-object v1, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 114
    sget-object v1, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "removed Socket and Semaphore for key "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 116
    :cond_1
    return-void
.end method

.method public sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/MessageChannel;)Ljava/net/Socket;
    .locals 26
    .param p1, "senderAddress"    # Ljava/net/InetAddress;
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "contactPort"    # I
    .param p4, "transport"    # Ljava/lang/String;
    .param p5, "bytes"    # [B
    .param p6, "isClient"    # Z
    .param p7, "messageChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 270
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v9, p2

    move/from16 v10, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    move/from16 v13, p6

    const-string/jumbo v3, "UTF-8"

    const-string v4, " for message "

    const-string v5, " "

    const/4 v14, 0x0

    .line 271
    .local v14, "retry_count":I
    if-eqz v13, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    move v15, v0

    .line 273
    .local v15, "max_retry":I
    array-length v8, v12

    .line 274
    .local v8, "length":I
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v7, 0x20

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    const-string v6, " isClient "

    const-string v7, " port = "

    if-eqz v0, :cond_1

    .line 275
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    move/from16 v18, v14

    .end local v14    # "retry_count":I
    .local v18, "retry_count":I
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v19, v3

    const-string/jumbo v3, "sendBytes "

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v14, " local inAddr "

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v14, " remote inAddr "

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p2 .. p2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v14, " length = "

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_1

    .line 274
    .end local v18    # "retry_count":I
    .restart local v14    # "retry_count":I
    :cond_1
    move-object/from16 v19, v3

    move/from16 v18, v14

    .line 282
    .end local v14    # "retry_count":I
    .restart local v18    # "retry_count":I
    :goto_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x10

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isLogStackTraceOnMessageSend()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 284
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logStackTrace(I)V

    .line 286
    :cond_2
    const-string/jumbo v0, "tcp"

    invoke-virtual {v11, v0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    const-string/jumbo v3, "port = "

    const-string/jumbo v14, "inaddr = "

    move-object/from16 v20, v6

    const-string v6, ":"

    move-object/from16 v21, v6

    const-string v6, "Could not connect to "

    if-nez v0, :cond_d

    .line 287
    move-object/from16 v22, v6

    invoke-static/range {p2 .. p3}, Landroid/gov/nist/javax/sip/stack/IOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v6

    .line 291
    .local v6, "key":Ljava/lang/String;
    const/16 v16, 0x0

    .line 292
    .local v16, "clientSock":Ljava/net/Socket;
    invoke-direct {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->enterIOCriticalSection(Ljava/lang/String;)V

    .line 295
    move-object/from16 v23, v7

    :try_start_0
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->getSocket(Ljava/lang/String;)Ljava/net/Socket;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_9
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    move-object/from16 v16, v0

    move/from16 v7, v18

    .line 296
    .end local v18    # "retry_count":I
    .local v7, "retry_count":I
    :goto_2
    if-ge v7, v15, :cond_9

    .line 297
    if-nez v16, :cond_5

    .line 298
    :try_start_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v11, 0x20

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eqz v0, :cond_3

    .line 299
    :try_start_2
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 301
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 311
    :cond_3
    :try_start_3
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getNetworkLayer()Landroid/gov/nist/core/net/NetworkLayer;

    move-result-object v0

    invoke-interface {v0, v9, v10, v2}, Landroid/gov/nist/core/net/NetworkLayer;->createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;)Ljava/net/Socket;

    move-result-object v0
    :try_end_3
    .catch Ljava/net/SocketException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v3, v0

    .line 321
    .end local v16    # "clientSock":Ljava/net/Socket;
    .local v3, "clientSock":Ljava/net/Socket;
    nop

    .line 322
    :try_start_4
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 323
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "local inaddr = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 325
    :cond_4
    invoke-virtual {v3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 327
    .local v0, "outputStream":Ljava/io/OutputStream;
    invoke-direct {v1, v0, v12, v8}, Landroid/gov/nist/javax/sip/stack/IOHandler;->writeChunks(Ljava/io/OutputStream;[BI)V

    .line 328
    invoke-virtual {v1, v6, v3}, Landroid/gov/nist/javax/sip/stack/IOHandler;->putSocket(Ljava/lang/String;Ljava/net/Socket;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 329
    move-object/from16 v16, v3

    move v5, v15

    goto/16 :goto_6

    .line 378
    .end local v0    # "outputStream":Ljava/io/OutputStream;
    :catchall_0
    move-exception v0

    move-object/from16 v11, p4

    move-object/from16 v16, v3

    move v14, v7

    move v5, v15

    goto/16 :goto_b

    .line 364
    :catch_0
    move-exception v0

    move-object/from16 v16, v3

    move v14, v7

    move v5, v15

    goto/16 :goto_7

    .line 378
    .end local v3    # "clientSock":Ljava/net/Socket;
    .restart local v16    # "clientSock":Ljava/net/Socket;
    :catchall_1
    move-exception v0

    move-object/from16 v11, p4

    move v14, v7

    move v5, v15

    goto/16 :goto_b

    .line 364
    :catch_1
    move-exception v0

    move v14, v7

    move v5, v15

    goto/16 :goto_7

    .line 313
    :catch_2
    move-exception v0

    .line 314
    .local v0, "e":Ljava/net/SocketException;
    :try_start_5
    sget-object v3, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Problem connecting "

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    new-instance v14, Ljava/lang/String;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move/from16 v24, v15

    move-object/from16 v15, v19

    .end local v15    # "max_retry":I
    .local v24, "max_retry":I
    :try_start_6
    invoke-direct {v14, v12, v15}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3, v11}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 318
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->removeSocket(Ljava/lang/String;)V

    .line 319
    new-instance v3, Ljava/net/SocketException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v0}, Ljava/net/SocketException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v0}, Ljava/net/SocketException;->getCause()Ljava/lang/Throwable;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v14, " Problem connecting "

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v12, v15}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "retry_count":I
    .end local v8    # "length":I
    .end local v16    # "clientSock":Ljava/net/Socket;
    .end local v24    # "max_retry":I
    .end local p1    # "senderAddress":Ljava/net/InetAddress;
    .end local p2    # "receiverAddress":Ljava/net/InetAddress;
    .end local p3    # "contactPort":I
    .end local p4    # "transport":Ljava/lang/String;
    .end local p5    # "bytes":[B
    .end local p6    # "isClient":Z
    .end local p7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    throw v3
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 378
    .end local v0    # "e":Ljava/net/SocketException;
    .restart local v6    # "key":Ljava/lang/String;
    .restart local v7    # "retry_count":I
    .restart local v8    # "length":I
    .restart local v15    # "max_retry":I
    .restart local v16    # "clientSock":Ljava/net/Socket;
    .restart local p1    # "senderAddress":Ljava/net/InetAddress;
    .restart local p2    # "receiverAddress":Ljava/net/InetAddress;
    .restart local p3    # "contactPort":I
    .restart local p4    # "transport":Ljava/lang/String;
    .restart local p5    # "bytes":[B
    .restart local p6    # "isClient":Z
    .restart local p7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :catchall_2
    move-exception v0

    move/from16 v24, v15

    move-object/from16 v11, p4

    move v14, v7

    move/from16 v5, v24

    .end local v15    # "max_retry":I
    .restart local v24    # "max_retry":I
    goto/16 :goto_b

    .line 364
    .end local v24    # "max_retry":I
    .restart local v15    # "max_retry":I
    :catch_3
    move-exception v0

    move/from16 v24, v15

    move v14, v7

    move/from16 v5, v24

    .end local v15    # "max_retry":I
    .restart local v24    # "max_retry":I
    goto/16 :goto_7

    .line 332
    .end local v24    # "max_retry":I
    .restart local v15    # "max_retry":I
    :cond_5
    move/from16 v24, v15

    move-object/from16 v15, v19

    .end local v15    # "max_retry":I
    .restart local v24    # "max_retry":I
    :try_start_7
    invoke-virtual/range {v16 .. v16}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 334
    .local v0, "outputStream":Ljava/io/OutputStream;
    invoke-direct {v1, v0, v12, v8}, Landroid/gov/nist/javax/sip/stack/IOHandler;->writeChunks(Ljava/io/OutputStream;[BI)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 335
    move/from16 v5, v24

    goto/16 :goto_6

    .line 378
    .end local v0    # "outputStream":Ljava/io/OutputStream;
    :catchall_3
    move-exception v0

    move-object/from16 v11, p4

    move v14, v7

    move/from16 v5, v24

    goto/16 :goto_b

    .line 336
    :catch_4
    move-exception v0

    move-object v11, v0

    .line 337
    .local v11, "ex":Ljava/io/IOException;
    :try_start_8
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    move-object/from16 v19, v4

    const/16 v4, 0x8

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    if-eqz v0, :cond_6

    .line 339
    :try_start_9
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v25, v5

    const-string v5, "IOException occured retryCount "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_3

    .line 337
    :cond_6
    move-object/from16 v25, v5

    .line 343
    :goto_3
    :try_start_a
    invoke-virtual/range {v16 .. v16}, Ljava/net/Socket;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_6
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 345
    goto :goto_4

    .line 364
    .end local v11    # "ex":Ljava/io/IOException;
    :catch_5
    move-exception v0

    move v14, v7

    move/from16 v5, v24

    goto :goto_7

    .line 344
    .restart local v11    # "ex":Ljava/io/IOException;
    :catch_6
    move-exception v0

    .line 346
    :goto_4
    const/16 v16, 0x0

    .line 347
    add-int/lit8 v7, v7, 0x1

    .line 349
    if-eqz v13, :cond_8

    .line 353
    move/from16 v5, v24

    .end local v24    # "max_retry":I
    .local v5, "max_retry":I
    if-lt v7, v5, :cond_7

    .line 356
    :try_start_b
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->removeSocket(Ljava/lang/String;)V

    goto :goto_5

    .line 359
    :cond_7
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, v6}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    .end local v11    # "ex":Ljava/io/IOException;
    :goto_5
    move-object/from16 v11, p4

    move-object/from16 v4, v19

    move-object/from16 v19, v15

    move v15, v5

    move-object/from16 v5, v25

    goto/16 :goto_2

    .line 350
    .end local v5    # "max_retry":I
    .restart local v11    # "ex":Ljava/io/IOException;
    .restart local v24    # "max_retry":I
    :cond_8
    move/from16 v5, v24

    .end local v24    # "max_retry":I
    .restart local v5    # "max_retry":I
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->removeSocket(Ljava/lang/String;)V

    .line 351
    nop

    .end local v5    # "max_retry":I
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "retry_count":I
    .end local v8    # "length":I
    .end local v16    # "clientSock":Ljava/net/Socket;
    .end local p1    # "senderAddress":Ljava/net/InetAddress;
    .end local p2    # "receiverAddress":Ljava/net/InetAddress;
    .end local p3    # "contactPort":I
    .end local p4    # "transport":Ljava/lang/String;
    .end local p5    # "bytes":[B
    .end local p6    # "isClient":Z
    .end local p7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    throw v11
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_7
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 378
    .end local v11    # "ex":Ljava/io/IOException;
    .restart local v5    # "max_retry":I
    .restart local v6    # "key":Ljava/lang/String;
    .restart local v7    # "retry_count":I
    .restart local v8    # "length":I
    .restart local v16    # "clientSock":Ljava/net/Socket;
    .restart local p1    # "senderAddress":Ljava/net/InetAddress;
    .restart local p2    # "receiverAddress":Ljava/net/InetAddress;
    .restart local p3    # "contactPort":I
    .restart local p4    # "transport":Ljava/lang/String;
    .restart local p5    # "bytes":[B
    .restart local p6    # "isClient":Z
    .restart local p7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :catchall_4
    move-exception v0

    move-object/from16 v11, p4

    move v14, v7

    goto/16 :goto_b

    .line 364
    :catch_7
    move-exception v0

    move v14, v7

    goto :goto_7

    .line 378
    .end local v5    # "max_retry":I
    .restart local v24    # "max_retry":I
    :catchall_5
    move-exception v0

    move/from16 v5, v24

    move-object/from16 v11, p4

    move v14, v7

    .end local v24    # "max_retry":I
    .restart local v5    # "max_retry":I
    goto/16 :goto_b

    .line 364
    .end local v5    # "max_retry":I
    .restart local v24    # "max_retry":I
    :catch_8
    move-exception v0

    move/from16 v5, v24

    move v14, v7

    .end local v24    # "max_retry":I
    .restart local v5    # "max_retry":I
    goto :goto_7

    .line 296
    .end local v5    # "max_retry":I
    .restart local v15    # "max_retry":I
    :cond_9
    move v5, v15

    .line 378
    .end local v15    # "max_retry":I
    .restart local v5    # "max_retry":I
    :goto_6
    invoke-direct {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->leaveIOCriticalSection(Ljava/lang/String;)V

    .line 379
    move-object/from16 v11, p4

    goto/16 :goto_9

    .line 378
    .end local v5    # "max_retry":I
    .end local v7    # "retry_count":I
    .restart local v15    # "max_retry":I
    .restart local v18    # "retry_count":I
    :catchall_6
    move-exception v0

    move v5, v15

    move-object/from16 v11, p4

    move/from16 v14, v18

    .end local v15    # "max_retry":I
    .restart local v5    # "max_retry":I
    goto/16 :goto_b

    .line 364
    .end local v5    # "max_retry":I
    .restart local v15    # "max_retry":I
    :catch_9
    move-exception v0

    move v5, v15

    move/from16 v14, v18

    .line 365
    .end local v15    # "max_retry":I
    .end local v18    # "retry_count":I
    .local v0, "ex":Ljava/io/IOException;
    .restart local v5    # "max_retry":I
    .restart local v14    # "retry_count":I
    :goto_7
    :try_start_c
    sget-object v3, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v4, 0x4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 366
    sget-object v3, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Problem sending: sendBytes "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_8

    move-object/from16 v11, p4

    :try_start_d
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " inAddr "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v7, v23

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " remoteHost "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p7 .. p7}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " remotePort "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p7 .. p7}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerPort()I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " peerPacketPort "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p7 .. p7}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerPacketSourcePort()I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v7, v20

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    goto :goto_8

    .line 365
    :cond_a
    move-object/from16 v11, p4

    .line 376
    :goto_8
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->removeSocket(Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 378
    .end local v0    # "ex":Ljava/io/IOException;
    invoke-direct {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->leaveIOCriticalSection(Ljava/lang/String;)V

    .line 379
    move v7, v14

    .line 381
    .end local v14    # "retry_count":I
    .restart local v7    # "retry_count":I
    :goto_9
    if-nez v16, :cond_c

    .line 383
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v3, 0x4

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 384
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    iget-object v3, v1, Landroid/gov/nist/javax/sip/stack/IOHandler;->socketTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 386
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v4, v22

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v15, v21

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    goto :goto_a

    .line 383
    :cond_b
    move-object/from16 v15, v21

    move-object/from16 v4, v22

    .line 391
    :goto_a
    new-instance v0, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 394
    :cond_c
    return-object v16

    .line 378
    .end local v7    # "retry_count":I
    .restart local v14    # "retry_count":I
    :catchall_7
    move-exception v0

    goto :goto_b

    :catchall_8
    move-exception v0

    move-object/from16 v11, p4

    :goto_b
    invoke-direct {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->leaveIOCriticalSection(Ljava/lang/String;)V

    throw v0

    .line 399
    .end local v5    # "max_retry":I
    .end local v6    # "key":Ljava/lang/String;
    .end local v14    # "retry_count":I
    .end local v16    # "clientSock":Ljava/net/Socket;
    .restart local v15    # "max_retry":I
    .restart local v18    # "retry_count":I
    :cond_d
    move-object v4, v6

    move v5, v15

    move-object/from16 v15, v21

    .end local v15    # "max_retry":I
    .restart local v5    # "max_retry":I
    const-string/jumbo v0, "tls"

    invoke-virtual {v11, v0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_15

    .line 400
    invoke-static/range {p2 .. p3}, Landroid/gov/nist/javax/sip/stack/IOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v6

    .line 401
    .restart local v6    # "key":Ljava/lang/String;
    const/4 v7, 0x0

    .line 402
    .local v7, "clientSock":Ljava/net/Socket;
    invoke-direct {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->enterIOCriticalSection(Ljava/lang/String;)V

    .line 405
    :try_start_e
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->getSocket(Ljava/lang/String;)Ljava/net/Socket;

    move-result-object v0
    :try_end_e
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_e .. :try_end_e} :catch_11
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_10
    .catchall {:try_start_e .. :try_end_e} :catchall_a

    move-object v7, v0

    move/from16 v11, v18

    .line 407
    .end local v18    # "retry_count":I
    .local v11, "retry_count":I
    :goto_c
    if-ge v11, v5, :cond_13

    .line 408
    if-nez v7, :cond_11

    .line 410
    :try_start_f
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getNetworkLayer()Landroid/gov/nist/core/net/NetworkLayer;

    move-result-object v0

    invoke-interface {v0, v9, v10, v2}, Landroid/gov/nist/core/net/NetworkLayer;->createSSLSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;)Ljavax/net/ssl/SSLSocket;

    move-result-object v0

    move-object v7, v0

    .line 413
    move-object v0, v7

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    move-object/from16 v18, v0

    .line 415
    .local v18, "sslsock":Ljavax/net/ssl/SSLSocket;
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 416
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 418
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 421
    :cond_e
    new-instance v0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-object/from16 v2, p7

    check-cast v2, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-direct {v0, v2, v7}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;-><init>(Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;Ljava/net/Socket;)V

    move-object v2, v0

    .line 422
    .local v2, "listner":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    move-object/from16 v0, p7

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->setHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 424
    move-object/from16 v3, v18

    .end local v18    # "sslsock":Ljavax/net/ssl/SSLSocket;
    .local v3, "sslsock":Ljavax/net/ssl/SSLSocket;
    invoke-virtual {v3, v2}, Ljavax/net/ssl/SSLSocket;->addHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 425
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 428
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->startHandshakeWatchdog()V

    .line 429
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 430
    move-object/from16 v0, p7

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    const/4 v14, 0x1

    invoke-virtual {v0, v14}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->setHandshakeCompleted(Z)V

    .line 431
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v14, 0x20

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 432
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v14, "Handshake passed"

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_f
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_f .. :try_end_f} :catch_c
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_b
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    .line 439
    :cond_f
    :try_start_10
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getTlsSecurityPolicy()Landroid/gov/nist/javax/sip/TlsSecurityPolicy;

    move-result-object v0

    invoke-virtual/range {p7 .. p7}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getEncapsulatedClientTransaction()Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v14

    invoke-interface {v0, v14}, Landroid/gov/nist/javax/sip/TlsSecurityPolicy;->enforceTlsPolicy(Landroid/gov/nist/javax/sip/ClientTransactionExt;)V
    :try_end_10
    .catch Ljava/lang/SecurityException; {:try_start_10 .. :try_end_10} :catch_a
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_10 .. :try_end_10} :catch_c
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_b
    .catchall {:try_start_10 .. :try_end_10} :catchall_9

    .line 446
    nop

    .line 448
    :try_start_11
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v14, 0x20

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 449
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v14, "TLS Security policy passed"

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 452
    :cond_10
    invoke-virtual {v7}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 454
    .local v0, "outputStream":Ljava/io/OutputStream;
    invoke-direct {v1, v0, v12, v8}, Landroid/gov/nist/javax/sip/stack/IOHandler;->writeChunks(Ljava/io/OutputStream;[BI)V

    .line 455
    invoke-virtual {v1, v6, v7}, Landroid/gov/nist/javax/sip/stack/IOHandler;->putSocket(Ljava/lang/String;Ljava/net/Socket;)V

    .line 456
    goto :goto_f

    .line 444
    .end local v0    # "outputStream":Ljava/io/OutputStream;
    :catch_a
    move-exception v0

    .line 445
    .local v0, "ex":Ljava/lang/SecurityException;
    new-instance v14, Ljava/io/IOException;

    move-object/from16 v16, v2

    .end local v2    # "listner":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    .local v16, "listner":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    invoke-virtual {v0}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v14, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v5    # "max_retry":I
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "clientSock":Ljava/net/Socket;
    .end local v8    # "length":I
    .end local v11    # "retry_count":I
    .end local p1    # "senderAddress":Ljava/net/InetAddress;
    .end local p2    # "receiverAddress":Ljava/net/InetAddress;
    .end local p3    # "contactPort":I
    .end local p4    # "transport":Ljava/lang/String;
    .end local p5    # "bytes":[B
    .end local p6    # "isClient":Z
    .end local p7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    throw v14
    :try_end_11
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_11 .. :try_end_11} :catch_c
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_b
    .catchall {:try_start_11 .. :try_end_11} :catchall_9

    .line 484
    .end local v0    # "ex":Ljava/lang/SecurityException;
    .end local v3    # "sslsock":Ljavax/net/ssl/SSLSocket;
    .end local v16    # "listner":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    .restart local v5    # "max_retry":I
    .restart local v6    # "key":Ljava/lang/String;
    .restart local v7    # "clientSock":Ljava/net/Socket;
    .restart local v8    # "length":I
    .restart local v11    # "retry_count":I
    .restart local p1    # "senderAddress":Ljava/net/InetAddress;
    .restart local p2    # "receiverAddress":Ljava/net/InetAddress;
    .restart local p3    # "contactPort":I
    .restart local p4    # "transport":Ljava/lang/String;
    .restart local p5    # "bytes":[B
    .restart local p6    # "isClient":Z
    .restart local p7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :catch_b
    move-exception v0

    move v14, v11

    goto :goto_10

    .line 459
    :cond_11
    const/4 v2, 0x1

    const/16 v16, 0x20

    :try_start_12
    invoke-virtual {v7}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 461
    .local v0, "outputStream":Ljava/io/OutputStream;
    invoke-direct {v1, v0, v12, v8}, Landroid/gov/nist/javax/sip/stack/IOHandler;->writeChunks(Ljava/io/OutputStream;[BI)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_d
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_12 .. :try_end_12} :catch_c
    .catchall {:try_start_12 .. :try_end_12} :catchall_9

    .line 462
    goto :goto_f

    .line 487
    .end local v0    # "outputStream":Ljava/io/OutputStream;
    :catchall_9
    move-exception v0

    move v14, v11

    goto/16 :goto_13

    .line 481
    :catch_c
    move-exception v0

    move v14, v11

    goto/16 :goto_12

    .line 463
    :catch_d
    move-exception v0

    move-object/from16 v17, v0

    .line 464
    .local v17, "ex":Ljava/io/IOException;
    :try_start_13
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 465
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;

    move-object/from16 v2, v17

    .end local v17    # "ex":Ljava/io/IOException;
    .local v2, "ex":Ljava/io/IOException;
    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    goto :goto_d

    .line 464
    .end local v2    # "ex":Ljava/io/IOException;
    .restart local v17    # "ex":Ljava/io/IOException;
    :cond_12
    move-object/from16 v2, v17

    .line 468
    .end local v17    # "ex":Ljava/io/IOException;
    .restart local v2    # "ex":Ljava/io/IOException;
    :goto_d
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->removeSocket(Ljava/lang/String;)V
    :try_end_13
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_13 .. :try_end_13} :catch_c
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_b
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    .line 471
    :try_start_14
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IOHandler;->logger:Landroid/gov/nist/core/StackLogger;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_f
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_14 .. :try_end_14} :catch_c
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_b
    .catchall {:try_start_14 .. :try_end_14} :catchall_9

    move-object/from16 v17, v2

    .end local v2    # "ex":Ljava/io/IOException;
    .restart local v17    # "ex":Ljava/io/IOException;
    :try_start_15
    const-string v2, "Closing socket"

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 473
    invoke-virtual {v7}, Ljava/net/Socket;->close()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_e
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_15 .. :try_end_15} :catch_c
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_b
    .catchall {:try_start_15 .. :try_end_15} :catchall_9

    .line 475
    goto :goto_e

    .line 474
    :catch_e
    move-exception v0

    goto :goto_e

    .end local v17    # "ex":Ljava/io/IOException;
    .restart local v2    # "ex":Ljava/io/IOException;
    :catch_f
    move-exception v0

    move-object/from16 v17, v2

    .line 476
    .end local v2    # "ex":Ljava/io/IOException;
    .restart local v17    # "ex":Ljava/io/IOException;
    :goto_e
    const/4 v7, 0x0

    .line 477
    nop

    .end local v17    # "ex":Ljava/io/IOException;
    add-int/lit8 v11, v11, 0x1

    .line 478
    move-object/from16 v2, p1

    goto/16 :goto_c

    .line 487
    :cond_13
    :goto_f
    invoke-direct {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->leaveIOCriticalSection(Ljava/lang/String;)V

    .line 488
    goto :goto_11

    .line 487
    .end local v11    # "retry_count":I
    .local v18, "retry_count":I
    :catchall_a
    move-exception v0

    move/from16 v14, v18

    goto :goto_13

    .line 484
    :catch_10
    move-exception v0

    move/from16 v14, v18

    .line 485
    .end local v18    # "retry_count":I
    .local v0, "ex":Ljava/io/IOException;
    .restart local v14    # "retry_count":I
    :goto_10
    :try_start_16
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->removeSocket(Ljava/lang/String;)V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_b

    .line 487
    .end local v0    # "ex":Ljava/io/IOException;
    invoke-direct {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->leaveIOCriticalSection(Ljava/lang/String;)V

    .line 488
    move v11, v14

    .line 489
    .end local v14    # "retry_count":I
    .restart local v11    # "retry_count":I
    :goto_11
    if-eqz v7, :cond_14

    .line 493
    return-object v7

    .line 490
    :cond_14
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 481
    .end local v11    # "retry_count":I
    .restart local v18    # "retry_count":I
    :catch_11
    move-exception v0

    move/from16 v14, v18

    .line 482
    .end local v18    # "retry_count":I
    .local v0, "ex":Ljavax/net/ssl/SSLHandshakeException;
    .restart local v14    # "retry_count":I
    :goto_12
    :try_start_17
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->removeSocket(Ljava/lang/String;)V

    .line 483
    nop

    .end local v5    # "max_retry":I
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "clientSock":Ljava/net/Socket;
    .end local v8    # "length":I
    .end local v14    # "retry_count":I
    .end local p1    # "senderAddress":Ljava/net/InetAddress;
    .end local p2    # "receiverAddress":Ljava/net/InetAddress;
    .end local p3    # "contactPort":I
    .end local p4    # "transport":Ljava/lang/String;
    .end local p5    # "bytes":[B
    .end local p6    # "isClient":Z
    .end local p7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    throw v0
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_b

    .line 487
    .end local v0    # "ex":Ljavax/net/ssl/SSLHandshakeException;
    .restart local v5    # "max_retry":I
    .restart local v6    # "key":Ljava/lang/String;
    .restart local v7    # "clientSock":Ljava/net/Socket;
    .restart local v8    # "length":I
    .restart local v14    # "retry_count":I
    .restart local p1    # "senderAddress":Ljava/net/InetAddress;
    .restart local p2    # "receiverAddress":Ljava/net/InetAddress;
    .restart local p3    # "contactPort":I
    .restart local p4    # "transport":Ljava/lang/String;
    .restart local p5    # "bytes":[B
    .restart local p6    # "isClient":Z
    .restart local p7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :catchall_b
    move-exception v0

    :goto_13
    invoke-direct {v1, v6}, Landroid/gov/nist/javax/sip/stack/IOHandler;->leaveIOCriticalSection(Ljava/lang/String;)V

    throw v0

    .line 497
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "clientSock":Ljava/net/Socket;
    .end local v14    # "retry_count":I
    .restart local v18    # "retry_count":I
    :cond_15
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/IOHandler;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getNetworkLayer()Landroid/gov/nist/core/net/NetworkLayer;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/core/net/NetworkLayer;->createDatagramSocket()Ljava/net/DatagramSocket;

    move-result-object v0

    .line 499
    .local v0, "datagramSock":Ljava/net/DatagramSocket;
    invoke-virtual {v0, v9, v10}, Ljava/net/DatagramSocket;->connect(Ljava/net/InetAddress;I)V

    .line 500
    new-instance v2, Ljava/net/DatagramPacket;

    const/4 v6, 0x0

    move-object v3, v2

    move-object/from16 v4, p5

    move v11, v5

    .end local v5    # "max_retry":I
    .local v11, "max_retry":I
    move v5, v6

    move v6, v8

    move-object/from16 v7, p2

    move v14, v8

    .end local v8    # "length":I
    .local v14, "length":I
    move/from16 v8, p3

    invoke-direct/range {v3 .. v8}, Ljava/net/DatagramPacket;-><init>([BIILjava/net/InetAddress;I)V

    .line 502
    .local v2, "dgPacket":Ljava/net/DatagramPacket;
    invoke-virtual {v0, v2}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 503
    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 504
    const/4 v3, 0x0

    return-object v3
.end method
