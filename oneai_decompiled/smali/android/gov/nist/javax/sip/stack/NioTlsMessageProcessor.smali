.class public Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;
.super Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
.source "NioTlsMessageProcessor.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field sslClientCtx:Ljavax/net/ssl/SSLContext;

.field sslServerCtx:Ljavax/net/ssl/SSLContext;

.field trustAllCerts:[Ljavax/net/ssl/TrustManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    const-class v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V
    .locals 3
    .param p1, "ipAddress"    # Ljava/net/InetAddress;
    .param p2, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p3, "port"    # I

    .line 73
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 49
    const/4 v0, 0x1

    new-array v0, v0, [Ljavax/net/ssl/TrustManager;

    new-instance v1, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor$1;

    invoke-direct {v1, p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor$1;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->trustAllCerts:[Ljavax/net/ssl/TrustManager;

    .line 74
    const-string/jumbo v0, "TLS"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->transport:Ljava/lang/String;

    .line 76
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->init()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    nop

    .line 80
    return-void

    .line 77
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static synthetic access$000()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 44
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method


# virtual methods
.method constructMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    .locals 2
    .param p1, "targetHost"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    new-instance v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v0, p1, p2, v1, p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V

    return-object v0
.end method

.method public createMessageChannel(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    .locals 2
    .param p1, "nioTcpMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    .param p2, "socketChannel"    # Ljava/nio/channels/SocketChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 84
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->getMessageChannel(Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    move-result-object v0

    .line 85
    .local v0, "retval":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    if-nez v0, :cond_0

    .line 86
    new-instance v1, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-direct {v1, p1, p2}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)V

    move-object v0, v1

    .line 88
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v1, p2, v0}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putMessageChannel(Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;)V

    .line 90
    :cond_0
    return-object v0
.end method

.method public init()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;,
            Ljava/security/cert/CertificateException;,
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getKeyManagers(Z)[Ljavax/net/ssl/KeyManager;

    move-result-object v0

    const/16 v2, 0x20

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getTrustManagers(Z)[Ljavax/net/ssl/TrustManager;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    const/4 v3, 0x1

    invoke-interface {v0, v3}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getTrustManagers(Z)[Ljavax/net/ssl/TrustManager;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 109
    :cond_0
    const-string/jumbo v0, "TLS"

    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v4

    iput-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sslServerCtx:Ljavax/net/ssl/SSLContext;

    .line 110
    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sslClientCtx:Ljavax/net/ssl/SSLContext;

    .line 112
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v0

    sget-object v4, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->DisabledAll:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    const-string v5, "ClientAuth "

    const/4 v6, 0x0

    if-ne v0, v4, :cond_2

    .line 113
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 114
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " bypassing all cert validations"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 117
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sslServerCtx:Ljavax/net/ssl/SSLContext;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getKeyManagers(Z)[Ljavax/net/ssl/KeyManager;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->trustAllCerts:[Ljavax/net/ssl/TrustManager;

    invoke-virtual {v0, v1, v2, v6}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 118
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sslClientCtx:Ljavax/net/ssl/SSLContext;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v1, v3}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getKeyManagers(Z)[Ljavax/net/ssl/KeyManager;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->trustAllCerts:[Ljavax/net/ssl/TrustManager;

    invoke-virtual {v0, v1, v2, v6}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    goto :goto_0

    .line 120
    :cond_2
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 121
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 124
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sslServerCtx:Ljavax/net/ssl/SSLContext;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getKeyManagers(Z)[Ljavax/net/ssl/KeyManager;

    move-result-object v2

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v4, v1}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getTrustManagers(Z)[Ljavax/net/ssl/TrustManager;

    move-result-object v1

    invoke-virtual {v0, v2, v1, v6}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 127
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sslClientCtx:Ljavax/net/ssl/SSLContext;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v1, v3}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getKeyManagers(Z)[Ljavax/net/ssl/KeyManager;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/net/SecurityManagerProvider;->getTrustManagers(Z)[Ljavax/net/ssl/TrustManager;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v6}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 132
    :goto_0
    return-void

    .line 103
    :cond_4
    :goto_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 104
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "TLS initialization failed due to NULL security config"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 106
    :cond_5
    return-void
.end method
