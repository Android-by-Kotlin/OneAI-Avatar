.class public Landroid/gov/nist/core/net/DefaultNetworkLayer;
.super Ljava/lang/Object;
.source "DefaultNetworkLayer.java"

# interfaces
.implements Landroid/gov/nist/core/net/NetworkLayer;


# static fields
.field public static final SINGLETON:Landroid/gov/nist/core/net/DefaultNetworkLayer;


# instance fields
.field private sslServerSocketFactory:Ljavax/net/ssl/SSLServerSocketFactory;

.field private sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 65
    new-instance v0, Landroid/gov/nist/core/net/DefaultNetworkLayer;

    invoke-direct {v0}, Landroid/gov/nist/core/net/DefaultNetworkLayer;-><init>()V

    sput-object v0, Landroid/gov/nist/core/net/DefaultNetworkLayer;->SINGLETON:Landroid/gov/nist/core/net/DefaultNetworkLayer;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    invoke-static {}, Ljavax/net/ssl/SSLServerSocketFactory;->getDefault()Ljavax/net/ServerSocketFactory;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLServerSocketFactory;

    iput-object v0, p0, Landroid/gov/nist/core/net/DefaultNetworkLayer;->sslServerSocketFactory:Ljavax/net/ssl/SSLServerSocketFactory;

    .line 70
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    iput-object v0, p0, Landroid/gov/nist/core/net/DefaultNetworkLayer;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 71
    return-void
.end method


# virtual methods
.method public createDatagramSocket()Ljava/net/DatagramSocket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 84
    new-instance v0, Ljava/net/DatagramSocket;

    invoke-direct {v0}, Ljava/net/DatagramSocket;-><init>()V

    return-object v0
.end method

.method public createDatagramSocket(ILjava/net/InetAddress;)Ljava/net/DatagramSocket;
    .locals 3
    .param p1, "port"    # I
    .param p2, "laddr"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 90
    invoke-virtual {p2}, Ljava/net/InetAddress;->isMulticastAddress()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    :try_start_0
    new-instance v0, Ljava/net/MulticastSocket;

    invoke-direct {v0, p1}, Ljava/net/MulticastSocket;-><init>(I)V

    .line 93
    .local v0, "ds":Ljava/net/MulticastSocket;
    invoke-virtual {v0, p2}, Ljava/net/MulticastSocket;->joinGroup(Ljava/net/InetAddress;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    return-object v0

    .line 95
    .end local v0    # "ds":Ljava/net/MulticastSocket;
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/net/SocketException;

    invoke-virtual {v0}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 98
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
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

    .line 104
    iget-object v0, p0, Landroid/gov/nist/core/net/DefaultNetworkLayer;->sslServerSocketFactory:Ljavax/net/ssl/SSLServerSocketFactory;

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

    .line 111
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/gov/nist/core/net/DefaultNetworkLayer;->createSSLSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;)Ljavax/net/ssl/SSLSocket;

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

    .line 117
    iget-object v0, p0, Landroid/gov/nist/core/net/DefaultNetworkLayer;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .line 118
    .local v0, "sock":Ljavax/net/ssl/SSLSocket;
    if-eqz p3, :cond_0

    .line 121
    new-instance v1, Ljava/net/InetSocketAddress;

    const/4 v2, 0x0

    invoke-direct {v1, p3, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLSocket;->bind(Ljava/net/SocketAddress;)V

    .line 124
    :cond_0
    :try_start_0
    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-direct {v1, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    const/16 v2, 0x1f40

    invoke-virtual {v0, v1, v2}, Ljavax/net/ssl/SSLSocket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    nop

    .line 128
    return-object v0

    .line 125
    :catch_0
    move-exception v1

    .line 126
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

    .line 75
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

    .line 80
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

    .line 133
    const/16 v0, 0x1f40

    const-string v1, ":"

    const-string/jumbo v2, "Socket timeout error (8sec)"

    if-eqz p3, :cond_0

    .line 134
    new-instance v3, Ljava/net/Socket;

    invoke-direct {v3}, Ljava/net/Socket;-><init>()V

    .line 137
    .local v3, "sock":Ljava/net/Socket;
    new-instance v4, Ljava/net/InetSocketAddress;

    const/4 v5, 0x0

    invoke-direct {v4, p3, v5}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 139
    :try_start_0
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-direct {v4, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    nop

    .line 143
    return-object v3

    .line 140
    :catch_0
    move-exception v0

    .line 141
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

    .line 146
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    .end local v3    # "sock":Ljava/net/Socket;
    :cond_0
    new-instance v3, Ljava/net/Socket;

    invoke-direct {v3}, Ljava/net/Socket;-><init>()V

    .line 148
    .restart local v3    # "sock":Ljava/net/Socket;
    :try_start_1
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-direct {v4, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_1

    .line 151
    nop

    .line 152
    return-object v3

    .line 149
    :catch_1
    move-exception v0

    .line 150
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

    .line 176
    const/16 v0, 0x1f40

    const-string v1, ":"

    const-string/jumbo v2, "Socket timeout error (8sec)"

    if-eqz p3, :cond_0

    .line 177
    new-instance v3, Ljava/net/Socket;

    invoke-direct {v3}, Ljava/net/Socket;-><init>()V

    .line 180
    .local v3, "sock":Ljava/net/Socket;
    new-instance v4, Ljava/net/InetSocketAddress;

    const/4 v5, 0x0

    invoke-direct {v4, p3, v5}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 182
    :try_start_0
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-direct {v4, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    nop

    .line 186
    return-object v3

    .line 183
    :catch_0
    move-exception v0

    .line 184
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

    .line 189
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    .end local v3    # "sock":Ljava/net/Socket;
    :cond_0
    new-instance v3, Ljava/net/Socket;

    invoke-direct {v3}, Ljava/net/Socket;-><init>()V

    .line 190
    .restart local v3    # "sock":Ljava/net/Socket;
    if-eqz p4, :cond_1

    .line 191
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-direct {v4, p2}, Ljava/net/InetSocketAddress;-><init>(I)V

    invoke-virtual {v3, v4}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 194
    :cond_1
    :try_start_1
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-direct {v4, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_1

    .line 197
    nop

    .line 198
    return-object v3

    .line 195
    :catch_1
    move-exception v0

    .line 196
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

    .line 215
    return-void
.end method
