.class public abstract Landroid/gov/nist/javax/sip/stack/MessageChannel;
.super Ljava/lang/Object;
.source "MessageChannel.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;

.field static messageTxId:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private encapsulatedClientTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

.field protected transient messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

.field protected useCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 76
    const-class v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    .line 208
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageTxId:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 74
    sget-object v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method private static final copyHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)Z
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "fromReq"    # Ljava/lang/String;
    .param p2, "buf"    # Ljava/lang/StringBuilder;

    .line 506
    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 507
    .local v0, "start":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 508
    const-string v2, "\r\n"

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 509
    .local v2, "end":I
    if-eq v2, v1, :cond_0

    .line 511
    add-int/lit8 v1, v0, -0x2

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 513
    const/4 v1, 0x1

    return v1

    .line 516
    .end local v2    # "end":I
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method private static final copyViaHeaders(Ljava/lang/String;Ljava/lang/StringBuilder;)Z
    .locals 5
    .param p0, "fromReq"    # Ljava/lang/String;
    .param p1, "buf"    # Ljava/lang/StringBuilder;

    .line 529
    const-string/jumbo v0, "Via"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 530
    .local v1, "start":I
    const/4 v2, 0x0

    .line 531
    .local v2, "found":Z
    :goto_0
    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    .line 532
    const-string v4, "\r\n"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 533
    .local v4, "end":I
    if-eq v4, v3, :cond_0

    .line 535
    add-int/lit8 v3, v1, -0x2

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 537
    const/4 v2, 0x1

    .line 538
    invoke-virtual {p0, v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 542
    .end local v4    # "end":I
    goto :goto_0

    .line 540
    .restart local v4    # "end":I
    :cond_0
    const/4 v0, 0x0

    return v0

    .line 543
    .end local v4    # "end":I
    :cond_1
    return v2
.end method

.method public static getKey(Landroid/gov/nist/core/HostPort;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "hostPort"    # Landroid/gov/nist/core/HostPort;
    .param p1, "transport"    # Ljava/lang/String;

    .line 339
    invoke-virtual {p0}, Landroid/gov/nist/core/HostPort;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/core/Host;->getIpAddress()Ljava/lang/String;

    move-result-object v0

    .line 340
    .local v0, "ipAddress":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 341
    invoke-virtual {p0}, Landroid/gov/nist/core/HostPort;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/core/Host;->getHostname()Ljava/lang/String;

    move-result-object v0

    .line 343
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, "[\\[\\]]"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getKey(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "inetAddr"    # Ljava/net/InetAddress;
    .param p1, "port"    # I
    .param p2, "transport"    # Ljava/lang/String;

    .line 331
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "[\\[\\]]"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public abstract close()V
.end method

.method protected final createBadReqRes(Ljava/lang/String;Ljava/text/ParseException;)Ljava/lang/String;
    .locals 8
    .param p1, "badReq"    # Ljava/lang/String;
    .param p2, "pe"    # Ljava/text/ParseException;

    .line 446
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x200

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 447
    .local v0, "buf":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "SIP/2.0 400 Bad Request ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/text/ParseException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 450
    invoke-static {p1, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->copyViaHeaders(Ljava/lang/String;Ljava/lang/StringBuilder;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 451
    return-object v2

    .line 452
    :cond_0
    const-string v1, "CSeq"

    invoke-static {v1, p1, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->copyHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 453
    return-object v2

    .line 454
    :cond_1
    const-string v1, "Call-ID"

    invoke-static {v1, p1, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->copyHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 455
    return-object v2

    .line 456
    :cond_2
    const-string v1, "From"

    invoke-static {v1, p1, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->copyHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 457
    return-object v2

    .line 458
    :cond_3
    const-string/jumbo v1, "To"

    invoke-static {v1, p1, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->copyHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 459
    return-object v2

    .line 462
    :cond_4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 463
    .local v1, "toStart":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_5

    const-string/jumbo v3, "tag"

    invoke-virtual {v0, v3, v1}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v2, :cond_5

    .line 464
    const-string v2, ";tag=badreq"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 468
    :cond_5
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;

    move-result-object v2

    .line 469
    .local v2, "s":Landroid/javax/sip/header/ServerHeader;
    const-string v3, "\r\n"

    if-eqz v2, :cond_6

    .line 470
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 472
    :cond_6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 473
    .local v4, "clength":I
    instance-of v5, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageChannel;

    if-eqz v5, :cond_8

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/2addr v5, v4

    const-string v6, "Content-Type"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, ": message/sipfrag\r\n"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    const-string v6, "Content-Length"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    const/16 v6, 0x514

    if-ge v5, v6, :cond_7

    goto :goto_0

    .line 487
    :cond_7
    new-instance v5, Landroid/gov/nist/javax/sip/header/ContentLength;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Landroid/gov/nist/javax/sip/header/ContentLength;-><init>(I)V

    .line 488
    .local v5, "clengthHeader":Landroid/gov/nist/javax/sip/header/ContentLength;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/ContentLength;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 481
    .end local v5    # "clengthHeader":Landroid/gov/nist/javax/sip/header/ContentLength;
    :cond_8
    :goto_0
    new-instance v5, Landroid/gov/nist/javax/sip/header/ContentType;

    const-string/jumbo v6, "message"

    const-string/jumbo v7, "sipfrag"

    invoke-direct {v5, v6, v7}, Landroid/gov/nist/javax/sip/header/ContentType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    .local v5, "cth":Landroid/javax/sip/header/ContentTypeHeader;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    new-instance v6, Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-direct {v6, v4}, Landroid/gov/nist/javax/sip/header/ContentLength;-><init>(I)V

    .line 484
    .local v6, "clengthHeader":Landroid/gov/nist/javax/sip/header/ContentLength;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/header/ContentLength;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\r\n\r\n"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 486
    .end local v5    # "cth":Landroid/javax/sip/header/ContentTypeHeader;
    .end local v6    # "clengthHeader":Landroid/gov/nist/javax/sip/header/ContentLength;
    nop

    .line 491
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getEncapsulatedClientTransaction()Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .locals 1

    .line 554
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->encapsulatedClientTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .line 189
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHostPort()Landroid/gov/nist/core/HostPort;
    .locals 3

    .line 351
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    .line 352
    .local v0, "retval":Landroid/gov/nist/core/HostPort;
    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 353
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/HostPort;->setPort(I)V

    .line 354
    return-object v0
.end method

.method public abstract getKey()Ljava/lang/String;
.end method

.method public getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .locals 1

    .line 550
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    return-object v0
.end method

.method public abstract getPeerAddress()Ljava/lang/String;
.end method

.method public getPeerHostPort()Landroid/gov/nist/core/HostPort;
    .locals 3

    .line 363
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    .line 364
    .local v0, "retval":Landroid/gov/nist/core/HostPort;
    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerAddress()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 365
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerPort()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/HostPort;->setPort(I)V

    .line 366
    return-object v0
.end method

.method protected abstract getPeerInetAddress()Ljava/net/InetAddress;
.end method

.method public abstract getPeerPacketSourceAddress()Ljava/net/InetAddress;
.end method

.method public abstract getPeerPacketSourcePort()I
.end method

.method public abstract getPeerPort()I
.end method

.method protected abstract getPeerProtocol()Ljava/lang/String;
.end method

.method public getPort()I
    .locals 1

    .line 198
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    if-eqz v0, :cond_0

    .line 199
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v0

    return v0

    .line 201
    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public getRawIpSourceAddress()Ljava/lang/String;
    .locals 4

    .line 315
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerAddress()Ljava/lang/String;

    move-result-object v0

    .line 316
    .local v0, "sourceAddress":Ljava/lang/String;
    const/4 v1, 0x0

    .line 318
    .local v1, "rawIpSourceAddress":Ljava/lang/String;
    :try_start_0
    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    .line 319
    .local v2, "sourceInetAddress":Ljava/net/InetAddress;
    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v3

    .line 322
    .end local v2    # "sourceInetAddress":Ljava/net/InetAddress;
    goto :goto_0

    .line 320
    :catch_0
    move-exception v2

    .line 321
    .local v2, "ex":Ljava/lang/Exception;
    invoke-static {v2}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 323
    .end local v2    # "ex":Ljava/lang/Exception;
    :goto_0
    return-object v1
.end method

.method public abstract getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
.end method

.method public abstract getTransport()Ljava/lang/String;
.end method

.method public getViaHeader()Landroid/gov/nist/javax/sip/header/Via;
    .locals 2

    .line 377
    new-instance v0, Landroid/gov/nist/javax/sip/header/Via;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Via;-><init>()V

    .line 379
    .local v0, "channelViaHeader":Landroid/gov/nist/javax/sip/header/Via;
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/Via;->setTransport(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 381
    goto :goto_0

    .line 380
    :catch_0
    move-exception v1

    .line 382
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getHostPort()Landroid/gov/nist/core/HostPort;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/Via;->setSentBy(Landroid/gov/nist/core/HostPort;)V

    .line 383
    return-object v0
.end method

.method public abstract getViaHost()Ljava/lang/String;
.end method

.method public getViaHostPort()Landroid/gov/nist/core/HostPort;
    .locals 3

    .line 393
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    .line 394
    .local v0, "retval":Landroid/gov/nist/core/HostPort;
    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getViaHost()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 395
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getViaPort()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/HostPort;->setPort(I)V

    .line 396
    return-object v0
.end method

.method public abstract getViaPort()I
.end method

.method public abstract isReliable()Z
.end method

.method public abstract isSecure()Z
.end method

.method public logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V
    .locals 8
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p2, "address"    # Ljava/net/InetAddress;
    .param p3, "port"    # I
    .param p4, "time"    # J

    .line 407
    sget-object v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 408
    return-void

    .line 411
    :cond_0
    const/4 v0, -0x1

    if-ne p3, v0, :cond_1

    .line 412
    const/16 p3, 0x13c4

    .line 413
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    iget-object v1, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverLogger:Landroid/gov/nist/core/ServerLogger;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPort()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    move-object v2, p1

    move-wide v6, p4

    invoke-interface/range {v1 .. v7}, Landroid/gov/nist/core/ServerLogger;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;ZJ)V

    .line 415
    return-void
.end method

.method public logResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;JLjava/lang/String;)V
    .locals 11
    .param p1, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;
    .param p2, "receptionTime"    # J
    .param p4, "status"    # Ljava/lang/String;

    .line 426
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerPort()I

    move-result v0

    .line 427
    .local v0, "peerport":I
    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 428
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/ContactList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/header/ContactHeader;

    .line 429
    .local v1, "contact":Landroid/javax/sip/header/ContactHeader;
    invoke-interface {v1}, Landroid/javax/sip/header/ContactHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getPort()I

    move-result v0

    .line 432
    .end local v1    # "contact":Landroid/javax/sip/header/ContactHeader;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 433
    .local v1, "from":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 434
    .local v2, "to":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v3

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverLogger:Landroid/gov/nist/core/ServerLogger;

    const/4 v8, 0x0

    move-object v4, p1

    move-object v5, v1

    move-object v6, v2

    move-object v7, p4

    move-wide v9, p2

    invoke-interface/range {v3 .. v10}, Landroid/gov/nist/core/ServerLogger;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V

    .line 436
    return-void
.end method

.method public abstract sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Landroid/javax/sip/address/Hop;)V
    .locals 18
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p2, "hop"    # Landroid/javax/sip/address/Hop;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 219
    .local v9, "time":J
    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v11

    .line 223
    .local v11, "hopAddr":Ljava/net/InetAddress;
    const/16 v1, 0x10

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageProcessors()[Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    .local v0, "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    array-length v2, v0

    move v12, v2

    .local v12, "len$":I
    const/4 v2, 0x0

    move v13, v2

    .local v13, "i$":I
    :goto_0
    if-ge v13, v12, :cond_3

    aget-object v2, v0, v13

    move-object v14, v2

    .line 224
    .local v14, "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    invoke-virtual {v14}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v14}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v2

    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v3

    if-ne v2, v3, :cond_2

    invoke-virtual {v14}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 227
    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v2

    invoke-virtual {v14, v11, v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v2

    move-object v15, v2

    .line 229
    .local v15, "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    nop

    instance-of v2, v15, Landroid/gov/nist/javax/sip/stack/RawMessageChannel;

    if-eqz v2, :cond_2

    .line 230
    move-object v2, v15

    check-cast v2, Landroid/gov/nist/javax/sip/stack/RawMessageChannel;

    move-object v5, v2

    .line 231
    .local v5, "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    new-instance v2, Landroid/gov/nist/javax/sip/stack/MessageChannel$1;

    invoke-direct {v2, v7, v5, v8}, Landroid/gov/nist/javax/sip/stack/MessageChannel$1;-><init>(Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/RawMessageChannel;Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    move-object v6, v2

    .line 247
    .local v6, "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    invoke-interface {v2, v6}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 249
    sget-object v2, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 250
    sget-object v2, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "Self routing message"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 276
    :cond_0
    sget-object v2, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageTxId:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    .line 277
    sget-object v2, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 278
    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v4

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v3, v11

    move-object/from16 v16, v5

    move-object/from16 v17, v6

    .end local v5    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .end local v6    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    .local v16, "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .local v17, "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    move-wide v5, v9

    invoke-virtual/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V

    goto :goto_1

    .line 277
    .end local v16    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .end local v17    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    .restart local v5    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .restart local v6    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    :cond_1
    move-object/from16 v16, v5

    move-object/from16 v17, v6

    .line 278
    .end local v5    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .end local v6    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    .restart local v16    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .restart local v17    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    :goto_1
    return-void

    .line 223
    .end local v14    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v15    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .end local v16    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    .end local v17    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    :cond_2
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_0

    .line 256
    .end local v0    # "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v12    # "len$":I
    .end local v13    # "i$":I
    :cond_3
    :try_start_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageTxId:Ljava/lang/ThreadLocal;

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 257
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 259
    .local v0, "msg":[B
    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v2

    instance-of v3, v8, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v7, v0, v11, v2, v3}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage([BLjava/net/InetAddress;IZ)V

    .line 263
    invoke-virtual {v8, v11}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemoteAddress(Ljava/net/InetAddress;)V

    .line 264
    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v2

    invoke-virtual {v8, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemotePort(I)V

    .line 265
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPort()I

    move-result v2

    invoke-virtual {v8, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalPort(I)V

    .line 266
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalAddress(Ljava/net/InetAddress;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 276
    .end local v0    # "msg":[B
    sget-object v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageTxId:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 277
    sget-object v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 278
    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v4

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v3, v11

    move-wide v5, v9

    invoke-virtual/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V

    .line 280
    :cond_4
    return-void

    .line 276
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 269
    :catch_0
    move-exception v0

    .line 270
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_2
    sget-object v2, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v3, 0x4

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 271
    sget-object v2, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Error self routing message cause by: "

    invoke-interface {v2, v3, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 274
    :cond_5
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Error self routing message"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v9    # "time":J
    .end local v11    # "hopAddr":Ljava/net/InetAddress;
    .end local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .end local p2    # "hop":Landroid/javax/sip/address/Hop;
    throw v2

    .line 267
    .end local v0    # "ex":Ljava/lang/Exception;
    .restart local v9    # "time":J
    .restart local v11    # "hopAddr":Ljava/net/InetAddress;
    .restart local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .restart local p2    # "hop":Landroid/javax/sip/address/Hop;
    :catch_1
    move-exception v0

    .line 268
    .local v0, "ioe":Ljava/io/IOException;
    nop

    .end local v9    # "time":J
    .end local v11    # "hopAddr":Ljava/net/InetAddress;
    .end local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .end local p2    # "hop":Landroid/javax/sip/address/Hop;
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 276
    .end local v0    # "ioe":Ljava/io/IOException;
    .restart local v9    # "time":J
    .restart local v11    # "hopAddr":Ljava/net/InetAddress;
    .restart local p1    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .restart local p2    # "hop":Landroid/javax/sip/address/Hop;
    :goto_2
    sget-object v2, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageTxId:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    .line 277
    sget-object v2, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 278
    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v4

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v3, v11

    move-wide v5, v9

    invoke-virtual/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V

    :cond_6
    throw v0
.end method

.method public sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;I)V
    .locals 9
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 291
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 292
    .local v6, "time":J
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 293
    .local v8, "bytes":[B
    sget-object v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageTxId:Ljava/lang/ThreadLocal;

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTransactionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 295
    :try_start_0
    instance-of v0, p1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {p0, v8, p2, p3, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage([BLjava/net/InetAddress;IZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 297
    sget-object v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageTxId:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 298
    nop

    .line 302
    invoke-virtual {p1, p2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemoteAddress(Ljava/net/InetAddress;)V

    .line 303
    invoke-virtual {p1, p3}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setRemotePort(I)V

    .line 304
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPort()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalPort(I)V

    .line 305
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setLocalAddress(Ljava/net/InetAddress;)V

    .line 308
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, v6

    invoke-virtual/range {v0 .. v5}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V

    .line 309
    return-void

    .line 297
    :catchall_0
    move-exception v0

    sget-object v1, Landroid/gov/nist/javax/sip/stack/MessageChannel;->messageTxId:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    throw v0
.end method

.method protected abstract sendMessage([BLjava/net/InetAddress;IZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public setEncapsulatedClientTransaction(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V
    .locals 0
    .param p1, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 558
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->encapsulatedClientTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 559
    return-void
.end method

.method protected uncache()V
    .locals 0

    .line 86
    return-void
.end method
