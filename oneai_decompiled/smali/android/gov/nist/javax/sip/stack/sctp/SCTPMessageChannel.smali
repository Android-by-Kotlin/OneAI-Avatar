.class final Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;
.super Landroid/gov/nist/javax/sip/stack/MessageChannel;
.source "SCTPMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/stack/MessageChannel;",
        "Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;",
        "Ljava/lang/Comparable<",
        "Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private final channel:Lcom/sun/nio/sctp/SctpChannel;

.field private final key:Ljava/nio/channels/SelectionKey;

.field private final messageInfo:Lcom/sun/nio/sctp/MessageInfo;

.field private final parser:Landroid/gov/nist/javax/sip/parser/StringMsgParser;

.field private peerAddress:Ljava/net/InetSocketAddress;

.field private peerSrcAddress:Ljava/net/InetSocketAddress;

.field private final processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

.field private final rxBuffer:Ljava/nio/ByteBuffer;

.field private rxTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 43
    nop

    .line 45
    const-class v0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method constructor <init>(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;Lcom/sun/nio/sctp/SctpChannel;)V
    .locals 4
    .param p1, "p"    # Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;
    .param p2, "c"    # Lcom/sun/nio/sctp/SctpChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;-><init>()V

    .line 58
    const/16 v0, 0x2710

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->rxBuffer:Ljava/nio/ByteBuffer;

    .line 60
    new-instance v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->parser:Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    .line 79
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

    .line 80
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 81
    invoke-virtual {p2}, Lcom/sun/nio/sctp/SctpChannel;->getRemoteAddresses()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/SocketAddress;

    .line 82
    .local v0, "a":Ljava/net/SocketAddress;
    move-object v1, v0

    check-cast v1, Ljava/net/InetSocketAddress;

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerAddress:Ljava/net/InetSocketAddress;

    .line 83
    move-object v1, v0

    check-cast v1, Ljava/net/InetSocketAddress;

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerSrcAddress:Ljava/net/InetSocketAddress;

    .line 84
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/sun/nio/sctp/MessageInfo;->createOutgoing(Ljava/net/SocketAddress;I)Lcom/sun/nio/sctp/MessageInfo;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->messageInfo:Lcom/sun/nio/sctp/MessageInfo;

    .line 85
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->messageInfo:Lcom/sun/nio/sctp/MessageInfo;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/sun/nio/sctp/MessageInfo;->unordered(Z)Lcom/sun/nio/sctp/MessageInfo;

    .line 87
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    .line 88
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    invoke-virtual {v2, v1}, Lcom/sun/nio/sctp/SctpChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 89
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    invoke-virtual {v1, p0, v2}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->registerChannel(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;Lcom/sun/nio/sctp/SctpChannel;)Ljava/nio/channels/SelectionKey;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->key:Ljava/nio/channels/SelectionKey;

    .line 90
    return-void
.end method

.method constructor <init>(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;Ljava/net/InetSocketAddress;)V
    .locals 3
    .param p1, "p"    # Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;
    .param p2, "dest"    # Ljava/net/InetSocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;-><init>()V

    .line 58
    const/16 v0, 0x2710

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->rxBuffer:Ljava/nio/ByteBuffer;

    .line 60
    new-instance v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->parser:Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    .line 64
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

    .line 65
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 66
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerAddress:Ljava/net/InetSocketAddress;

    .line 67
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerSrcAddress:Ljava/net/InetSocketAddress;

    .line 69
    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcom/sun/nio/sctp/MessageInfo;->createOutgoing(Ljava/net/SocketAddress;I)Lcom/sun/nio/sctp/MessageInfo;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->messageInfo:Lcom/sun/nio/sctp/MessageInfo;

    .line 70
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->messageInfo:Lcom/sun/nio/sctp/MessageInfo;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/sun/nio/sctp/MessageInfo;->unordered(Z)Lcom/sun/nio/sctp/MessageInfo;

    .line 72
    invoke-static {p2, v2, v2}, Lcom/sun/nio/sctp/SctpChannel;->open(Ljava/net/SocketAddress;II)Lcom/sun/nio/sctp/SctpChannel;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    .line 73
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    invoke-virtual {v1, v0}, Lcom/sun/nio/sctp/SctpChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 74
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    invoke-virtual {v0, p0, v1}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->registerChannel(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;Lcom/sun/nio/sctp/SctpChannel;)Ljava/nio/channels/SelectionKey;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->key:Ljava/nio/channels/SelectionKey;

    .line 75
    return-void
.end method

.method private processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;J)V
    .locals 11
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p2, "rxTime"    # J

    .line 254
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    .line 255
    .local v0, "sipStack":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemoteAddress(Ljava/net/InetAddress;)V

    .line 256
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getPeerPort()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemotePort(I)V

    .line 257
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getPort()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalPort(I)V

    .line 258
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalAddress(Ljava/net/InetAddress;)V

    .line 260
    instance-of v1, p1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    const/16 v2, 0x20

    if-eqz v1, :cond_8

    .line 261
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 266
    .local v1, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x10

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 267
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getServerLogger()Landroid/gov/nist/core/ServerLogger;

    move-result-object v4

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getPeerHostPort()Landroid/gov/nist/core/HostPort;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/core/HostPort;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ":"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getPort()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    move-object v5, p1

    move-wide v9, p2

    invoke-interface/range {v4 .. v10}, Landroid/gov/nist/core/ServerLogger;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;ZJ)V

    .line 271
    :cond_0
    invoke-virtual {v0, v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->newSIPServerRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    move-result-object v3

    .line 274
    .local v3, "sipServerRequest":Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    if-nez v3, :cond_2

    .line 275
    sget-object v2, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 276
    sget-object v2, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Null request interface returned -- dropping request"

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 281
    :cond_1
    return-void

    .line 283
    :cond_2
    sget-object v4, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    const-string v5, "/"

    if-eqz v4, :cond_3

    .line 284
    sget-object v4, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "About to process "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 288
    :cond_3
    :try_start_0
    invoke-interface {v3, v1, p0}, Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;->processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 290
    instance-of v4, v3, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v4, :cond_5

    .line 291
    move-object v4, v3

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 292
    .local v4, "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    move-result v6

    if-nez v6, :cond_4

    .line 293
    move-object v6, v3

    check-cast v6, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    .line 295
    .end local v4    # "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_4
    nop

    .line 297
    :cond_5
    sget-object v4, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 298
    sget-object v2, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Done processing "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 304
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v3    # "sipServerRequest":Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    :cond_6
    goto/16 :goto_0

    .line 290
    .restart local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v3    # "sipServerRequest":Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    :catchall_0
    move-exception v2

    instance-of v4, v3, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v4, :cond_7

    .line 291
    move-object v4, v3

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 292
    .restart local v4    # "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    move-result v5

    if-nez v5, :cond_7

    .line 293
    move-object v5, v3

    check-cast v5, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v5}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    .line 295
    .end local v4    # "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_7
    throw v2

    .line 306
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v3    # "sipServerRequest":Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    :cond_8
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 308
    .local v1, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :try_start_1
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->checkHeaders()V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0

    .line 315
    nop

    .line 316
    invoke-virtual {v0, v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->newSIPServerResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    move-result-object v3

    .line 318
    .local v3, "sipServerResponse":Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    if-eqz v3, :cond_e

    .line 320
    :try_start_2
    instance-of v2, v3, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    if-eqz v2, :cond_b

    move-object v2, v3

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v2, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->checkFromTag(Landroid/gov/nist/javax/sip/message/SIPResponse;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 323
    sget-object v2, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 324
    sget-object v2, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Dropping response message with invalid tag >>> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 332
    :cond_9
    instance-of v2, v3, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v2, :cond_a

    move-object v2, v3

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->passToListener()Z

    move-result v2

    if-nez v2, :cond_a

    .line 335
    move-object v2, v3

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    :cond_a
    return-void

    .line 330
    :cond_b
    :try_start_3
    invoke-interface {v3, v1, p0}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 332
    instance-of v2, v3, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v2, :cond_c

    move-object v2, v3

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->passToListener()Z

    move-result v2

    if-nez v2, :cond_c

    .line 335
    move-object v2, v3

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    :cond_c
    goto :goto_0

    .line 332
    :catchall_1
    move-exception v2

    instance-of v4, v3, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v4, :cond_d

    move-object v4, v3

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->passToListener()Z

    move-result v4

    if-nez v4, :cond_d

    .line 335
    move-object v4, v3

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    :cond_d
    throw v2

    .line 340
    :cond_e
    sget-object v4, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 341
    sget-object v2, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "null sipServerResponse as could not acquire semaphore or the valve dropped the message."

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 346
    .end local v1    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v3    # "sipServerResponse":Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    :cond_f
    :goto_0
    return-void

    .line 309
    .restart local v1    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :catch_0
    move-exception v2

    .line 310
    .local v2, "ex":Ljava/text/ParseException;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v3

    if-eqz v3, :cond_10

    .line 311
    sget-object v3, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Dropping Badly formatted response message >>> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 314
    :cond_10
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 95
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->key:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 96
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    invoke-virtual {v0}, Lcom/sun/nio/sctp/SctpChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 100
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->removeChannel(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;)V

    .line 101
    nop

    .line 102
    return-void

    .line 100
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

    invoke-virtual {v1, p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->removeChannel(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;)V

    throw v0
.end method

.method closeNoRemove()V
    .locals 1

    .line 106
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->key:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 107
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    invoke-virtual {v0}, Lcom/sun/nio/sctp/SctpChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    goto :goto_0

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 111
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method public compareTo(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;)I
    .locals 2
    .param p1, "o"    # Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;

    .line 405
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 43
    check-cast p1, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;

    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->compareTo(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;)I

    move-result p1

    return p1
.end method

.method public getKey()Ljava/lang/String;
    .locals 3

    .line 116
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getPeerInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getPeerPort()I

    move-result v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPeerAddress()Ljava/lang/String;
    .locals 1

    .line 121
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getHostString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPeerInetAddress()Ljava/net/InetAddress;
    .locals 1

    .line 126
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getPeerPacketSourceAddress()Ljava/net/InetAddress;
    .locals 1

    .line 131
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerSrcAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getPeerPacketSourcePort()I
    .locals 1

    .line 136
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerSrcAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v0

    return v0
.end method

.method public getPeerPort()I
    .locals 1

    .line 141
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v0

    return v0
.end method

.method protected getPeerProtocol()Ljava/lang/String;
    .locals 1

    .line 146
    const-string/jumbo v0, "sctp"

    return-object v0
.end method

.method public getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1

    .line 151
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    return-object v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 156
    const-string/jumbo v0, "sctp"

    return-object v0
.end method

.method public getViaHost()Ljava/lang/String;
    .locals 1

    .line 161
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->getSavedIpAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViaPort()I
    .locals 1

    .line 166
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->getPort()I

    move-result v0

    return v0
.end method

.method public handleException(Ljava/text/ParseException;Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "ex"    # Ljava/text/ParseException;
    .param p2, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p3, "hdrClass"    # Ljava/lang/Class;
    .param p4, "header"    # Ljava/lang/String;
    .param p5, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 361
    sget-object v0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 362
    sget-object v0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "Parsing Exception: "

    invoke-interface {v0, v2, p1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 364
    :cond_0
    if-eqz p3, :cond_5

    const-class v0, Landroid/gov/nist/javax/sip/header/From;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/To;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/Via;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/CallID;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 371
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 372
    sget-object v0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BAD MESSAGE!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 376
    :cond_2
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->toString()Ljava/lang/String;

    move-result-object v0

    .line 377
    .local v0, "msgString":Ljava/lang/String;
    const-string/jumbo v1, "SIP/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "ACK "

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 378
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    if-eqz v1, :cond_4

    .line 379
    sget-object v1, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 380
    sget-object v1, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Malformed mandatory headers: closing socket! :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 386
    :cond_3
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    invoke-virtual {v1}, Lcom/sun/nio/sctp/SctpChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 394
    goto :goto_0

    .line 388
    :catch_0
    move-exception v1

    .line 389
    .local v1, "ie":Ljava/io/IOException;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 390
    sget-object v2, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception while closing socket! :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 398
    .end local v1    # "ie":Ljava/io/IOException;
    :cond_4
    :goto_0
    throw p1

    .line 400
    .end local v0    # "msgString":Ljava/lang/String;
    :cond_5
    invoke-virtual {p2, p4}, Landroid/gov/nist/javax/sip/message/SIPMessage;->addUnparsed(Ljava/lang/String;)V

    .line 402
    return-void
.end method

.method public isReliable()Z
    .locals 1

    .line 171
    const/4 v0, 0x1

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .line 176
    const/4 v0, 0x0

    return v0
.end method

.method readMessages()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 204
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->rxTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 205
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->rxTime:J

    .line 207
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->rxBuffer:Ljava/nio/ByteBuffer;

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4, v4}, Lcom/sun/nio/sctp/SctpChannel;->receive(Ljava/nio/ByteBuffer;Ljava/lang/Object;Lcom/sun/nio/sctp/NotificationHandler;)Lcom/sun/nio/sctp/MessageInfo;

    move-result-object v0

    .line 208
    .local v0, "info":Lcom/sun/nio/sctp/MessageInfo;
    const/16 v1, 0x20

    if-nez v0, :cond_2

    .line 210
    sget-object v2, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 211
    sget-object v1, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "SCTP read-event but no message"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 213
    :cond_1
    return-void

    .line 214
    :cond_2
    invoke-virtual {v0}, Lcom/sun/nio/sctp/MessageInfo;->bytes()I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_3

    .line 215
    sget-object v1, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "SCTP peer closed, closing too..."

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 216
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->close()V

    .line 217
    return-void

    .line 218
    :cond_3
    invoke-virtual {v0}, Lcom/sun/nio/sctp/MessageInfo;->isComplete()Z

    move-result v4

    if-nez v4, :cond_5

    .line 219
    sget-object v2, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 220
    sget-object v1, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "SCTP incomplete message; bytes="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/sun/nio/sctp/MessageInfo;->bytes()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 222
    :cond_4
    return-void

    .line 224
    :cond_5
    sget-object v4, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 225
    sget-object v4, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "SCTP message now complete; bytes="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/sun/nio/sctp/MessageInfo;->bytes()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 230
    :cond_6
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->rxBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    new-array v4, v4, [B

    .line 231
    .local v4, "msg":[B
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->rxBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 232
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->rxBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5, v4}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 233
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->rxBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    .line 235
    :try_start_0
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->parser:Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    const/4 v6, 0x1

    invoke-virtual {v5, v4, v6, v6, p0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v5

    .line 236
    .local v5, "m":Landroid/gov/nist/javax/sip/message/SIPMessage;
    iget-wide v6, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->rxTime:J

    invoke-direct {p0, v5, v6, v7}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;J)V

    .line 237
    iput-wide v2, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->rxTime:J
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    .end local v5    # "m":Landroid/gov/nist/javax/sip/message/SIPMessage;
    nop

    .line 245
    return-void

    .line 238
    :catch_0
    move-exception v2

    .line 239
    .local v2, "e":Ljava/text/ParseException;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 240
    sget-object v1, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid message bytes="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v5, v4

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ":"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v4}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 242
    :cond_7
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->close()V

    .line 243
    new-instance v1, Ljava/io/IOException;

    const-string v3, "Error parsing incoming SCTP message"

    invoke-direct {v1, v3, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 4
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 181
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 182
    .local v0, "msg":[B
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getPeerInetAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->getPeerPort()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->sendMessage([BLjava/net/InetAddress;IZ)V

    .line 183
    return-void
.end method

.method protected sendMessage([BLjava/net/InetAddress;IZ)V
    .locals 4
    .param p1, "message"    # [B
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .param p4, "reconnectFlag"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 189
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 190
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->peerAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v0

    if-ne p3, v0, :cond_1

    .line 193
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->channel:Lcom/sun/nio/sctp/SctpChannel;

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->messageInfo:Lcom/sun/nio/sctp/MessageInfo;

    invoke-virtual {v0, v1, v2}, Lcom/sun/nio/sctp/SctpChannel;->send(Ljava/nio/ByteBuffer;Lcom/sun/nio/sctp/MessageInfo;)I

    move-result v0

    .line 194
    .local v0, "nBytes":I
    sget-object v1, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 195
    sget-object v1, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "SCTP bytes sent:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 197
    :cond_0
    return-void

    .line 190
    .end local v0    # "nBytes":I
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 189
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method protected uncache()V
    .locals 1

    .line 410
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->processor:Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;

    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->removeChannel(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;)V

    .line 411
    return-void
.end method
