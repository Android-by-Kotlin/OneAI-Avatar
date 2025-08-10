.class public Landroid/gov/nist/core/net/SslNetworkLayer;
.super Ljava/lang/Object;
.source "SslNetworkLayer.java"

# interfaces
.implements Landroid/gov/nist/core/net/NetworkLayer;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private sslServerSocketFactory:Ljavax/net/ssl/SSLServerSocketFactory;

.field private sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

.field trustAllCerts:[Ljavax/net/ssl/TrustManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 71
    const-class v0, Landroid/gov/nist/core/net/SslNetworkLayer;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/core/net/SslNetworkLayer;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/SipStackImpl;Ljava/lang/String;Ljava/lang/String;[C[CLjava/lang/String;Ljava/lang/String;)V
    .locals 16
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/SipStackImpl;
    .param p2, "trustStoreFile"    # Ljava/lang/String;
    .param p3, "keyStoreFile"    # Ljava/lang/String;
    .param p4, "keyStorePassword"    # [C
    .param p5, "trustStorePassword"    # [C
    .param p6, "keyStoreType"    # Ljava/lang/String;
    .param p7, "trustStoreType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 104
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 78
    const/4 v2, 0x1

    new-array v2, v2, [Ljavax/net/ssl/TrustManager;

    new-instance v3, Landroid/gov/nist/core/net/SslNetworkLayer$1;

    invoke-direct {v3, v0}, Landroid/gov/nist/core/net/SslNetworkLayer$1;-><init>(Landroid/gov/nist/core/net/SslNetworkLayer;)V

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iput-object v2, v0, Landroid/gov/nist/core/net/SslNetworkLayer;->trustAllCerts:[Ljavax/net/ssl/TrustManager;

    .line 106
    const-string/jumbo v2, "TLS"

    invoke-static {v2}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v2

    .line 107
    .local v2, "sslContext":Ljavax/net/ssl/SSLContext;
    invoke-static {}, Ljavax/net/ssl/KeyManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v3

    .line 108
    .local v3, "algorithm":Ljava/lang/String;
    invoke-static {v3}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v4

    .line 109
    .local v4, "tmFactory":Ljavax/net/ssl/TrustManagerFactory;
    invoke-static {v3}, Ljavax/net/ssl/KeyManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/KeyManagerFactory;

    move-result-object v5

    .line 110
    .local v5, "kmFactory":Ljavax/net/ssl/KeyManagerFactory;
    new-instance v6, Ljava/security/SecureRandom;

    invoke-direct {v6}, Ljava/security/SecureRandom;-><init>()V

    .line 111
    .local v6, "secureRandom":Ljava/security/SecureRandom;
    invoke-virtual {v6}, Ljava/security/SecureRandom;->nextInt()I

    .line 112
    if-eqz p6, :cond_0

    move-object/from16 v7, p6

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v7

    :goto_0
    invoke-static {v7}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v7

    .line 114
    .local v7, "keyStore":Ljava/security/KeyStore;
    if-eqz p7, :cond_1

    move-object/from16 v8, p7

    goto :goto_1

    :cond_1
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v8

    :goto_1
    invoke-static {v8}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v8

    .line 116
    .local v8, "trustStore":Ljava/security/KeyStore;
    new-instance v9, Ljava/io/FileInputStream;

    move-object/from16 v10, p3

    invoke-direct {v9, v10}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v9, v1}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 117
    new-instance v9, Ljava/io/FileInputStream;

    move-object/from16 v11, p2

    invoke-direct {v9, v11}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    move-object/from16 v12, p5

    invoke-virtual {v8, v9, v12}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 118
    invoke-virtual {v4, v8}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 119
    invoke-virtual {v5, v7, v1}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 120
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/SipStackImpl;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v9

    sget-object v13, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->DisabledAll:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    const-string v14, "ClientAuth "

    const/16 v15, 0x20

    if-ne v9, v13, :cond_3

    .line 121
    sget-object v9, Landroid/gov/nist/core/net/SslNetworkLayer;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9, v15}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 122
    sget-object v9, Landroid/gov/nist/core/net/SslNetworkLayer;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/SipStackImpl;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " bypassing all cert validations"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v9, v13}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 125
    :cond_2
    const/4 v9, 0x0

    iget-object v13, v0, Landroid/gov/nist/core/net/SslNetworkLayer;->trustAllCerts:[Ljavax/net/ssl/TrustManager;

    invoke-virtual {v2, v9, v13, v6}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    goto :goto_2

    .line 127
    :cond_3
    sget-object v9, Landroid/gov/nist/core/net/SslNetworkLayer;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9, v15}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 128
    sget-object v9, Landroid/gov/nist/core/net/SslNetworkLayer;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/SipStackImpl;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v9, v13}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 131
    :cond_4
    invoke-virtual {v5}, Ljavax/net/ssl/KeyManagerFactory;->getKeyManagers()[Ljavax/net/ssl/KeyManager;

    move-result-object v9

    invoke-virtual {v4}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v13

    invoke-virtual {v2, v9, v13, v6}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 133
    :goto_2
    invoke-virtual {v2}, Ljavax/net/ssl/SSLContext;->getServerSocketFactory()Ljavax/net/ssl/SSLServerSocketFactory;

    move-result-object v9

    iput-object v9, v0, Landroid/gov/nist/core/net/SslNetworkLayer;->sslServerSocketFactory:Ljavax/net/ssl/SSLServerSocketFactory;

    .line 134
    invoke-virtual {v2}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v9

    iput-object v9, v0, Landroid/gov/nist/core/net/SslNetworkLayer;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 135
    return-void
.end method

.method static synthetic access$000()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 69
    sget-object v0, Landroid/gov/nist/core/net/SslNetworkLayer;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method


# virtual methods
.method public createDatagramSocket()Ljava/net/DatagramSocket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 148
    new-instance v0, Ljava/net/DatagramSocket;

    invoke-direct {v0}, Ljava/net/DatagramSocket;-><init>()V

    return-object v0
.end method

.method public createDatagramSocket(ILjava/net/InetAddress;)Ljava/net/DatagramSocket;
    .locals 1
    .param p1, "port"    # I
    .param p2, "laddr"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 153
    new-instance v0, Ljava/net/DatagramSocket;

    invoke-direct {v0, p1, p2}, Ljava/net/DatagramSocket;-><init>(ILjava/net/InetAddress;)V

    return-object v0
.end method

.method public createSSLServerSocket(IILjava/net/InetAddress;)Ljavax/net/ssl/SSLServerSocket;
    .locals 1
    .param p1, "port"    # I
    .param p2, "backlog"    # I
    .param p3, "bindAddress"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 159
    iget-object v0, p0, Landroid/gov/nist/core/net/SslNetworkLayer;->sslServerSocketFactory:Ljavax/net/ssl/SSLServerSocketFactory;

    invoke-virtual {v0, p1, p2, p3}, Ljavax/net/ssl/SSLServerSocketFactory;->createServerSocket(IILjava/net/InetAddress;)Ljava/net/ServerSocket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLServerSocket;

    return-object v0
.end method

.method public createSSLSocket(Ljava/net/InetAddress;I)Ljavax/net/ssl/SSLSocket;
    .locals 1
    .param p1, "address"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 166
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/gov/nist/core/net/SslNetworkLayer;->createSSLSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;)Ljavax/net/ssl/SSLSocket;

    move-result-object v0

    return-object v0
.end method

.method public createSSLSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;)Ljavax/net/ssl/SSLSocket;
    .locals 5
    .param p1, "address"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "myAddress"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 172
    iget-object v0, p0, Landroid/gov/nist/core/net/SslNetworkLayer;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .line 173
    .local v0, "sock":Ljavax/net/ssl/SSLSocket;
    if-eqz p3, :cond_0

    .line 176
    new-instance v1, Ljava/net/InetSocketAddress;

    const/4 v2, 0x0

    invoke-direct {v1, p3, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLSocket;->bind(Ljava/net/SocketAddress;)V

    .line 179
    :cond_0
    :try_start_0
    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-direct {v1, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    const/16 v2, 0x1f40

    invoke-virtual {v0, v1, v2}, Ljavax/net/ssl/SSLSocket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    nop

    .line 183
    return-object v0

    .line 180
    :catch_0
    move-exception v1

    .line 181
    .local v1, "e":Ljava/net/SocketTimeoutException;
    new-instance v2, Ljava/net/ConnectException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Socket timeout error (8sec)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public createServerSocket(IILjava/net/InetAddress;)Ljava/net/ServerSocket;
    .locals 1
    .param p1, "port"    # I
    .param p2, "backlog"    # I
    .param p3, "bindAddress"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 139
    new-instance v0, Ljava/net/ServerSocket;

    invoke-direct {v0, p1, p2, p3}, Ljava/net/ServerSocket;-><init>(IILjava/net/InetAddress;)V

    return-object v0
.end method

.method public createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    .locals 1
    .param p1, "address"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 144
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0, p1, p2}, Ljava/net/Socket;-><init>(Ljava/net/InetAddress;I)V

    return-object v0
.end method

.method public createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;)Ljava/net/Socket;
    .locals 6
    .param p1, "address"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "myAddress"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 188
    const/16 v0, 0x1f40

    const-string v1, ":"

    const-string/jumbo v2, "Socket timeout error (8sec)"

    if-eqz p3, :cond_0

    .line 189
    new-instance v3, Ljava/net/Socket;

    invoke-direct {v3}, Ljava/net/Socket;-><init>()V

    .line 192
    .local v3, "sock":Ljava/net/Socket;
    new-instance v4, Ljava/net/InetSocketAddress;

    const/4 v5, 0x0

    invoke-direct {v4, p3, v5}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 194
    :try_start_0
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-direct {v4, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    nop

    .line 198
    return-object v3

    .line 195
    :catch_0
    move-exception v0

    .line 196
    .local v0, "e":Ljava/net/SocketTimeoutException;
    new-instance v4, Ljava/net/ConnectException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 201
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    .end local v3    # "sock":Ljava/net/Socket;
    :cond_0
    new-instance v3, Ljava/net/Socket;

    invoke-direct {v3}, Ljava/net/Socket;-><init>()V

    .line 203
    .restart local v3    # "sock":Ljava/net/Socket;
    :try_start_1
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-direct {v4, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_1

    .line 206
    nop

    .line 207
    return-object v3

    .line 204
    :catch_1
    move-exception v0

    .line 205
    .restart local v0    # "e":Ljava/net/SocketTimeoutException;
    new-instance v4, Ljava/net/ConnectException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .locals 6
    .param p1, "address"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "myAddress"    # Ljava/net/InetAddress;
    .param p4, "myPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 231
    const/16 v0, 0x1f40

    const-string v1, ":"

    const-string/jumbo v2, "Socket timeout error (8sec)"

    if-eqz p3, :cond_0

    .line 232
    new-instance v3, Ljava/net/Socket;

    invoke-direct {v3}, Ljava/net/Socket;-><init>()V

    .line 235
    .local v3, "sock":Ljava/net/Socket;
    new-instance v4, Ljava/net/InetSocketAddress;

    const/4 v5, 0x0

    invoke-direct {v4, p3, v5}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 237
    :try_start_0
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-direct {v4, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    nop

    .line 241
    return-object v3

    .line 238
    :catch_0
    move-exception v0

    .line 239
    .local v0, "e":Ljava/net/SocketTimeoutException;
    new-instance v4, Ljava/net/ConnectException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 244
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    .end local v3    # "sock":Ljava/net/Socket;
    :cond_0
    new-instance v3, Ljava/net/Socket;

    invoke-direct {v3}, Ljava/net/Socket;-><init>()V

    .line 245
    .restart local v3    # "sock":Ljava/net/Socket;
    if-eqz p4, :cond_1

    .line 246
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-direct {v4, p2}, Ljava/net/InetSocketAddress;-><init>(I)V

    invoke-virtual {v3, v4}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 249
    :cond_1
    :try_start_1
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-direct {v4, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_1

    .line 252
    nop

    .line 253
    return-object v3

    .line 250
    :catch_1
    move-exception v0

    .line 251
    .restart local v0    # "e":Ljava/net/SocketTimeoutException;
    new-instance v4, Ljava/net/ConnectException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public setSipStack(Landroid/gov/nist/javax/sip/SipStackImpl;)V
    .locals 0
    .param p1, "sipStackImpl"    # Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 270
    return-void
.end method
