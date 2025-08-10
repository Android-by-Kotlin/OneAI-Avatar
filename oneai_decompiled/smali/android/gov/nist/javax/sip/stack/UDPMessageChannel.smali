.class public Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;
.super Landroid/gov/nist/javax/sip/stack/MessageChannel;
.source "UDPMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;
.implements Ljava/lang/Runnable;
.implements Landroid/gov/nist/javax/sip/stack/RawMessageChannel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/UDPMessageChannel$PingBackTimerTask;
    }
.end annotation


# static fields
.field private static final logger:Landroid/gov/nist/core/StackLogger;

.field private static pingBackRecord:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/UDPMessageChannel$PingBackTimerTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private incomingPacket:Ljava/net/DatagramPacket;

.field private myAddress:Ljava/lang/String;

.field protected myParser:Landroid/gov/nist/javax/sip/parser/MessageParser;

.field protected myPort:I

.field private mythread:Ljava/lang/Thread;

.field private peerAddress:Ljava/net/InetAddress;

.field private peerPacketSourceAddress:Ljava/net/InetAddress;

.field private peerPacketSourcePort:I

.field private peerPort:I

.field private peerProtocol:Ljava/lang/String;

.field private receptionTime:J

.field protected sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 102
    const-class v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    .line 148
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->pingBackRecord:Ljava/util/Hashtable;

    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;Ljava/lang/String;)V
    .locals 2
    .param p1, "stack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "messageProcessor"    # Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;
    .param p3, "threadName"    # Ljava/lang/String;

    .line 187
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;-><init>()V

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    .line 188
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 189
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 193
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;->createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/MessageParser;

    .line 196
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    .line 198
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myAddress:Ljava/lang/String;

    .line 199
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->getPort()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myPort:I

    .line 201
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    invoke-virtual {v0, p3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 202
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 203
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 205
    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;Ljava/net/DatagramPacket;)V
    .locals 2
    .param p1, "stack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "messageProcessor"    # Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;
    .param p3, "packet"    # Ljava/net/DatagramPacket;

    .line 219
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;-><init>()V

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    .line 221
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->incomingPacket:Ljava/net/DatagramPacket;

    .line 222
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 223
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 227
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;->createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/MessageParser;

    .line 230
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myAddress:Ljava/lang/String;

    .line 231
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->getPort()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myPort:I

    .line 232
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    .line 233
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 235
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 237
    return-void
.end method

.method protected constructor <init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;)V
    .locals 3
    .param p1, "targetAddr"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p4, "messageProcessor"    # Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;

    .line 250
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;-><init>()V

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    .line 251
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 252
    iput p2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    .line 253
    const-string/jumbo v0, "UDP"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerProtocol:Ljava/lang/String;

    .line 254
    iput-object p4, p0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 255
    invoke-virtual {p4}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myAddress:Ljava/lang/String;

    .line 256
    invoke-virtual {p4}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->getPort()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myPort:I

    .line 257
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 260
    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;->createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/MessageParser;

    .line 263
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 264
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Creating message channel "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 268
    :cond_0
    return-void
.end method

.method static synthetic access$000()Ljava/util/Hashtable;
    .locals 1

    .line 100
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->pingBackRecord:Ljava/util/Hashtable;

    return-object v0
.end method

.method static synthetic access$100()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 100
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method private processIncomingDataPacket(Ljava/net/DatagramPacket;)V
    .locals 20
    .param p1, "packet"    # Ljava/net/DatagramPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 346
    move-object/from16 v7, p0

    const-string/jumbo v0, "rport"

    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    iput-object v1, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 347
    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getLength()I

    move-result v8

    .line 349
    .local v8, "packetLength":I
    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v9

    .line 350
    .local v9, "bytes":[B
    new-array v10, v8, [B

    .line 351
    .local v10, "msgBytes":[B
    const/4 v11, 0x0

    invoke-static {v9, v11, v10, v11, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 354
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v12, 0x20

    invoke-interface {v1, v12}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 355
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "UDPMessageChannel: processIncomingDataPacket : peerAddress = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Length = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 362
    :cond_0
    const/4 v1, 0x0

    .line 364
    .local v1, "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->receptionTime:J

    .line 365
    iget-object v2, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myParser:Landroid/gov/nist/javax/sip/parser/MessageParser;

    const/4 v3, 0x1

    invoke-interface {v2, v10, v3, v11, v7}, Landroid/gov/nist/javax/sip/parser/MessageParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v2
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_2

    move-object v13, v2

    .line 367
    .end local v1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .local v13, "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :try_start_1
    instance-of v1, v13, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_3

    .line 368
    move-object v1, v13

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestLine()Landroid/gov/nist/javax/sip/header/RequestLine;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RequestLine;->getSipVersion()Ljava/lang/String;

    move-result-object v1

    move-object v14, v1

    .line 369
    .local v14, "sipVersion":Ljava/lang/String;
    const-string/jumbo v1, "SIP/2.0"

    invoke-virtual {v14, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 370
    move-object v0, v13

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1f9

    invoke-virtual {v0, v2, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(ILjava/lang/String;)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 371
    .local v0, "versionNotSupported":Landroid/javax/sip/message/Response;
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    iget-object v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v4

    const-string/jumbo v5, "UDP"

    const/4 v6, 0x0

    move-object/from16 v1, p0

    invoke-virtual/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sendMessage([BLjava/net/InetAddress;ILjava/lang/String;Z)V

    .line 372
    return-void

    .line 374
    .end local v0    # "versionNotSupported":Landroid/javax/sip/message/Response;
    :cond_1
    move-object v1, v13

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    move-object v15, v1

    .line 375
    .local v15, "method":Ljava/lang/String;
    move-object v1, v13

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeqHeader()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v1

    move-object v6, v1

    .line 378
    .local v6, "cseqMethod":Ljava/lang/String;
    invoke-virtual {v15, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 379
    move-object v0, v13

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    const/16 v1, 0x190

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 381
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 383
    .local v2, "resp":[B
    iget-object v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v4

    const-string/jumbo v5, "UDP"

    const/16 v16, 0x0

    move-object/from16 v1, p0

    move-object/from16 v17, v6

    .end local v6    # "cseqMethod":Ljava/lang/String;
    .local v17, "cseqMethod":Ljava/lang/String;
    move/from16 v6, v16

    invoke-virtual/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sendMessage([BLjava/net/InetAddress;ILjava/lang/String;Z)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    .line 384
    return-void

    .line 378
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v2    # "resp":[B
    .end local v17    # "cseqMethod":Ljava/lang/String;
    .restart local v6    # "cseqMethod":Ljava/lang/String;
    :cond_2
    move-object/from16 v17, v6

    .line 424
    .end local v6    # "cseqMethod":Ljava/lang/String;
    .end local v14    # "sipVersion":Ljava/lang/String;
    .end local v15    # "method":Ljava/lang/String;
    :cond_3
    nop

    .line 429
    if-nez v13, :cond_6

    .line 430
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 431
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "Rejecting message !  + Null message parsed."

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 434
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 436
    .local v0, "key":Ljava/lang/String;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->pingBackRecord:Ljava/util/Hashtable;

    invoke-virtual {v1, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_5

    iget-object v1, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMinKeepAliveInterval()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_5

    .line 438
    const-string v1, "\r\n\r\n"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 439
    .local v1, "retval":[B
    new-instance v2, Ljava/net/DatagramPacket;

    array-length v3, v1

    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v18

    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v19

    const/16 v16, 0x0

    move-object v14, v2

    move-object v15, v1

    move/from16 v17, v3

    invoke-direct/range {v14 .. v19}, Ljava/net/DatagramPacket;-><init>([BIILjava/net/InetAddress;I)V

    .line 441
    .local v2, "keepalive":Ljava/net/DatagramPacket;
    new-instance v3, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel$PingBackTimerTask;

    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v5

    invoke-direct {v3, v7, v4, v5}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel$PingBackTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;Ljava/lang/String;I)V

    .line 443
    .local v3, "task":Landroid/gov/nist/javax/sip/stack/UDPMessageChannel$PingBackTimerTask;
    sget-object v4, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->pingBackRecord:Ljava/util/Hashtable;

    invoke-virtual {v4, v0, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    iget-object v4, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v4

    iget-object v5, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMinKeepAliveInterval()J

    move-result-wide v5

    const-wide/16 v11, 0x3e8

    mul-long/2addr v5, v11

    invoke-interface {v4, v3, v5, v6}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    .line 446
    iget-object v4, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v4, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    invoke-virtual {v4, v2}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 448
    .end local v1    # "retval":[B
    .end local v2    # "keepalive":Ljava/net/DatagramPacket;
    .end local v3    # "task":Landroid/gov/nist/javax/sip/stack/UDPMessageChannel$PingBackTimerTask;
    goto :goto_0

    .line 449
    :cond_5
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Not sending ping back"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 451
    :goto_0
    return-void

    .line 453
    .end local v0    # "key":Ljava/lang/String;
    :cond_6
    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v1

    .line 455
    .local v1, "topMostVia":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v2

    if-eqz v2, :cond_10

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v2

    if-eqz v2, :cond_10

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v2

    if-eqz v2, :cond_10

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v2

    if-eqz v2, :cond_10

    if-nez v1, :cond_7

    goto/16 :goto_3

    .line 473
    :cond_7
    iget-object v2, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v2, :cond_8

    .line 474
    iget-object v2, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    invoke-interface {v2, v13}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->beforeMessage(Landroid/javax/sip/message/Message;)V

    .line 479
    :cond_8
    instance-of v2, v13, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v2, :cond_e

    .line 480
    iget-object v2, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addressResolver:Landroid/gov/nist/core/net/AddressResolver;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getHop()Landroid/javax/sip/address/Hop;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/net/AddressResolver;->resolveAddress(Landroid/javax/sip/address/Hop;)Landroid/javax/sip/address/Hop;

    move-result-object v2

    .line 482
    .local v2, "hop":Landroid/javax/sip/address/Hop;
    invoke-interface {v2}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v3

    iput v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    .line 483
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerProtocol:Ljava/lang/String;

    .line 485
    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v3

    iput-object v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourceAddress:Ljava/net/InetAddress;

    .line 486
    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v3

    iput v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourcePort:I

    .line 488
    :try_start_2
    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v3

    iput-object v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 492
    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/header/Via;->hasParameter(Ljava/lang/String;)Z

    move-result v3

    .line 493
    .local v3, "hasRPort":Z
    iget-object v4, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isPatchRport()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 494
    if-nez v3, :cond_a

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v4

    iget v5, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourcePort:I

    if-eq v4, v5, :cond_a

    .line 496
    sget-object v4, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v12}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 497
    sget-object v4, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "setting rport since viaPort "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " different than peerPacketSourcePort "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourcePort:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " so that the response can be routed back"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 501
    :cond_9
    const/4 v3, 0x1

    .line 503
    :cond_a
    if-nez v3, :cond_b

    invoke-interface {v2}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_c

    .line 506
    :cond_b
    const-string/jumbo v4, "received"

    iget-object v5, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/gov/nist/javax/sip/header/Via;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    :cond_c
    if-eqz v3, :cond_d

    .line 511
    iget v4, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourcePort:I

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v0, v4}, Landroid/gov/nist/javax/sip/header/Via;->setParameter(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_0

    .line 516
    .end local v3    # "hasRPort":Z
    :cond_d
    goto :goto_1

    .line 514
    :catch_0
    move-exception v0

    .line 515
    .local v0, "ex1":Ljava/text/ParseException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 518
    .end local v0    # "ex1":Ljava/text/ParseException;
    .end local v2    # "hop":Landroid/javax/sip/address/Hop;
    :goto_1
    goto :goto_2

    .line 520
    :cond_e
    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourceAddress:Ljava/net/InetAddress;

    .line 521
    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v0

    iput v0, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourcePort:I

    .line 522
    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    .line 523
    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v0

    iput v0, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    .line 524
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerProtocol:Ljava/lang/String;

    .line 527
    :goto_2
    invoke-virtual {v7, v13}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 528
    iget-object v0, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v0, :cond_f

    .line 529
    iget-object v0, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    invoke-interface {v0, v13}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->afterMessage(Landroid/javax/sip/message/Message;)V

    .line 531
    :cond_f
    return-void

    .line 458
    :cond_10
    :goto_3
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v10}, Ljava/lang/String;-><init>([B)V

    .line 459
    .local v0, "badmsg":Ljava/lang/String;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 460
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "bad message "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 462
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ">>> Dropped Bad Msg From = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "To = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "CallId = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "CSeq = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "Via = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getViaHeaders()Landroid/gov/nist/javax/sip/header/ViaList;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 470
    :cond_11
    return-void

    .line 389
    .end local v0    # "badmsg":Ljava/lang/String;
    .end local v1    # "topMostVia":Landroid/gov/nist/javax/sip/header/Via;
    :catch_1
    move-exception v0

    goto :goto_4

    .end local v13    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .local v1, "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :catch_2
    move-exception v0

    move-object v13, v1

    .end local v1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .restart local v13    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :goto_4
    move-object v14, v0

    .line 391
    .local v14, "ex":Ljava/text/ParseException;
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 392
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Rejecting message !  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v10}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v14}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 398
    :cond_12
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v10, v11, v8}, Ljava/lang/String;-><init>([BII)V

    move-object v11, v0

    .line 399
    .local v11, "msgString":Ljava/lang/String;
    const-string/jumbo v0, "SIP/"

    invoke-virtual {v11, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_15

    const-string v0, "ACK "

    invoke-virtual {v11, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 401
    invoke-virtual {v7, v11, v14}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->createBadReqRes(Ljava/lang/String;Ljava/text/ParseException;)Ljava/lang/String;

    move-result-object v15

    .line 402
    .local v15, "badReqRes":Ljava/lang/String;
    if-eqz v15, :cond_14

    .line 403
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 404
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "Sending automatic 400 Bad Request:"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 406
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v15}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 409
    :cond_13
    :try_start_3
    invoke-virtual {v15}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    iget-object v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual/range {p1 .. p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v4

    const-string/jumbo v5, "UDP"

    const/4 v6, 0x0

    move-object/from16 v1, p0

    invoke-virtual/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sendMessage([BLjava/net/InetAddress;ILjava/lang/String;Z)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_5

    .line 411
    :catch_3
    move-exception v0

    .line 412
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 413
    .end local v0    # "e":Ljava/io/IOException;
    :goto_5
    goto :goto_6

    .line 415
    :cond_14
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 416
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "Could not formulate automatic 400 Bad Request"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 423
    .end local v15    # "badReqRes":Ljava/lang/String;
    :cond_15
    :goto_6
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1076
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 1079
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 1080
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->mythread:Ljava/lang/Thread;

    .line 1082
    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "other"    # Ljava/lang/Object;

    .line 1007
    if-nez p1, :cond_0

    .line 1008
    const/4 v0, 0x0

    return v0

    .line 1010
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1011
    const/4 v0, 0x0

    .local v0, "retval":Z
    goto :goto_0

    .line 1013
    .end local v0    # "retval":Z
    :cond_1
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;

    .line 1014
    .local v0, "that":Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    move v0, v1

    .line 1017
    .local v0, "retval":Z
    :goto_0
    return v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .line 965
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 3

    .line 1021
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    const-string/jumbo v2, "UDP"

    invoke-static {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPeerAddress()Ljava/lang/String;
    .locals 1

    .line 992
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPeerInetAddress()Ljava/net/InetAddress;
    .locals 1

    .line 996
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getPeerName()Ljava/lang/String;
    .locals 1

    .line 983
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPeerPacketSourceAddress()Ljava/net/InetAddress;
    .locals 1

    .line 1029
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourceAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getPeerPacketSourcePort()I
    .locals 1

    .line 1025
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourcePort:I

    return v0
.end method

.method public getPeerPort()I
    .locals 1

    .line 1065
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    return v0
.end method

.method public getPeerProtocol()Ljava/lang/String;
    .locals 1

    .line 1069
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerProtocol:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 974
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->getPort()I

    move-result v0

    return v0
.end method

.method public getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1

    .line 947
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    return-object v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 956
    const-string/jumbo v0, "udp"

    return-object v0
.end method

.method public getViaHost()Ljava/lang/String;
    .locals 1

    .line 1038
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getViaPort()I
    .locals 1

    .line 1047
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myPort:I

    return v0
.end method

.method public handleException(Ljava/text/ParseException;Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
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

    .line 678
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 679
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Parsing Issue "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 681
    :cond_0
    if-eqz p3, :cond_3

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

    const-class v0, Landroid/gov/nist/javax/sip/header/ContentLength;

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

    if-eqz v0, :cond_3

    .line 689
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 690
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BAD MESSAGE! "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 693
    :cond_2
    throw p1

    .line 695
    :cond_3
    invoke-virtual {p2, p4}, Landroid/gov/nist/javax/sip/message/SIPMessage;->addUnparsed(Ljava/lang/String;)V

    .line 697
    return-void
.end method

.method public isReliable()Z
    .locals 1

    .line 1054
    const/4 v0, 0x0

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .line 1061
    const/4 v0, 0x0

    return v0
.end method

.method public processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 12
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 539
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemoteAddress(Ljava/net/InetAddress;)V

    .line 540
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getPeerPort()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemotePort(I)V

    .line 541
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getPort()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalPort(I)V

    .line 542
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalAddress(Ljava/net/InetAddress;)V

    .line 544
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    const-string v2, ":"

    if-eqz v0, :cond_0

    .line 545
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Setting SIPMessage peerPacketSource to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourceAddress:Ljava/net/InetAddress;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourcePort:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 547
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourceAddress:Ljava/net/InetAddress;

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setPeerPacketSourceAddress(Ljava/net/InetAddress;)V

    .line 548
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPacketSourcePort:I

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setPeerPacketSourcePort(I)V

    .line 550
    instance-of v0, p1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    const/16 v3, 0x20

    if-eqz v0, :cond_9

    .line 551
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 556
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    sget-object v4, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 559
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverLogger:Landroid/gov/nist/core/ServerLogger;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getPeerHostPort()Landroid/gov/nist/core/HostPort;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/core/HostPort;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myPort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    iget-wide v9, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->receptionTime:J

    move-object v5, p1

    invoke-interface/range {v4 .. v10}, Landroid/gov/nist/core/ServerLogger;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;ZJ)V

    .line 564
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1, v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->newSIPServerRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    move-result-object v1

    .line 567
    .local v1, "sipServerRequest":Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    if-nez v1, :cond_3

    .line 568
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 569
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Null request interface returned -- dropping request"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 574
    :cond_2
    return-void

    .line 576
    :cond_3
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    const-string v4, "/"

    if-eqz v2, :cond_4

    .line 577
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "About to process "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 581
    :cond_4
    :try_start_0
    invoke-interface {v1, v0, p0}, Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;->processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 583
    instance-of v2, v1, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v2, :cond_6

    .line 584
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 585
    .local v2, "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    move-result v5

    if-nez v5, :cond_5

    .line 586
    move-object v5, v1

    check-cast v5, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v5}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    .line 588
    .end local v2    # "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_5
    nop

    .line 590
    :cond_6
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 591
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Done processing "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 598
    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v1    # "sipServerRequest":Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    :cond_7
    goto/16 :goto_0

    .line 583
    .restart local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v1    # "sipServerRequest":Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    :catchall_0
    move-exception v2

    instance-of v3, v1, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v3, :cond_8

    .line 584
    move-object v3, v1

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 585
    .local v3, "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    move-result v4

    if-nez v4, :cond_8

    .line 586
    move-object v4, v1

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    .line 588
    .end local v3    # "sipServerTx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_8
    throw v2

    .line 600
    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v1    # "sipServerRequest":Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    :cond_9
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 602
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :try_start_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->checkHeaders()V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0

    .line 609
    nop

    .line 610
    sget-object v4, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 613
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverLogger:Landroid/gov/nist/core/ServerLogger;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getPeerHostPort()Landroid/gov/nist/core/HostPort;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/core/HostPort;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->myPort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    iget-wide v10, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->receptionTime:J

    move-object v6, v0

    invoke-interface/range {v5 .. v11}, Landroid/gov/nist/core/ServerLogger;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;ZJ)V

    .line 618
    :cond_a
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1, v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->newSIPServerResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    move-result-object v1

    .line 620
    .local v1, "sipServerResponse":Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    if-eqz v1, :cond_10

    .line 622
    :try_start_2
    instance-of v2, v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    if-eqz v2, :cond_d

    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v2, v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->checkFromTag(Landroid/gov/nist/javax/sip/message/SIPResponse;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 625
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 626
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Dropping response message with invalid tag >>> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 634
    :cond_b
    instance-of v2, v1, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v2, :cond_c

    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->passToListener()Z

    move-result v2

    if-nez v2, :cond_c

    .line 637
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    :cond_c
    return-void

    .line 632
    :cond_d
    :try_start_3
    invoke-interface {v1, v0, p0}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 634
    instance-of v2, v1, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v2, :cond_e

    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->passToListener()Z

    move-result v2

    if-nez v2, :cond_e

    .line 637
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    :cond_e
    goto :goto_0

    .line 634
    :catchall_1
    move-exception v2

    instance-of v3, v1, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v3, :cond_f

    move-object v3, v1

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->passToListener()Z

    move-result v3

    if-nez v3, :cond_f

    .line 637
    move-object v3, v1

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    :cond_f
    throw v2

    .line 642
    :cond_10
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 643
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "null sipServerResponse as could not acquire semaphore or the valve dropped the message."

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 649
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v1    # "sipServerResponse":Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    :cond_11
    :goto_0
    return-void

    .line 603
    .restart local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :catch_0
    move-exception v1

    .line 604
    .local v1, "ex":Ljava/text/ParseException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 605
    sget-object v2, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Dropping Badly formatted response message >>> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 608
    :cond_12
    return-void
.end method

.method public run()V
    .locals 9

    .line 275
    const/4 v0, 0x0

    .line 277
    .local v0, "threadHandle":Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v1, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;

    .line 281
    .local v1, "udpMessageProcessor":Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;
    :goto_0
    const/4 v2, 0x0

    .line 283
    .local v2, "packet":Ljava/net/DatagramPacket;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v3, v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPoolSize:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_6

    .line 286
    if-nez v0, :cond_0

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 287
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/core/ThreadAuditor;->addCurrentThread()Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    move-result-object v0

    .line 292
    :cond_0
    if-eqz v0, :cond_1

    .line 293
    invoke-virtual {v0}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;->ping()V

    .line 296
    :cond_1
    const/4 v3, 0x0

    .line 299
    .local v3, "work":Landroid/gov/nist/javax/sip/stack/DatagramQueuedMessageDispatch;
    if-eqz v0, :cond_2

    :try_start_0
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v5

    invoke-virtual {v5}, Landroid/gov/nist/core/ThreadAuditor;->isEnabled()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 300
    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->messageQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-virtual {v0}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;->getPingIntervalInMillisecs()J

    move-result-wide v6

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v5, v6, v7, v8}, Ljava/util/concurrent/BlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/stack/DatagramQueuedMessageDispatch;

    move-object v3, v5

    goto :goto_1

    .line 303
    :cond_2
    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->messageQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v5}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/stack/DatagramQueuedMessageDispatch;

    move-object v3, v5

    .line 305
    :goto_1
    iget-boolean v5, v1, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->isRunning:Z

    if-nez v5, :cond_3

    .line 306
    return-void

    .line 308
    :cond_3
    if-nez v3, :cond_4

    .line 309
    goto :goto_0

    .line 311
    :cond_4
    iget-object v5, v3, Landroid/gov/nist/javax/sip/stack/DatagramQueuedMessageDispatch;->packet:Ljava/net/DatagramPacket;

    move-object v2, v5

    .line 312
    iget-object v5, v3, Landroid/gov/nist/javax/sip/stack/DatagramQueuedMessageDispatch;->packet:Ljava/net/DatagramPacket;

    iput-object v5, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->incomingPacket:Ljava/net/DatagramPacket;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3    # "work":Landroid/gov/nist/javax/sip/stack/DatagramQueuedMessageDispatch;
    goto :goto_2

    .line 314
    :catch_0
    move-exception v3

    .line 315
    .local v3, "ex":Ljava/lang/InterruptedException;
    iget-boolean v5, v1, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->isRunning:Z

    if-nez v5, :cond_5

    .line 316
    return-void

    .line 318
    .end local v3    # "ex":Ljava/lang/InterruptedException;
    :cond_5
    :goto_2
    goto :goto_3

    .line 320
    :cond_6
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->incomingPacket:Ljava/net/DatagramPacket;

    .line 325
    :goto_3
    :try_start_1
    invoke-direct {p0, v2}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->processIncomingDataPacket(Ljava/net/DatagramPacket;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 330
    goto :goto_4

    .line 326
    :catch_1
    move-exception v3

    .line 328
    .local v3, "e":Ljava/lang/Exception;
    sget-object v5, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error while processing incoming UDP packet"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 332
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_4
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v3, v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPoolSize:I

    if-ne v3, v4, :cond_7

    .line 333
    return-void

    .line 335
    .end local v2    # "packet":Ljava/net/DatagramPacket;
    :cond_7
    goto/16 :goto_0
.end method

.method public sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 19
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 709
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    const-string v9, "An exception occured while sending message"

    const-string/jumbo v10, "Sent EMPTY Message"

    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v11, 0x10

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isLogStackTraceOnMessageSend()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 711
    instance-of v0, v8, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v0, :cond_0

    move-object v0, v8

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestLine()Landroid/gov/nist/javax/sip/header/RequestLine;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 716
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logStackTrace(I)V

    goto :goto_0

    .line 719
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logStackTrace(I)V

    .line 727
    :cond_1
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 729
    .local v12, "time":J
    const/16 v14, 0x20

    :try_start_0
    iget-object v0, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageProcessors()[Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    .local v0, "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    array-length v1, v0

    move v15, v1

    .local v15, "len$":I
    const/4 v1, 0x0

    move v5, v1

    .local v5, "i$":I
    :goto_1
    if-ge v5, v15, :cond_7

    aget-object v1, v0, v5

    move-object v6, v1

    .line 731
    .local v6, "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v1

    iget-object v2, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v1, v2}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v1

    iget v2, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    if-ne v1, v2, :cond_6

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerProtocol:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 735
    iget-object v1, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    invoke-virtual {v6, v1, v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v1

    move-object v4, v1

    .line 738
    .local v4, "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    nop

    instance-of v1, v4, Landroid/gov/nist/javax/sip/stack/RawMessageChannel;

    if-eqz v1, :cond_5

    .line 740
    move-object v1, v4

    check-cast v1, Landroid/gov/nist/javax/sip/stack/RawMessageChannel;

    move-object v3, v1

    .line 741
    .local v3, "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    new-instance v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel$1;

    invoke-direct {v1, v7, v3, v8}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel$1;-><init>(Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;Landroid/gov/nist/javax/sip/stack/RawMessageChannel;Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    move-object v2, v1

    .line 762
    .local v2, "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 764
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v14}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 765
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v14, "Self routing message"

    invoke-interface {v1, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 791
    :cond_2
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v11}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->isNullRequest()Z

    move-result v1

    if-nez v1, :cond_3

    .line 794
    iget-object v9, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v10, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    move-object/from16 v1, p0

    move-object v11, v2

    .end local v2    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    .local v11, "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    move-object/from16 v2, p1

    move-object v14, v3

    .end local v3    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .local v14, "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    move-object v3, v9

    move-object/from16 v16, v4

    .end local v4    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .local v16, "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    move v4, v10

    move/from16 v17, v5

    move-object/from16 v18, v6

    .end local v5    # "i$":I
    .end local v6    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .local v17, "i$":I
    .local v18, "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    move-wide v5, v12

    invoke-virtual/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V

    goto :goto_2

    .line 791
    .end local v11    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    .end local v14    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .end local v16    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .end local v17    # "i$":I
    .end local v18    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .restart local v2    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    .restart local v3    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .restart local v4    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .restart local v5    # "i$":I
    .restart local v6    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :cond_3
    move-object v11, v2

    move-object v14, v3

    move-object/from16 v16, v4

    move/from16 v17, v5

    move-object/from16 v18, v6

    .line 795
    .end local v2    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    .end local v3    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .end local v4    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .end local v5    # "i$":I
    .end local v6    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .restart local v11    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    .restart local v14    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .restart local v16    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .restart local v17    # "i$":I
    .restart local v18    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 797
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_4
    :goto_2
    return-void

    .line 738
    .end local v11    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    .end local v14    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .end local v16    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .end local v17    # "i$":I
    .end local v18    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .restart local v4    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .restart local v5    # "i$":I
    .restart local v6    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :cond_5
    move-object/from16 v16, v4

    move/from16 v17, v5

    move-object/from16 v18, v6

    .end local v4    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .end local v5    # "i$":I
    .end local v6    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .restart local v16    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .restart local v17    # "i$":I
    .restart local v18    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    goto :goto_3

    .line 731
    .end local v16    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .end local v17    # "i$":I
    .end local v18    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .restart local v5    # "i$":I
    .restart local v6    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :cond_6
    move/from16 v17, v5

    move-object/from16 v18, v6

    .line 729
    .end local v5    # "i$":I
    .end local v6    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .restart local v17    # "i$":I
    :goto_3
    add-int/lit8 v5, v17, 0x1

    const/16 v14, 0x20

    .end local v17    # "i$":I
    .restart local v5    # "i$":I
    goto/16 :goto_1

    :cond_7
    move/from16 v17, v5

    .line 772
    .end local v0    # "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v5    # "i$":I
    .end local v15    # "len$":I
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 774
    .local v2, "msg":[B
    iget-object v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v4, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    iget-object v5, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerProtocol:Ljava/lang/String;

    instance-of v6, v8, Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-object/from16 v1, p0

    invoke-virtual/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sendMessage([BLjava/net/InetAddress;ILjava/lang/String;Z)V

    .line 779
    iget-object v0, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v8, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemoteAddress(Ljava/net/InetAddress;)V

    .line 780
    iget v0, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    invoke-virtual {v8, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemotePort(I)V

    .line 781
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getPort()I

    move-result v0

    invoke-virtual {v8, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalPort(I)V

    .line 782
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalAddress(Ljava/net/InetAddress;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 791
    .end local v2    # "msg":[B
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->isNullRequest()Z

    move-result v0

    if-nez v0, :cond_8

    .line 794
    iget-object v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v4, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-wide v5, v12

    invoke-virtual/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V

    goto :goto_4

    .line 795
    :cond_8
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 797
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 799
    :cond_9
    :goto_4
    return-void

    .line 791
    :catchall_0
    move-exception v0

    goto :goto_5

    .line 786
    :catch_0
    move-exception v0

    .line 787
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_2
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v9, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 789
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v12    # "time":J
    .end local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    throw v1

    .line 784
    .end local v0    # "ex":Ljava/lang/Exception;
    .restart local v12    # "time":J
    .restart local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :catch_1
    move-exception v0

    .line 785
    .local v0, "ex":Ljava/io/IOException;
    nop

    .end local v12    # "time":J
    .end local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 791
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v12    # "time":J
    .restart local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :goto_5
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v11}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->isNullRequest()Z

    move-result v1

    if-eqz v1, :cond_a

    goto :goto_6

    .line 794
    :cond_a
    iget-object v3, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v4, v7, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->peerPort:I

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-wide v5, v12

    invoke-virtual/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V

    goto :goto_7

    .line 795
    :cond_b
    :goto_6
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 797
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_c
    :goto_7
    throw v0
.end method

.method protected sendMessage([BLjava/net/InetAddress;ILjava/lang/String;Z)V
    .locals 9
    .param p1, "msg"    # [B
    .param p2, "peerAddress"    # Ljava/net/InetAddress;
    .param p3, "peerPort"    # I
    .param p4, "peerProtocol"    # Ljava/lang/String;
    .param p5, "retry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 888
    const/4 v0, -0x1

    const/16 v1, 0x20

    if-ne p3, v0, :cond_1

    .line 889
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 890
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":sendMessage: Dropping reply!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 893
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Receiver port not set "

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 895
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    const-string v2, "\n"

    const-string v3, "/"

    if-eqz v0, :cond_2

    .line 896
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ":sendMessage "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " messageSize = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, p1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 902
    :cond_2
    const-string/jumbo v0, "UDP"

    invoke-virtual {p4, v0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_6

    .line 903
    new-instance v0, Ljava/net/DatagramPacket;

    array-length v4, p1

    invoke-direct {v0, p1, v4, p2, p3}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 908
    .local v0, "reply":Ljava/net/DatagramPacket;
    :try_start_0
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->udpFlag:Z

    if-eqz v4, :cond_3

    .line 909
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v4, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    .local v4, "sock":Ljava/net/DatagramSocket;
    goto :goto_0

    .line 913
    .end local v4    # "sock":Ljava/net/DatagramSocket;
    :cond_3
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getNetworkLayer()Landroid/gov/nist/core/net/NetworkLayer;

    move-result-object v4

    invoke-interface {v4}, Landroid/gov/nist/core/net/NetworkLayer;->createDatagramSocket()Ljava/net/DatagramSocket;

    move-result-object v4

    .line 915
    .restart local v4    # "sock":Ljava/net/DatagramSocket;
    :goto_0
    sget-object v5, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 916
    sget-object v1, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "sendMessage "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 920
    :cond_4
    invoke-virtual {v4, v0}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 921
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->udpFlag:Z

    if-nez v1, :cond_5

    .line 922
    invoke-virtual {v4}, Ljava/net/DatagramSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 927
    .end local v4    # "sock":Ljava/net/DatagramSocket;
    :cond_5
    goto :goto_1

    .line 925
    :catch_0
    move-exception v1

    .line 926
    .local v1, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 929
    .end local v0    # "reply":Ljava/net/DatagramPacket;
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_1
    goto :goto_2

    .line 923
    .restart local v0    # "reply":Ljava/net/DatagramPacket;
    :catch_1
    move-exception v1

    .line 924
    .local v1, "ex":Ljava/io/IOException;
    throw v1

    .line 931
    .end local v0    # "reply":Ljava/net/DatagramPacket;
    .end local v1    # "ex":Ljava/io/IOException;
    :cond_6
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v1, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    const-string/jumbo v5, "tcp"

    move-object v3, p2

    move v4, p3

    move-object v6, p1

    move v7, p5

    move-object v8, p0

    invoke-virtual/range {v1 .. v8}, Landroid/gov/nist/javax/sip/stack/IOHandler;->sendBytes(Ljava/net/InetAddress;Ljava/net/InetAddress;ILjava/lang/String;[BZLandroid/gov/nist/javax/sip/stack/MessageChannel;)Ljava/net/Socket;

    move-result-object v0

    .line 934
    .local v0, "outputSocket":Ljava/net/Socket;
    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 935
    .local v1, "myOutputStream":Ljava/io/OutputStream;
    const/4 v2, 0x0

    array-length v3, p1

    invoke-virtual {v1, p1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 936
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 939
    .end local v0    # "outputSocket":Ljava/net/Socket;
    .end local v1    # "myOutputStream":Ljava/io/OutputStream;
    :goto_2
    return-void
.end method

.method protected sendMessage([BLjava/net/InetAddress;IZ)V
    .locals 3
    .param p1, "msg"    # [B
    .param p2, "peerAddress"    # Ljava/net/InetAddress;
    .param p3, "peerPort"    # I
    .param p4, "reConnect"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 816
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isLogStackTraceOnMessageSend()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 818
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace(I)V

    .line 821
    :cond_0
    const/4 v0, -0x1

    const/16 v1, 0x20

    if-ne p3, v0, :cond_2

    .line 822
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 823
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":sendMessage: Dropping reply!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 826
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Receiver port not set "

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 828
    :cond_2
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 829
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sendMessage "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "messageSize =  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " message = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 833
    sget-object v0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "*******************\n"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 838
    :cond_3
    new-instance v0, Ljava/net/DatagramPacket;

    array-length v1, p1

    invoke-direct {v0, p1, v1, p2, p3}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 842
    .local v0, "reply":Ljava/net/DatagramPacket;
    const/4 v1, 0x0

    .line 844
    .local v1, "created":Z
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->udpFlag:Z

    if-eqz v2, :cond_4

    .line 849
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    .local v2, "sock":Ljava/net/DatagramSocket;
    goto :goto_0

    .line 857
    .end local v2    # "sock":Ljava/net/DatagramSocket;
    :cond_4
    new-instance v2, Ljava/net/DatagramSocket;

    invoke-direct {v2}, Ljava/net/DatagramSocket;-><init>()V

    .line 858
    .restart local v2    # "sock":Ljava/net/DatagramSocket;
    const/4 v1, 0x1

    .line 860
    :goto_0
    invoke-virtual {v2, v0}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 861
    if-eqz v1, :cond_5

    .line 862
    invoke-virtual {v2}, Ljava/net/DatagramSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 867
    .end local v1    # "created":Z
    .end local v2    # "sock":Ljava/net/DatagramSocket;
    :cond_5
    goto :goto_1

    .line 865
    :catch_0
    move-exception v1

    .line 866
    .local v1, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 868
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 863
    :catch_1
    move-exception v1

    .line 864
    .local v1, "ex":Ljava/io/IOException;
    throw v1
.end method
