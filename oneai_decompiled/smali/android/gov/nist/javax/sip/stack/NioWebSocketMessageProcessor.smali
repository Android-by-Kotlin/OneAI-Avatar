.class public Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;
.super Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
.source "NioWebSocketMessageProcessor.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    const-class v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V
    .locals 1
    .param p1, "ipAddress"    # Ljava/net/InetAddress;
    .param p2, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p3, "port"    # I

    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 43
    const-string/jumbo v0, "WS"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;->transport:Ljava/lang/String;

    .line 44
    return-void
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

    .line 60
    new-instance v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v0, p1, p2, v1, p0}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V

    return-object v0
.end method

.method public createMessageChannel(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    .locals 3
    .param p1, "nioTcpMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    .param p2, "client"    # Ljava/nio/channels/SocketChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->getMessageChannel(Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;

    .line 49
    .local v0, "retval":Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;
    if-nez v0, :cond_0

    .line 50
    new-instance v1, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v1, v2, p1, p2}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)V

    move-object v0, v1

    .line 53
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v1, p2, v0}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putMessageChannel(Ljava/nio/channels/SocketChannel;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;)V

    .line 55
    :cond_0
    return-object v0
.end method
