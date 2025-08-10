.class public Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
.super Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;
.source "NioTlsWebSocketMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$SSLReconnectedException;
    }
.end annotation


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private appBufferMax:I

.field private netBufferMax:I

.field sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 51
    const-class v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)V
    .locals 3
    .param p1, "stack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "nioTcpMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    .param p3, "socketChannel"    # Ljava/nio/channels/SocketChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)V

    .line 63
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 64
    invoke-virtual {p3}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 66
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->init(Z)V

    .line 67
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->createBuffers()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    nop

    .line 71
    return-void

    .line 68
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Can\'t do TLS init"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V
    .locals 3
    .param p1, "inetAddress"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p4, "nioTcpMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 298
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V

    .line 300
    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->init(Z)V

    .line 301
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->createBuffers()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 304
    nop

    .line 305
    return-void

    .line 302
    :catch_0
    move-exception v0

    .line 303
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Can\'t init the TLS channel"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static synthetic access$001(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;)Ljava/net/InetAddress;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    .line 49
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method static synthetic access$1001(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BLjava/net/InetAddress;IZ)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Ljava/net/InetAddress;
    .param p3, "x3"    # I
    .param p4, "x4"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    invoke-super {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendTCPMessage([BLjava/net/InetAddress;IZ)V

    return-void
.end method

.method static synthetic access$101(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;)I
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    .line 49
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    return v0
.end method

.method static synthetic access$201(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BLjava/net/InetAddress;IZ)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Ljava/net/InetAddress;
    .param p3, "x3"    # I
    .param p4, "x4"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    invoke-super {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendTCPMessage([BLjava/net/InetAddress;IZ)V

    return-void
.end method

.method static synthetic access$300(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;)I
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    .line 49
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->netBufferMax:I

    return v0
.end method

.method static synthetic access$401(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BZ)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    invoke-super {p0, p1, p2}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->sendNonWebSocketMessage([BZ)V

    return-void
.end method

.method static synthetic access$501(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BZ)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    invoke-super {p0, p1, p2}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->sendNonWebSocketMessage([BZ)V

    return-void
.end method

.method static synthetic access$601(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BLjava/net/InetAddress;IZ)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Ljava/net/InetAddress;
    .param p3, "x3"    # I
    .param p4, "x4"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    invoke-super {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendTCPMessage([BLjava/net/InetAddress;IZ)V

    return-void
.end method

.method static synthetic access$701(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BLjava/net/InetAddress;IZ)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Ljava/net/InetAddress;
    .param p3, "x3"    # I
    .param p4, "x4"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    invoke-super {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendTCPMessage([BLjava/net/InetAddress;IZ)V

    return-void
.end method

.method static synthetic access$801(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BLjava/net/InetAddress;IZ)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Ljava/net/InetAddress;
    .param p3, "x3"    # I
    .param p4, "x4"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    invoke-super {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendTCPMessage([BLjava/net/InetAddress;IZ)V

    return-void
.end method

.method static synthetic access$901(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BLjava/net/InetAddress;IZ)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Ljava/net/InetAddress;
    .param p3, "x3"    # I
    .param p4, "x4"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    invoke-super {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->sendMessage([BLjava/net/InetAddress;IZ)V

    return-void
.end method

.method private checkSocketState()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 372
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v0

    if-nez v0, :cond_2

    .line 373
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 374
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Need to reset SSL engine for socket "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 376
    :cond_1
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getUseClientMode()Z

    move-result v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->init(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 380
    goto :goto_0

    .line 377
    :catch_0
    move-exception v0

    .line 378
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Cannot reset SSL engine"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 379
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 382
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_2
    :goto_0
    return-void
.end method

.method private createBuffers()V
    .locals 4

    .line 286
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v0

    .line 287
    .local v0, "session":Ljavax/net/ssl/SSLSession;
    invoke-interface {v0}, Ljavax/net/ssl/SSLSession;->getApplicationBufferSize()I

    move-result v1

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->appBufferMax:I

    .line 288
    invoke-interface {v0}, Ljavax/net/ssl/SSLSession;->getPacketBufferSize()I

    move-result v1

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->netBufferMax:I

    .line 290
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 291
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "appBufferMax="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->appBufferMax:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " netBufferMax="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->netBufferMax:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 293
    :cond_0
    return-void
.end method


# virtual methods
.method protected addBytes([B)V
    .locals 3
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 309
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 310
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adding WSS bytes for decryption "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 312
    :cond_0
    array-length v0, p1

    if-gtz v0, :cond_1

    return-void

    .line 313
    :cond_1
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 314
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->unwrap(Ljava/nio/ByteBuffer;)V

    .line 315
    return-void
.end method

.method public addPlaintextBytes([B)V
    .locals 0
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 391
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->addBytes([B)V

    .line 392
    return-void
.end method

.method public bridge synthetic getEncapsulatedClientTransaction()Landroid/gov/nist/javax/sip/ClientTransactionExt;
    .locals 1

    .line 49
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->getEncapsulatedClientTransaction()Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v0

    return-object v0
.end method

.method public getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;
    .locals 1

    .line 396
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    return-object v0
.end method

.method public bridge synthetic getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1

    .line 49
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;

    move-result-object v0

    return-object v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 349
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->transport:Ljava/lang/String;

    return-object v0
.end method

.method public init(Z)V
    .locals 6
    .param p1, "clientMode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;,
            Ljava/security/cert/CertificateException;,
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;

    if-eqz p1, :cond_0

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sslClientCtx:Ljavax/net/ssl/SSLContext;

    goto :goto_0

    :cond_0
    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;->sslServerCtx:Ljavax/net/ssl/SSLContext;

    .line 77
    .local v0, "ctx":Ljavax/net/ssl/SSLContext;
    :goto_0
    new-instance v1, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->createSSLEngine()Ljavax/net/ssl/SSLEngine;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;-><init>(Ljavax/net/ssl/SSLEngine;Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    .line 79
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v1, p1}, Ljavax/net/ssl/SSLEngine;->setUseClientMode(Z)V

    .line 80
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v1, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->getConfigurationProperties()Ljava/util/Properties;

    move-result-object v1

    const-string/jumbo v2, "android.gov.nist.javax.sip.TLS_CLIENT_AUTH_TYPE"

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 83
    .local v1, "auth":Ljava/lang/String;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljavax/net/ssl/SSLEngine;->setNeedClientAuth(Z)V

    .line 84
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v2, v3}, Ljavax/net/ssl/SSLEngine;->setWantClientAuth(Z)V

    .line 86
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v2, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->getConfigurationProperties()Ljava/util/Properties;

    move-result-object v2

    const-string/jumbo v3, "android.gov.nist.javax.sip.TLS_CLIENT_PROTOCOLS"

    invoke-virtual {v2, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 88
    .local v2, "clientProtocols":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 89
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    const-string v4, ","

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljavax/net/ssl/SSLEngine;->setEnabledProtocols([Ljava/lang/String;)V

    .line 91
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v3, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v3

    .line 92
    .local v3, "ciphers":[Ljava/lang/String;
    sget-object v4, Landroid/gov/nist/javax/sip/SipStackImpl;->DEFAULT_CIPHERS:[Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 96
    sget-object v4, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v5, "Changing cipher suites"

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 97
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v4, v3}, Ljavax/net/ssl/SSLEngine;->setEnabledCipherSuites([Ljava/lang/String;)V

    goto :goto_1

    .line 99
    :cond_2
    sget-object v4, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v5, "JDK default ciphers will be used."

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 103
    :goto_1
    return-void
.end method

.method public isSecure()Z
    .locals 1

    .line 386
    const/4 v0, 0x1

    return v0
.end method

.method public onNewSocket([B)V
    .locals 4
    .param p1, "message"    # [B

    .line 354
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->onNewSocket([B)V

    .line 356
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 357
    const/4 v0, 0x0

    .line 358
    .local v0, "last":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 359
    new-instance v1, Ljava/lang/String;

    const-string/jumbo v2, "UTF-8"

    invoke-direct {v1, p1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    move-object v0, v1

    .line 361
    :cond_0
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "New socket for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " last message = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 363
    .end local v0    # "last":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->init(Z)V

    .line 364
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->createBuffers()V

    .line 365
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sendMessage([BZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 368
    goto :goto_0

    .line 366
    :catch_0
    move-exception v0

    .line 367
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Cant reinit"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 369
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public prepareAppDataBuffer()Ljava/nio/ByteBuffer;
    .locals 2

    .line 110
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->appBufferMax:I

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public prepareAppDataBuffer(I)Ljava/nio/ByteBuffer;
    .locals 1
    .param p1, "capacity"    # I

    .line 114
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public prepareEncryptedDataBuffer()Ljava/nio/ByteBuffer;
    .locals 2

    .line 106
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->netBufferMax:I

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public sendEncryptedData([B)V
    .locals 3
    .param p1, "msg"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 179
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 180
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sendEncryptedData  this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " peerPort = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->peerPort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " addr = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 182
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->lastActivityTimeStamp:J

    .line 184
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 185
    .local v0, "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 186
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->peerPort:I

    invoke-static {v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putSocket(Ljava/lang/String;Ljava/nio/channels/SocketChannel;)V

    .line 189
    :cond_1
    const/4 v1, 0x0

    invoke-super {p0, p1, v1}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->sendNonWebSocketMessage([BZ)V

    .line 191
    return-void
.end method

.method public sendHttpMessage([BLjava/net/InetAddress;IZ)V
    .locals 4
    .param p1, "message"    # [B
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .param p4, "retry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 267
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->checkSocketState()V

    .line 269
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 271
    .local v0, "b":Ljava/nio/ByteBuffer;
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v2

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->netBufferMax:I

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    new-instance v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$5;

    invoke-direct {v3, p0, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$5;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;Ljava/net/InetAddress;IZ)V

    invoke-virtual {v1, v0, v2, v3}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 282
    nop

    .line 283
    return-void

    .line 280
    :catch_0
    move-exception v1

    .line 281
    .local v1, "e":Ljava/io/IOException;
    throw v1
.end method

.method public sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;I)V
    .locals 8
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 258
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 259
    .local v0, "msg":[B
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->client:Z

    invoke-virtual {p0, v0, p2, p3, v1}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sendMessage([BLjava/net/InetAddress;IZ)V

    .line 261
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x10

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 262
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-virtual/range {v2 .. v7}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V

    .line 263
    :cond_0
    return-void
.end method

.method public sendMessage([BLjava/net/InetAddress;IZ)V
    .locals 14
    .param p1, "message"    # [B
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .param p4, "retry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 195
    move-object v7, p0

    move-object v8, p1

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->checkSocketState()V

    .line 197
    iget-boolean v0, v7, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->client:Z

    if-eqz v0, :cond_0

    iget-boolean v0, v7, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->readingHttp:Z

    if-eqz v0, :cond_0

    iget-object v0, v7, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->httpClientRequestSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 198
    const-string/jumbo v9, "null null HTTP/1.1\r\nHost: null\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Protocol: sip\r\nSec-WebSocket-Version: 13\r\n\r\n"

    .line 207
    .local v9, "http":Ljava/lang/String;
    iget-boolean v0, v7, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->client:Z

    invoke-static {p1, v0}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->wrapBufferIntoWebSocketFrame([BZ)[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 208
    .local v10, "b1":Ljava/nio/ByteBuffer;
    const-string/jumbo v0, "null null HTTP/1.1\r\nHost: null\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Protocol: sip\r\nSec-WebSocket-Version: 13\r\n\r\n"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v11

    .line 210
    .local v11, "b":Ljava/nio/ByteBuffer;
    :try_start_0
    iget-object v0, v7, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v1

    iget v2, v7, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->netBufferMax:I

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v12

    new-instance v13, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;

    move-object v1, v13

    move-object v2, p0

    move-object/from16 v3, p2

    move/from16 v4, p3

    move-object v5, v10

    move/from16 v6, p4

    invoke-direct/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;Ljava/net/InetAddress;ILjava/nio/ByteBuffer;Z)V

    invoke-virtual {v0, v11, v12, v13}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 234
    nop

    .line 235
    .end local v9    # "http":Ljava/lang/String;
    .end local v10    # "b1":Ljava/nio/ByteBuffer;
    .end local v11    # "b":Ljava/nio/ByteBuffer;
    move-object/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    goto :goto_0

    .line 232
    .restart local v9    # "http":Ljava/lang/String;
    .restart local v10    # "b1":Ljava/nio/ByteBuffer;
    .restart local v11    # "b":Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v0

    .line 233
    .local v0, "e":Ljava/io/IOException;
    throw v0

    .line 236
    .end local v0    # "e":Ljava/io/IOException;
    .end local v9    # "http":Ljava/lang/String;
    .end local v10    # "b1":Ljava/nio/ByteBuffer;
    .end local v11    # "b":Ljava/nio/ByteBuffer;
    :cond_0
    iget-boolean v0, v7, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->client:Z

    invoke-static {p1, v0}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->wrapBufferIntoWebSocketFrame([BZ)[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 238
    .local v1, "b":Ljava/nio/ByteBuffer;
    :try_start_1
    iget-object v0, v7, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v2

    iget v3, v7, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->netBufferMax:I

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    new-instance v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$4;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-object/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    :try_start_2
    invoke-direct {v3, p0, v4, v5, v6}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$4;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;Ljava/net/InetAddress;IZ)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 249
    nop

    .line 251
    .end local v1    # "b":Ljava/nio/ByteBuffer;
    :goto_0
    return-void

    .line 247
    .restart local v1    # "b":Ljava/nio/ByteBuffer;
    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    move-object/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    .line 248
    .restart local v0    # "e":Ljava/io/IOException;
    :goto_1
    throw v0
.end method

.method protected sendMessage([BZ)V
    .locals 6
    .param p1, "msg"    # [B
    .param p2, "isClient"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 122
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->checkSocketState()V

    .line 124
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->client:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->readingHttp:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->httpClientRequestSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    const-string/jumbo v0, "null null HTTP/1.1\r\nHost: null\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Protocol: sip\r\nSec-WebSocket-Version: 13\r\n\r\n"

    .line 133
    .local v0, "http":Ljava/lang/String;
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->client:Z

    invoke-static {p1, v1}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->wrapBufferIntoWebSocketFrame([BZ)[B

    move-result-object v1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 134
    .local v1, "b1":Ljava/nio/ByteBuffer;
    const-string/jumbo v2, "null null HTTP/1.1\r\nHost: null\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Protocol: sip\r\nSec-WebSocket-Version: 13\r\n\r\n"

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 136
    .local v2, "b":Ljava/nio/ByteBuffer;
    :try_start_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v4

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->netBufferMax:I

    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    new-instance v5, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;

    invoke-direct {v5, p0, v1, p2}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;Ljava/nio/ByteBuffer;Z)V

    invoke-virtual {v3, v2, v4, v5}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    nop

    .line 161
    .end local v0    # "http":Ljava/lang/String;
    .end local v1    # "b1":Ljava/nio/ByteBuffer;
    .end local v2    # "b":Ljava/nio/ByteBuffer;
    goto :goto_0

    .line 158
    .restart local v0    # "http":Ljava/lang/String;
    .restart local v1    # "b1":Ljava/nio/ByteBuffer;
    .restart local v2    # "b":Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v3

    .line 159
    .local v3, "e":Ljava/io/IOException;
    throw v3

    .line 162
    .end local v0    # "http":Ljava/lang/String;
    .end local v1    # "b1":Ljava/nio/ByteBuffer;
    .end local v2    # "b":Ljava/nio/ByteBuffer;
    .end local v3    # "e":Ljava/io/IOException;
    :cond_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->client:Z

    invoke-static {p1, v0}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->wrapBufferIntoWebSocketFrame([BZ)[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 164
    .local v0, "b":Ljava/nio/ByteBuffer;
    :try_start_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v2

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->netBufferMax:I

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    new-instance v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$2;

    invoke-direct {v3, p0, p2}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$2;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;Z)V

    invoke-virtual {v1, v0, v2, v3}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 173
    nop

    .line 175
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    :goto_0
    return-void

    .line 171
    .restart local v0    # "b":Ljava/nio/ByteBuffer;
    :catch_1
    move-exception v1

    .line 172
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Can\'t send message"

    invoke-direct {v2, v3, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected sendNonWebSocketMessage([BZ)V
    .locals 5
    .param p1, "msg"    # [B
    .param p2, "isClient"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 320
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 321
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sendMessage isClient  = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 323
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->lastActivityTimeStamp:J

    .line 325
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 326
    .local v0, "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 327
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->peerPort:I

    invoke-static {v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putSocket(Ljava/lang/String;Ljava/nio/channels/SocketChannel;)V

    .line 329
    :cond_1
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->checkSocketState()V

    .line 331
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 333
    .local v1, "b":Ljava/nio/ByteBuffer;
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->netBufferMax:I

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    new-instance v4, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$6;

    invoke-direct {v4, p0, p2}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$6;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;Z)V

    invoke-virtual {v2, v1, v3, v4}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 344
    nop

    .line 345
    return-void

    .line 342
    :catch_0
    move-exception v2

    .line 343
    .local v2, "e":Ljava/io/IOException;
    throw v2
.end method
