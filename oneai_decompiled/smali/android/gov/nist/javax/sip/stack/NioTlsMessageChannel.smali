.class public Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;
.super Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
.source "NioTlsMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel$SSLReconnectedException;
    }
.end annotation


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private appBufferMax:I

.field private handshakeCompleted:Z

.field private handshakeCompletedListener:Ljavax/net/ssl/HandshakeCompletedListener;

.field private netBufferMax:I

.field sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 49
    const-class v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)V
    .locals 3
    .param p1, "nioTcpMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    .param p2, "socketChannel"    # Ljava/nio/channels/SocketChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    invoke-direct {p0, p1, p2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->handshakeCompleted:Z

    .line 64
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 65
    invoke-virtual {p2}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 67
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->init(Z)V

    .line 68
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->createBuffers()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    nop

    .line 72
    return-void

    .line 69
    :catch_0
    move-exception v0

    .line 70
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

    .line 192
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->handshakeCompleted:Z

    .line 194
    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->init(Z)V

    .line 195
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->createBuffers()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    nop

    .line 199
    return-void

    .line 196
    :catch_0
    move-exception v0

    .line 197
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Can\'t init the TLS channel"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static synthetic access$001(Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;[BZ)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    invoke-super {p0, p1, p2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendMessage([BZ)V

    return-void
.end method

.method static synthetic access$101(Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;[BLjava/net/InetAddress;IZ)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Ljava/net/InetAddress;
    .param p3, "x3"    # I
    .param p4, "x4"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    invoke-super {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendMessage([BLjava/net/InetAddress;IZ)V

    return-void
.end method

.method private checkSocketState()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 236
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v0

    if-nez v0, :cond_2

    .line 237
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 238
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Need to reset SSL engine for socket "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 240
    :cond_1
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getUseClientMode()Z

    move-result v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->init(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    goto :goto_0

    .line 241
    :catch_0
    move-exception v0

    .line 242
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Cannot reset SSL engine"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 243
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 246
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_2
    :goto_0
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

    .line 203
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adding TLS bytes for decryption "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 206
    :cond_0
    array-length v0, p1

    if-gtz v0, :cond_1

    return-void

    .line 207
    :cond_1
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 208
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->unwrap(Ljava/nio/ByteBuffer;)V

    .line 209
    return-void
.end method

.method public addPlaintextBytes([B)V
    .locals 1
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 255
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->nioParser:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->addBytes([B)V

    .line 256
    return-void
.end method

.method protected createBuffers()V
    .locals 4

    .line 180
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v0

    .line 181
    .local v0, "session":Ljavax/net/ssl/SSLSession;
    invoke-interface {v0}, Ljavax/net/ssl/SSLSession;->getApplicationBufferSize()I

    move-result v1

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->appBufferMax:I

    .line 182
    invoke-interface {v0}, Ljavax/net/ssl/SSLSession;->getPacketBufferSize()I

    move-result v1

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->netBufferMax:I

    .line 184
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 185
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "appBufferMax="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->appBufferMax:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " netBufferMax="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->netBufferMax:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 187
    :cond_0
    return-void
.end method

.method public bridge synthetic getEncapsulatedClientTransaction()Landroid/gov/nist/javax/sip/ClientTransactionExt;
    .locals 1

    .line 47
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->getEncapsulatedClientTransaction()Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v0

    return-object v0
.end method

.method public getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    .locals 1

    .line 268
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->handshakeCompletedListener:Ljavax/net/ssl/HandshakeCompletedListener;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    return-object v0
.end method

.method public getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;
    .locals 1

    .line 287
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    return-object v0
.end method

.method public bridge synthetic getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1

    .line 47
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;

    move-result-object v0

    return-object v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 213
    const-string/jumbo v0, "TLS"

    return-object v0
.end method

.method public init(Z)V
    .locals 5
    .param p1, "clientMode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;,
            Ljava/security/cert/CertificateException;,
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;

    if-eqz p1, :cond_0

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sslClientCtx:Ljavax/net/ssl/SSLContext;

    goto :goto_0

    :cond_0
    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sslServerCtx:Ljavax/net/ssl/SSLContext;

    .line 78
    .local v0, "ctx":Ljavax/net/ssl/SSLContext;
    :goto_0
    new-instance v1, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->createSSLEngine()Ljavax/net/ssl/SSLEngine;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;-><init>(Ljavax/net/ssl/SSLEngine;Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    .line 80
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v1, p1}, Ljavax/net/ssl/SSLEngine;->setUseClientMode(Z)V

    .line 81
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v1, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->getConfigurationProperties()Ljava/util/Properties;

    move-result-object v1

    const-string/jumbo v2, "android.gov.nist.javax.sip.TLS_CLIENT_AUTH_TYPE"

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 83
    .local v1, "auth":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 84
    const-string v1, "Enabled"

    .line 86
    :cond_1
    const-string v2, "Disabled"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_5

    const-string v2, "DisabledAll"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    .line 89
    :cond_2
    const-string v2, "Enabled"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_3

    .line 90
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v2, v4}, Ljavax/net/ssl/SSLEngine;->setNeedClientAuth(Z)V

    goto :goto_2

    .line 91
    :cond_3
    const-string/jumbo v2, "Want"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 92
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v2, v3}, Ljavax/net/ssl/SSLEngine;->setNeedClientAuth(Z)V

    .line 93
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v2, v4}, Ljavax/net/ssl/SSLEngine;->setWantClientAuth(Z)V

    goto :goto_2

    .line 95
    :cond_4
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid parameter for TLS authentication: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 87
    :cond_5
    :goto_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v2, v3}, Ljavax/net/ssl/SSLEngine;->setNeedClientAuth(Z)V

    .line 88
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v2, v3}, Ljavax/net/ssl/SSLEngine;->setWantClientAuth(Z)V

    .line 99
    :goto_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v3, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/net/ssl/SSLEngine;->setEnabledProtocols([Ljava/lang/String;)V

    .line 100
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v3, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/net/ssl/SSLEngine;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 102
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v2

    if-nez v2, :cond_6

    .line 103
    new-instance v2, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getSocketChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;Ljava/nio/channels/SocketChannel;)V

    .line 104
    .local v2, "listner":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->setHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 106
    .end local v2    # "listner":Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    :cond_6
    return-void
.end method

.method public isHandshakeCompleted()Z
    .locals 1

    .line 275
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->handshakeCompleted:Z

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .line 250
    const/4 v0, 0x1

    return v0
.end method

.method public onNewSocket([B)V
    .locals 4
    .param p1, "message"    # [B

    .line 218
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->onNewSocket([B)V

    .line 220
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 221
    const/4 v0, 0x0

    .line 222
    .local v0, "last":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 223
    new-instance v1, Ljava/lang/String;

    const-string/jumbo v2, "UTF-8"

    invoke-direct {v1, p1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    move-object v0, v1

    .line 225
    :cond_0
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 227
    .end local v0    # "last":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->init(Z)V

    .line 228
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->createBuffers()V

    .line 229
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sendMessage([BZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    goto :goto_0

    .line 230
    :catch_0
    move-exception v0

    .line 231
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Cant reinit"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 233
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public prepareAppDataBuffer()Ljava/nio/ByteBuffer;
    .locals 2

    .line 113
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->appBufferMax:I

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public prepareAppDataBuffer(I)Ljava/nio/ByteBuffer;
    .locals 1
    .param p1, "capacity"    # I

    .line 117
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public prepareEncryptedDataBuffer()Ljava/nio/ByteBuffer;
    .locals 2

    .line 109
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->netBufferMax:I

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public sendEncryptedData([B)V
    .locals 4
    .param p1, "msg"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 145
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

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

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->peerPort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " addr = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 148
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->lastActivityTimeStamp:J

    .line 150
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 151
    .local v0, "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 152
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->peerPort:I

    invoke-static {v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putSocket(Ljava/lang/String;Ljava/nio/channels/SocketChannel;)V

    .line 154
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->peerPort:I

    const/4 v3, 0x1

    invoke-super {p0, p1, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendMessage([BLjava/net/InetAddress;IZ)V

    .line 155
    return-void
.end method

.method public sendMessage([BLjava/net/InetAddress;IZ)V
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

    .line 161
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->checkSocketState()V

    .line 163
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 165
    .local v0, "b":Ljava/nio/ByteBuffer;
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v2

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->netBufferMax:I

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    new-instance v3, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel$2;

    invoke-direct {v3, p0, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel$2;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;Ljava/net/InetAddress;IZ)V

    invoke-virtual {v1, v0, v2, v3}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    nop

    .line 177
    return-void

    .line 174
    :catch_0
    move-exception v1

    .line 175
    .local v1, "e":Ljava/io/IOException;
    throw v1
.end method

.method protected sendMessage([BZ)V
    .locals 4
    .param p1, "msg"    # [B
    .param p2, "isClient"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->checkSocketState()V

    .line 127
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 129
    .local v0, "b":Ljava/nio/ByteBuffer;
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v2

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->netBufferMax:I

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    new-instance v3, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel$1;

    invoke-direct {v3, p0, p2}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel$1;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;Z)V

    invoke-virtual {v1, v0, v2, v3}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    nop

    .line 141
    return-void

    .line 138
    :catch_0
    move-exception v1

    .line 139
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Can\'t send message"

    invoke-direct {v2, v3, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setHandshakeCompleted(Z)V
    .locals 0
    .param p1, "handshakeCompleted"    # Z

    .line 282
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->handshakeCompleted:Z

    .line 283
    return-void
.end method

.method public setHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V
    .locals 0
    .param p1, "handshakeCompletedListenerImpl"    # Ljavax/net/ssl/HandshakeCompletedListener;

    .line 261
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->handshakeCompletedListener:Ljavax/net/ssl/HandshakeCompletedListener;

    .line 262
    return-void
.end method
