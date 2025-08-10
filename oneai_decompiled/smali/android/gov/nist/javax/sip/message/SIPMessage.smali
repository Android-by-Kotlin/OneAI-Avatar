.class public abstract Landroid/gov/nist/javax/sip/message/SIPMessage;
.super Landroid/gov/nist/javax/sip/message/MessageObject;
.source "SIPMessage.java"

# interfaces
.implements Landroid/javax/sip/message/Message;
.implements Landroid/gov/nist/javax/sip/message/MessageExt;


# static fields
.field private static final AUTHORIZATION_LOWERCASE:Ljava/lang/String;

.field private static final CONTACT_LOWERCASE:Ljava/lang/String;

.field private static final CONTENT_DISPOSITION_LOWERCASE:Ljava/lang/String;

.field private static final CONTENT_ENCODING_LOWERCASE:Ljava/lang/String;

.field private static final CONTENT_LANGUAGE_LOWERCASE:Ljava/lang/String;

.field private static final CONTENT_TYPE_LOWERCASE:Ljava/lang/String;

.field private static final ERROR_LOWERCASE:Ljava/lang/String;

.field private static final EXPIRES_LOWERCASE:Ljava/lang/String;

.field private static final RECORDROUTE_LOWERCASE:Ljava/lang/String;

.field private static final ROUTE_LOWERCASE:Ljava/lang/String;

.field private static final VIA_LOWERCASE:Ljava/lang/String;


# instance fields
.field protected applicationData:Ljava/lang/Object;

.field protected cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

.field protected callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

.field private contentEncodingCharset:Ljava/lang/String;

.field protected contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

.field protected forkId:Ljava/lang/String;

.field protected fromHeader:Landroid/gov/nist/javax/sip/header/From;

.field protected headerTable:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/header/SIPHeader;",
            ">;"
        }
    .end annotation
.end field

.field protected headers:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Landroid/gov/nist/javax/sip/header/SIPHeader;",
            ">;"
        }
    .end annotation
.end field

.field private localAddress:Ljava/net/InetAddress;

.field private localPort:I

.field protected maxForwardsHeader:Landroid/gov/nist/javax/sip/header/MaxForwards;

.field protected messageContent:Ljava/lang/String;

.field protected messageContentBytes:[B

.field protected messageContentObject:Ljava/lang/Object;

.field protected nullRequest:Z

.field private peerPacketSourceAddress:Ljava/net/InetAddress;

.field private peerPacketSourcePort:I

.field private remoteAddress:Ljava/net/InetAddress;

.field private remotePort:I

.field protected size:I

.field protected toHeader:Landroid/gov/nist/javax/sip/header/To;

.field protected unrecognizedHeaders:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1013
    const-string v0, "Content-Type"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->CONTENT_TYPE_LOWERCASE:Ljava/lang/String;

    .line 1043
    const-string v0, "Error-Info"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->ERROR_LOWERCASE:Ljava/lang/String;

    .line 1054
    const-string v0, "Contact"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->CONTACT_LOWERCASE:Ljava/lang/String;

    .line 1080
    const-string/jumbo v0, "Via"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->VIA_LOWERCASE:Ljava/lang/String;

    .line 1137
    const-string v0, "Authorization"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->AUTHORIZATION_LOWERCASE:Ljava/lang/String;

    .line 1168
    const-string/jumbo v0, "Route"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->ROUTE_LOWERCASE:Ljava/lang/String;

    .line 1210
    const-string/jumbo v0, "Record-Route"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->RECORDROUTE_LOWERCASE:Ljava/lang/String;

    .line 1707
    const-string v0, "Content-Disposition"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->CONTENT_DISPOSITION_LOWERCASE:Ljava/lang/String;

    .line 1719
    const-string v0, "Content-Encoding"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->CONTENT_ENCODING_LOWERCASE:Ljava/lang/String;

    .line 1731
    const-string v0, "Content-Language"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->CONTENT_LANGUAGE_LOWERCASE:Ljava/lang/String;

    .line 1743
    const-string v0, "Expires"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->EXPIRES_LOWERCASE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 619
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/message/MessageObject;-><init>()V

    .line 138
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultContentEncodingCharset()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentEncodingCharset:Ljava/lang/String;

    .line 620
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->unrecognizedHeaders:Ljava/util/LinkedList;

    .line 621
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 622
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    .line 624
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentLength;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/header/ContentLength;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 626
    goto :goto_0

    .line 625
    :catch_0
    move-exception v0

    .line 627
    :goto_0
    return-void
.end method

.method private attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;)V
    .locals 2
    .param p1, "h"    # Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 635
    if-eqz p1, :cond_1

    .line 638
    :try_start_0
    instance-of v0, p1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-eqz v0, :cond_0

    .line 639
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 640
    .local v0, "hl":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<*>;"
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 641
    return-void

    .line 644
    .end local v0    # "hl":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<*>;"
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;ZZ)V
    :try_end_0
    .catch Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 647
    goto :goto_0

    .line 645
    :catch_0
    move-exception v0

    .line 648
    :goto_0
    return-void

    .line 636
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "null header!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private computeContentLength(Ljava/lang/Object;)V
    .locals 3
    .param p1, "content"    # Ljava/lang/Object;

    .line 1421
    const/4 v0, 0x0

    .line 1422
    .local v0, "length":I
    if-eqz p1, :cond_2

    .line 1423
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 1425
    :try_start_0
    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCharset()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    array-length v1, v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 1428
    :goto_0
    goto :goto_1

    .line 1426
    :catch_0
    move-exception v1

    .line 1427
    .local v1, "ex":Ljava/io/UnsupportedEncodingException;
    invoke-static {v1}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .end local v1    # "ex":Ljava/io/UnsupportedEncodingException;
    goto :goto_0

    .line 1429
    :cond_0
    instance-of v1, p1, [B

    if-eqz v1, :cond_1

    .line 1430
    move-object v1, p1

    check-cast v1, [B

    check-cast v1, [B

    array-length v0, v1

    goto :goto_1

    .line 1432
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    .line 1437
    :cond_2
    :goto_1
    :try_start_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/header/ContentLength;->setContentLength(I)V
    :try_end_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1440
    goto :goto_2

    .line 1438
    :catch_1
    move-exception v1

    .line 1441
    :goto_2
    return-void
.end method

.method private getHeaderList(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1, "headerName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroid/gov/nist/javax/sip/header/SIPHeader;",
            ">;"
        }
    .end annotation

    .line 1506
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-static {p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 1508
    .local v0, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    if-nez v0, :cond_0

    .line 1509
    const/4 v1, 0x0

    return-object v1

    .line 1510
    :cond_0
    instance-of v1, v0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-eqz v1, :cond_1

    .line 1511
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->getHeaderList()Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 1513
    :cond_1
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 1514
    .local v1, "ll":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 1515
    return-object v1
.end method

.method public static isRequestHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    .locals 1
    .param p0, "sipHeader"    # Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 223
    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/InReplyTo;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/Authorization;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/MaxForwards;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/UserAgent;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/Priority;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/ProxyAuthorization;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/ProxyRequire;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/ProxyRequireList;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/Route;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/RouteList;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/Subject;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/SIPIfMatch;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static isResponseHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    .locals 1
    .param p0, "sipHeader"    # Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 238
    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/ErrorInfo;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/ProxyAuthenticate;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/Server;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/Unsupported;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/Warning;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/WWWAuthenticate;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/SIPETag;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/RSeq;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method public addFirst(Landroid/javax/sip/header/Header;)V
    .locals 3
    .param p1, "header"    # Landroid/javax/sip/header/Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;,
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .line 1826
    if-eqz p1, :cond_0

    .line 1830
    :try_start_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeader;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;ZZ)V
    :try_end_0
    .catch Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1833
    nop

    .line 1835
    return-void

    .line 1831
    :catch_0
    move-exception v0

    .line 1832
    .local v0, "ex":Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Cannot add header - header already exists"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1827
    .end local v0    # "ex":Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addHeader(Landroid/javax/sip/header/Header;)V
    .locals 5
    .param p1, "sipHeader"    # Landroid/javax/sip/header/Header;

    .line 1600
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 1602
    .local v0, "sh":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :try_start_0
    instance-of v1, p1, Landroid/javax/sip/header/ViaHeader;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    instance-of v1, p1, Landroid/javax/sip/header/RecordRouteHeader;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1605
    :cond_0
    invoke-virtual {p0, v0, v2, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;ZZ)V

    goto :goto_1

    .line 1603
    :cond_1
    :goto_0
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;ZZ)V
    :try_end_0
    .catch Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1615
    :goto_1
    goto :goto_2

    .line 1607
    :catch_0
    move-exception v1

    .line 1609
    .local v1, "ex":Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
    :try_start_1
    instance-of v2, p1, Landroid/gov/nist/javax/sip/header/ContentLength;

    if-eqz v2, :cond_2

    .line 1610
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/header/ContentLength;

    .line 1611
    .local v2, "cl":Landroid/gov/nist/javax/sip/header/ContentLength;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/ContentLength;->getContentLength()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/header/ContentLength;->setContentLength(I)V
    :try_end_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1614
    .end local v2    # "cl":Landroid/gov/nist/javax/sip/header/ContentLength;
    :cond_2
    goto :goto_2

    .line 1613
    :catch_1
    move-exception v2

    .line 1616
    .end local v1    # "ex":Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
    :goto_2
    return-void
.end method

.method public addHeader(Ljava/lang/String;)V
    .locals 3
    .param p1, "sipHeader"    # Ljava/lang/String;

    .line 1635
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/ParserFactory;->createParser(Ljava/lang/String;)Landroid/gov/nist/javax/sip/parser/HeaderParser;

    move-result-object v0

    .line 1636
    .local v0, "parser":Landroid/gov/nist/javax/sip/parser/HeaderParser;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v1

    .line 1637
    .local v1, "sh":Landroid/gov/nist/javax/sip/header/SIPHeader;
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;Z)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1640
    .end local v0    # "parser":Landroid/gov/nist/javax/sip/parser/HeaderParser;
    .end local v1    # "sh":Landroid/gov/nist/javax/sip/header/SIPHeader;
    goto :goto_0

    .line 1638
    :catch_0
    move-exception v0

    .line 1639
    .local v0, "ex":Ljava/text/ParseException;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getUnrecognizedHeadersList()Ljava/util/LinkedList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 1641
    .end local v0    # "ex":Ljava/text/ParseException;
    :goto_0
    return-void
.end method

.method public addLast(Landroid/javax/sip/header/Header;)V
    .locals 3
    .param p1, "header"    # Landroid/javax/sip/header/Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;,
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .line 1808
    if-eqz p1, :cond_0

    .line 1812
    :try_start_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeader;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;ZZ)V
    :try_end_0
    .catch Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1815
    nop

    .line 1817
    return-void

    .line 1813
    :catch_0
    move-exception v0

    .line 1814
    .local v0, "ex":Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Cannot add header - header already exists"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1809
    .end local v0    # "ex":Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addUnparsed(Ljava/lang/String;)V
    .locals 1
    .param p1, "unparsed"    # Ljava/lang/String;

    .line 1624
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getUnrecognizedHeadersList()Ljava/util/LinkedList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 1625
    return-void
.end method

.method public attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;Z)V
    .locals 1
    .param p1, "h"    # Landroid/gov/nist/javax/sip/header/SIPHeader;
    .param p2, "replaceflag"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
        }
    .end annotation

    .line 700
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;ZZ)V

    .line 701
    return-void
.end method

.method public attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;ZZ)V
    .locals 6
    .param p1, "header"    # Landroid/gov/nist/javax/sip/header/SIPHeader;
    .param p2, "replaceFlag"    # Z
    .param p3, "top"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
        }
    .end annotation

    .line 718
    if-eqz p1, :cond_f

    .line 724
    invoke-static {p1}, Landroid/gov/nist/javax/sip/message/ListMap;->hasList(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-class v0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 725
    invoke-static {p1}, Landroid/gov/nist/javax/sip/message/ListMap;->getList(Landroid/gov/nist/javax/sip/header/SIPHeader;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    move-result-object v0

    .line 726
    .local v0, "hdrList":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 727
    nop

    .line 728
    .local v0, "h":Landroid/gov/nist/javax/sip/header/SIPHeader;
    goto :goto_0

    .line 729
    .end local v0    # "h":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_0
    move-object v0, p1

    .line 732
    .restart local v0    # "h":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :goto_0
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 733
    .local v1, "headerNameLowerCase":Ljava/lang/String;
    if-eqz p2, :cond_1

    .line 734
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 735
    :cond_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    instance-of v2, v0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-nez v2, :cond_3

    .line 736
    instance-of v2, v0, Landroid/gov/nist/javax/sip/header/ContentLength;

    if-eqz v2, :cond_2

    .line 738
    :try_start_0
    move-object v2, v0

    check-cast v2, Landroid/gov/nist/javax/sip/header/ContentLength;

    .line 739
    .local v2, "cl":Landroid/gov/nist/javax/sip/header/ContentLength;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/ContentLength;->getContentLength()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/header/ContentLength;->setContentLength(I)V
    :try_end_0
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 741
    .end local v2    # "cl":Landroid/gov/nist/javax/sip/header/ContentLength;
    goto :goto_1

    .line 740
    :catch_0
    move-exception v2

    .line 744
    :cond_2
    :goto_1
    return-void

    .line 747
    :cond_3
    :goto_2
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 750
    .local v2, "originalHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    if-eqz v2, :cond_5

    .line 751
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 752
    .local v3, "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 753
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 754
    .local v4, "next":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/header/SIPHeader;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 755
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 757
    .end local v4    # "next":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_4
    goto :goto_3

    .line 760
    .end local v3    # "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_5
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 761
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 762
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 764
    :cond_6
    instance-of v3, v0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-eqz v3, :cond_8

    .line 765
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 767
    .local v3, "hdrlist":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<*>;"
    if-eqz v3, :cond_7

    .line 768
    move-object v4, v0

    check-cast v4, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {v3, v4, p3}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->concatenate(Landroid/gov/nist/javax/sip/header/SIPHeaderList;Z)V

    goto :goto_4

    .line 770
    :cond_7
    iget-object v4, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v4, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 771
    .end local v3    # "hdrlist":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<*>;"
    :goto_4
    goto :goto_5

    .line 772
    :cond_8
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 777
    :goto_5
    instance-of v3, v0, Landroid/gov/nist/javax/sip/header/From;

    if-eqz v3, :cond_9

    .line 778
    move-object v3, v0

    check-cast v3, Landroid/gov/nist/javax/sip/header/From;

    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    goto :goto_6

    .line 779
    :cond_9
    instance-of v3, v0, Landroid/gov/nist/javax/sip/header/ContentLength;

    if-eqz v3, :cond_a

    .line 780
    move-object v3, v0

    check-cast v3, Landroid/gov/nist/javax/sip/header/ContentLength;

    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    goto :goto_6

    .line 781
    :cond_a
    instance-of v3, v0, Landroid/gov/nist/javax/sip/header/To;

    if-eqz v3, :cond_b

    .line 782
    move-object v3, v0

    check-cast v3, Landroid/gov/nist/javax/sip/header/To;

    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    goto :goto_6

    .line 783
    :cond_b
    instance-of v3, v0, Landroid/gov/nist/javax/sip/header/CSeq;

    if-eqz v3, :cond_c

    .line 784
    move-object v3, v0

    check-cast v3, Landroid/gov/nist/javax/sip/header/CSeq;

    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    goto :goto_6

    .line 785
    :cond_c
    instance-of v3, v0, Landroid/gov/nist/javax/sip/header/CallID;

    if-eqz v3, :cond_d

    .line 786
    move-object v3, v0

    check-cast v3, Landroid/gov/nist/javax/sip/header/CallID;

    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    goto :goto_6

    .line 787
    :cond_d
    instance-of v3, v0, Landroid/gov/nist/javax/sip/header/MaxForwards;

    if-eqz v3, :cond_e

    .line 788
    move-object v3, v0

    check-cast v3, Landroid/gov/nist/javax/sip/header/MaxForwards;

    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->maxForwardsHeader:Landroid/gov/nist/javax/sip/header/MaxForwards;

    .line 791
    :cond_e
    :goto_6
    return-void

    .line 719
    .end local v0    # "h":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .end local v1    # "headerNameLowerCase":Ljava/lang/String;
    .end local v2    # "originalHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_f
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null header"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public cleanUp()V
    .locals 0

    .line 2009
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 4

    .line 547
    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/MessageObject;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 548
    .local v0, "retval":Landroid/gov/nist/javax/sip/message/SIPMessage;
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    .line 549
    const/4 v1, 0x0

    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    .line 550
    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    .line 551
    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    .line 552
    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    .line 553
    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    .line 554
    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->maxForwardsHeader:Landroid/gov/nist/javax/sip/header/MaxForwards;

    .line 555
    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->forkId:Ljava/lang/String;

    .line 556
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    if-eqz v1, :cond_0

    .line 557
    new-instance v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 558
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 559
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 560
    .local v2, "hdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/SIPHeader;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/SIPHeader;

    invoke-direct {v0, v3}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;)V

    .line 561
    .end local v2    # "hdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    goto :goto_0

    .line 564
    .end local v1    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    if-eqz v1, :cond_1

    .line 565
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    check-cast v1, [B

    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    .line 566
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    if-eqz v1, :cond_2

    .line 567
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    invoke-static {v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->makeClone(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    .line 568
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->unrecognizedHeaders:Ljava/util/LinkedList;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->unrecognizedHeaders:Ljava/util/LinkedList;

    .line 569
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->remoteAddress:Ljava/net/InetAddress;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->remoteAddress:Ljava/net/InetAddress;

    .line 570
    iget v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->remotePort:I

    iput v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->remotePort:I

    .line 571
    return-object v0
.end method

.method public debugDump()Ljava/lang/String;
    .locals 8

    .line 581
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->stringRepresentation:Ljava/lang/String;

    .line 582
    const-string/jumbo v0, "SIPMessage:"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V

    .line 583
    const-string/jumbo v0, "{"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V

    .line 586
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 587
    .local v1, "fields":[Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 588
    aget-object v3, v1, v2

    .line 589
    .local v3, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    .line 590
    .local v4, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    .line 591
    .local v5, "fieldName":Ljava/lang/String;
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_0

    const-class v6, Landroid/gov/nist/javax/sip/header/SIPHeader;

    invoke-virtual {v6, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_0

    const-string/jumbo v6, "headers"

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v6

    if-eqz v6, :cond_0

    .line 593
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V

    .line 594
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/header/SIPHeader;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/header/SIPHeader;->debugDump()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 587
    .end local v3    # "f":Ljava/lang/reflect/Field;
    .end local v4    # "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "fieldName":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 599
    .end local v1    # "fields":[Ljava/lang/reflect/Field;
    .end local v2    # "i":I
    :cond_1
    goto :goto_1

    .line 597
    :catch_0
    move-exception v1

    .line 598
    .local v1, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 601
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_1
    const-string v1, "List of headers : "

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V

    .line 602
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V

    .line 603
    const-string/jumbo v1, "messageContent = "

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V

    .line 604
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V

    .line 605
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V

    .line 606
    const-string/jumbo v0, "}"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V

    .line 607
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContent()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 608
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContent()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V

    .line 610
    :cond_2
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->sprint(Ljava/lang/String;)V

    .line 611
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->stringRepresentation:Ljava/lang/String;

    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 6

    .line 433
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 434
    .local v0, "encoding":Ljava/lang/StringBuilder;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 436
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 437
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 438
    .local v2, "siphdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    instance-of v3, v2, Landroid/gov/nist/javax/sip/header/ContentLength;

    if-nez v3, :cond_0

    .line 439
    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 440
    .end local v2    # "siphdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_0
    goto :goto_0

    .line 443
    :cond_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->unrecognizedHeaders:Ljava/util/LinkedList;

    const-string v3, "\r\n"

    if-eqz v2, :cond_2

    .line 444
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->unrecognizedHeaders:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 445
    .local v4, "unrecognized":Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    .end local v4    # "unrecognized":Ljava/lang/String;
    goto :goto_1

    .line 449
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/header/ContentLength;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 451
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    if-eqz v2, :cond_4

    .line 452
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContent()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 454
    .local v2, "mbody":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    .end local v2    # "mbody":Ljava/lang/String;
    :cond_3
    goto :goto_4

    :cond_4
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    if-nez v2, :cond_5

    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    if-eqz v2, :cond_3

    .line 457
    :cond_5
    const/4 v2, 0x0

    .line 459
    .local v2, "content":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    if-eqz v3, :cond_6

    .line 460
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    move-object v2, v3

    goto :goto_2

    .line 463
    :cond_6
    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCharset()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v3

    .line 467
    :goto_2
    goto :goto_3

    .line 465
    :catch_0
    move-exception v3

    .line 466
    .local v3, "ex":Ljava/io/UnsupportedEncodingException;
    invoke-static {v3}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 469
    .end local v3    # "ex":Ljava/io/UnsupportedEncodingException;
    :goto_3
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 471
    .end local v2    # "content":Ljava/lang/String;
    :goto_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public encodeAsBytes(Ljava/lang/String;)[B
    .locals 8
    .param p1, "transport"    # Ljava/lang/String;

    .line 483
    instance-of v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->isNullRequest()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 484
    const-string v0, "\r\n\r\n"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    return-object v0

    .line 488
    :cond_0
    const-string/jumbo v0, "Via"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/ViaHeader;

    .line 490
    .local v0, "topVia":Landroid/javax/sip/header/ViaHeader;
    :try_start_0
    invoke-interface {v0, p1}, Landroid/javax/sip/header/ViaHeader;->setTransport(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 493
    goto :goto_0

    .line 491
    :catch_0
    move-exception v1

    .line 492
    .local v1, "e":Ljava/text/ParseException;
    invoke-static {v1}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 495
    .end local v1    # "e":Ljava/text/ParseException;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 496
    .local v1, "encoding":Ljava/lang/StringBuilder;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    monitor-enter v2

    .line 497
    :try_start_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 499
    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 500
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 501
    .local v4, "siphdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    instance-of v5, v4, Landroid/gov/nist/javax/sip/header/ContentLength;

    if-nez v5, :cond_1

    .line 502
    invoke-virtual {v4, v1}, Landroid/gov/nist/javax/sip/header/SIPHeader;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 504
    .end local v4    # "siphdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_1
    goto :goto_1

    .line 505
    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 506
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v2, v1}, Landroid/gov/nist/javax/sip/header/ContentLength;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 507
    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 509
    const/4 v2, 0x0

    .line 510
    .local v2, "retval":[B
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getRawContent()[B

    move-result-object v3

    .line 511
    .local v3, "content":[B
    if-eqz v3, :cond_3

    .line 514
    const/4 v4, 0x0

    .line 516
    .local v4, "msgarray":[B
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCharset()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_1

    move-object v4, v5

    .line 519
    goto :goto_2

    .line 517
    :catch_1
    move-exception v5

    .line 518
    .local v5, "ex":Ljava/io/UnsupportedEncodingException;
    invoke-static {v5}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 521
    .end local v5    # "ex":Ljava/io/UnsupportedEncodingException;
    :goto_2
    array-length v5, v4

    array-length v6, v3

    add-int/2addr v5, v6

    new-array v2, v5, [B

    .line 522
    array-length v5, v4

    const/4 v6, 0x0

    invoke-static {v4, v6, v2, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 523
    array-length v5, v4

    array-length v7, v3

    invoke-static {v3, v6, v2, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 524
    .end local v4    # "msgarray":[B
    goto :goto_3

    .line 528
    :cond_3
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCharset()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_2

    move-object v2, v4

    .line 531
    goto :goto_3

    .line 529
    :catch_2
    move-exception v4

    .line 530
    .local v4, "ex":Ljava/io/UnsupportedEncodingException;
    invoke-static {v4}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 533
    .end local v4    # "ex":Ljava/io/UnsupportedEncodingException;
    :goto_3
    return-object v2

    .line 505
    .end local v2    # "retval":[B
    .end local v3    # "content":[B
    :catchall_0
    move-exception v3

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v3
.end method

.method public abstract encodeMessage(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
.end method

.method protected encodeSIPHeaders(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 3
    .param p1, "encoding"    # Ljava/lang/StringBuilder;

    .line 275
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 277
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 278
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 279
    .local v1, "siphdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/ContentLength;

    if-nez v2, :cond_0

    .line 280
    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/header/SIPHeader;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 281
    .end local v1    # "siphdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_0
    goto :goto_0

    .line 283
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/header/ContentLength;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "other"    # Ljava/lang/Object;

    .line 1675
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1676
    return v1

    .line 1678
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 1679
    .local v0, "otherMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    .line 1680
    .local v2, "values":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1681
    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    iget-object v4, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    iget-object v5, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    if-eq v4, v5, :cond_1

    .line 1682
    return v1

    .line 1685
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1686
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 1687
    .local v4, "mine":Landroid/gov/nist/javax/sip/header/SIPHeader;
    iget-object v5, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 1689
    .local v5, "his":Landroid/gov/nist/javax/sip/header/SIPHeader;
    if-nez v5, :cond_2

    .line 1690
    return v1

    .line 1691
    :cond_2
    invoke-virtual {v5, v4}, Landroid/gov/nist/javax/sip/header/SIPHeader;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 1692
    return v1

    .line 1694
    .end local v4    # "mine":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .end local v5    # "his":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_3
    goto :goto_0

    .line 1695
    :cond_4
    const/4 v1, 0x1

    return v1
.end method

.method public getApplicationData()Ljava/lang/Object;
    .locals 1

    .line 1889
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->applicationData:Ljava/lang/Object;

    return-object v0
.end method

.method public getAuthorization()Landroid/gov/nist/javax/sip/header/Authorization;
    .locals 1

    .line 1134
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->AUTHORIZATION_LOWERCASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeaderLowerCase(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Authorization;

    return-object v0
.end method

.method public getCSeq()Landroid/javax/sip/header/CSeqHeader;
    .locals 1

    .line 1125
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    return-object v0
.end method

.method public getCSeqHeader()Landroid/javax/sip/header/CSeqHeader;
    .locals 1

    .line 1933
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    return-object v0
.end method

.method public getCallId()Landroid/javax/sip/header/CallIdHeader;
    .locals 1

    .line 1177
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    return-object v0
.end method

.method public getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;
    .locals 1

    .line 1914
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    return-object v0
.end method

.method protected final getCharset()Ljava/lang/String;
    .locals 3

    .line 1940
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContentTypeHeader()Landroid/gov/nist/javax/sip/header/ContentType;

    move-result-object v0

    .line 1941
    .local v0, "ct":Landroid/gov/nist/javax/sip/header/ContentType;
    if-eqz v0, :cond_1

    .line 1942
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/ContentType;->getCharset()Ljava/lang/String;

    move-result-object v1

    .line 1943
    .local v1, "c":Ljava/lang/String;
    if-eqz v1, :cond_0

    move-object v2, v1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentEncodingCharset:Ljava/lang/String;

    :goto_0
    return-object v2

    .line 1944
    .end local v1    # "c":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentEncodingCharset:Ljava/lang/String;

    return-object v1
.end method

.method public getContactHeader()Landroid/gov/nist/javax/sip/header/Contact;
    .locals 2

    .line 1062
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;

    move-result-object v0

    .line 1063
    .local v0, "clist":Landroid/gov/nist/javax/sip/header/ContactList;
    if-eqz v0, :cond_0

    .line 1064
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/ContactList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/Contact;

    return-object v1

    .line 1067
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;
    .locals 1

    .line 1051
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->CONTACT_LOWERCASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getSIPHeaderListLowerCase(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ContactList;

    return-object v0
.end method

.method public getContent()Ljava/lang/Object;
    .locals 1

    .line 1335
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 1336
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    return-object v0

    .line 1337
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 1338
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    return-object v0

    .line 1339
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    if-eqz v0, :cond_2

    .line 1340
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    return-object v0

    .line 1342
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentDisposition()Landroid/javax/sip/header/ContentDispositionHeader;
    .locals 1

    .line 1704
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->CONTENT_DISPOSITION_LOWERCASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeaderLowerCase(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/ContentDispositionHeader;

    return-object v0
.end method

.method public getContentEncoding()Landroid/javax/sip/header/ContentEncodingHeader;
    .locals 1

    .line 1716
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->CONTENT_ENCODING_LOWERCASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeaderLowerCase(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/ContentEncodingHeader;

    return-object v0
.end method

.method public getContentLanguage()Landroid/javax/sip/header/ContentLanguageHeader;
    .locals 1

    .line 1728
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->CONTENT_LANGUAGE_LOWERCASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeaderLowerCase(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/ContentLanguageHeader;

    return-object v0
.end method

.method public getContentLength()Landroid/javax/sip/header/ContentLengthHeader;
    .locals 1

    .line 1237
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    return-object v0
.end method

.method public getContentLengthHeader()Landroid/javax/sip/header/ContentLengthHeader;
    .locals 1

    .line 1021
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContentLength()Landroid/javax/sip/header/ContentLengthHeader;

    move-result-object v0

    return-object v0
.end method

.method public getContentTypeHeader()Landroid/gov/nist/javax/sip/header/ContentType;
    .locals 1

    .line 1010
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->CONTENT_TYPE_LOWERCASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeaderLowerCase(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ContentType;

    return-object v0
.end method

.method public bridge synthetic getContentTypeHeader()Landroid/javax/sip/header/ContentTypeHeader;
    .locals 1

    .line 134
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContentTypeHeader()Landroid/gov/nist/javax/sip/header/ContentType;

    move-result-object v0

    return-object v0
.end method

.method public final getDialogId(Z)Ljava/lang/String;
    .locals 2
    .param p1, "isServer"    # Z

    .line 298
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/To;

    .line 299
    .local v0, "to":Landroid/gov/nist/javax/sip/header/To;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/To;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getDialogId(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public final getDialogId(ZLjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "isServer"    # Z
    .param p2, "toTag"    # Ljava/lang/String;

    .line 306
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/From;

    .line 307
    .local v0, "from":Landroid/gov/nist/javax/sip/header/From;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/CallID;

    .line 308
    .local v1, "cid":Landroid/gov/nist/javax/sip/header/CallID;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/CallID;->getCallId()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 309
    .local v2, "retval":Ljava/lang/StringBuffer;
    const-string v3, ":"

    if-nez p1, :cond_1

    .line 311
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/From;->getTag()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 312
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 313
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/From;->getTag()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 316
    :cond_0
    if-eqz p2, :cond_3

    .line 317
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 318
    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 322
    :cond_1
    if-eqz p2, :cond_2

    .line 323
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 324
    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 327
    :cond_2
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/From;->getTag()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 328
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 329
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/From;->getTag()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 332
    :cond_3
    :goto_0
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getErrorInfoHeaders()Landroid/gov/nist/javax/sip/header/ErrorInfoList;
    .locals 1

    .line 1040
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->ERROR_LOWERCASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getSIPHeaderListLowerCase(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ErrorInfoList;

    return-object v0
.end method

.method public getExpires()Landroid/javax/sip/header/ExpiresHeader;
    .locals 1

    .line 1740
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->EXPIRES_LOWERCASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeaderLowerCase(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/ExpiresHeader;

    return-object v0
.end method

.method public abstract getFirstLine()Ljava/lang/String;
.end method

.method public getForkId()Ljava/lang/String;
    .locals 4

    .line 1964
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->forkId:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1965
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->forkId:Ljava/lang/String;

    return-object v0

    .line 1967
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    .line 1968
    .local v0, "callId":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFromTag()Ljava/lang/String;

    move-result-object v1

    .line 1969
    .local v1, "fromTag":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 1972
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->forkId:Ljava/lang/String;

    .line 1973
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->forkId:Ljava/lang/String;

    return-object v2

    .line 1970
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "From tag is not yet set. Cannot compute forkId"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getFrom()Landroid/javax/sip/header/FromHeader;
    .locals 1

    .line 1031
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    return-object v0
.end method

.method public getFromHeader()Landroid/javax/sip/header/FromHeader;
    .locals 1

    .line 1919
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    return-object v0
.end method

.method public getFromTag()Ljava/lang/String;
    .locals 1

    .line 1554
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/From;->getTag()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;
    .locals 1
    .param p1, "headerName"    # Ljava/lang/String;

    .line 990
    invoke-static {p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeaderLowerCase(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderAsFormattedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 1486
    invoke-static {p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1487
    .local v0, "lowerCaseName":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1488
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeader;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/SIPHeader;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1490
    :cond_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/Header;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected getHeaderLowerCase(Ljava/lang/String;)Landroid/javax/sip/header/Header;
    .locals 2
    .param p1, "lowerCaseHeaderName"    # Ljava/lang/String;

    .line 994
    if-eqz p1, :cond_1

    .line 996
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 997
    .local v0, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    instance-of v1, v0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-eqz v1, :cond_0

    .line 998
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v1

    return-object v1

    .line 1000
    :cond_0
    return-object v0

    .line 995
    .end local v0    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "bad name"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getHeaderNames()Ljava/util/ListIterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1659
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1660
    .local v0, "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 1661
    .local v1, "retval":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1662
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 1663
    .local v2, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getName()Ljava/lang/String;

    move-result-object v3

    .line 1664
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 1665
    .end local v2    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .end local v3    # "name":Ljava/lang/String;
    goto :goto_0

    .line 1666
    :cond_0
    invoke-virtual {v1}, Ljava/util/LinkedList;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    return-object v2
.end method

.method public getHeaders()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Landroid/gov/nist/javax/sip/header/SIPHeader;",
            ">;"
        }
    .end annotation

    .line 981
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getHeaders(Ljava/lang/String;)Ljava/util/ListIterator;
    .locals 2
    .param p1, "headerName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ListIterator<",
            "Landroid/gov/nist/javax/sip/header/SIPHeader;",
            ">;"
        }
    .end annotation

    .line 1464
    if-eqz p1, :cond_2

    .line 1466
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-static {p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 1469
    .local v0, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    if-nez v0, :cond_0

    .line 1470
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {v1}, Ljava/util/LinkedList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    return-object v1

    .line 1471
    :cond_0
    instance-of v1, v0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-eqz v1, :cond_1

    .line 1472
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    return-object v1

    .line 1474
    :cond_1
    new-instance v1, Landroid/gov/nist/javax/sip/message/HeaderIterator;

    invoke-direct {v1, p0, v0}, Landroid/gov/nist/javax/sip/message/HeaderIterator;-><init>(Landroid/gov/nist/javax/sip/message/SIPMessage;Landroid/gov/nist/javax/sip/header/SIPHeader;)V

    return-object v1

    .line 1465
    .end local v0    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null headerName"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .locals 1

    .line 2049
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->localAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getLocalPort()I
    .locals 1

    .line 2057
    iget v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->localPort:I

    return v0
.end method

.method public getMaxForwards()Landroid/javax/sip/header/MaxForwardsHeader;
    .locals 1

    .line 1147
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->maxForwardsHeader:Landroid/gov/nist/javax/sip/header/MaxForwards;

    return-object v0
.end method

.method public getMessageAsEncodedStrings()Ljava/util/LinkedList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 253
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 254
    .local v0, "retval":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 255
    .local v1, "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 256
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 257
    .local v2, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    instance-of v3, v2, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-eqz v3, :cond_0

    .line 258
    move-object v3, v2

    check-cast v3, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 259
    .local v3, "shl":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<*>;"
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->getHeadersAsEncodedStrings()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 260
    .end local v3    # "shl":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<*>;"
    goto :goto_1

    .line 261
    :cond_0
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/SIPHeader;->encode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 263
    .end local v2    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :goto_1
    goto :goto_0

    .line 265
    :cond_1
    return-object v0
.end method

.method public getMessageContent()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 1251
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    if-nez v0, :cond_0

    .line 1252
    const/4 v0, 0x0

    return-object v0

    .line 1253
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 1254
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCharset()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    .line 1256
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    return-object v0
.end method

.method public getMultipartMimeContent()Landroid/gov/nist/javax/sip/message/MultipartMimeContent;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1897
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/ContentLength;->getContentLength()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1898
    return-object v1

    .line 1900
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContentTypeHeader()Landroid/gov/nist/javax/sip/header/ContentType;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;-><init>(Landroid/javax/sip/header/ContentTypeHeader;)V

    .line 1902
    .local v0, "retval":Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getRawContent()[B

    move-result-object v2

    .line 1904
    .local v2, "rawContent":[B
    :try_start_0
    new-instance v3, Ljava/lang/String;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCharset()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 1905
    .local v3, "body":Ljava/lang/String;
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->createContentList(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1906
    return-object v0

    .line 1907
    .end local v3    # "body":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 1908
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    invoke-static {v3}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 1909
    return-object v1
.end method

.method public getPeerPacketSourceAddress()Ljava/net/InetAddress;
    .locals 1

    .line 2065
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->peerPacketSourceAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getPeerPacketSourcePort()I
    .locals 1

    .line 2073
    iget v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->peerPacketSourcePort:I

    return v0
.end method

.method public getRawContent()[B
    .locals 2

    .line 1268
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    if-eqz v0, :cond_0

    goto :goto_1

    .line 1270
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 1271
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1272
    .local v0, "messageContent":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCharset()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    .end local v0    # "messageContent":Ljava/lang/String;
    goto :goto_0

    .line 1273
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 1274
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCharset()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    goto :goto_1

    .line 1273
    :cond_2
    :goto_0
    nop

    .line 1276
    :goto_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 1277
    :catch_0
    move-exception v0

    .line 1278
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 1279
    const/4 v1, 0x0

    return-object v1
.end method

.method public getRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;
    .locals 1

    .line 1207
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->RECORDROUTE_LOWERCASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getSIPHeaderListLowerCase(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/RecordRouteList;

    return-object v0
.end method

.method public getRemoteAddress()Ljava/net/InetAddress;
    .locals 1

    .line 2033
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->remoteAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getRemotePort()I
    .locals 1

    .line 2041
    iget v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->remotePort:I

    return v0
.end method

.method public getRouteHeaders()Landroid/gov/nist/javax/sip/header/RouteList;
    .locals 1

    .line 1165
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->ROUTE_LOWERCASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getSIPHeaderListLowerCase(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/RouteList;

    return-object v0
.end method

.method public getSIPHeaderListLowerCase(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 1
    .param p1, "lowerCaseHeaderName"    # Ljava/lang/String;

    .line 1495
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeader;

    return-object v0
.end method

.method public abstract getSIPVersion()Ljava/lang/String;
.end method

.method public getSize()I
    .locals 1

    .line 1799
    iget v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->size:I

    return v0
.end method

.method public getTo()Landroid/javax/sip/header/ToHeader;
    .locals 1

    .line 1219
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    return-object v0
.end method

.method public getToHeader()Landroid/javax/sip/header/ToHeader;
    .locals 1

    .line 1924
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    return-object v0
.end method

.method public getToTag()Ljava/lang/String;
    .locals 1

    .line 1585
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/To;->getTag()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;
    .locals 2

    .line 1113
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getViaHeaders()Landroid/gov/nist/javax/sip/header/ViaList;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1114
    const/4 v0, 0x0

    return-object v0

    .line 1116
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getViaHeaders()Landroid/gov/nist/javax/sip/header/ViaList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/ViaList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Via;

    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/header/Via;

    return-object v0
.end method

.method public getTopmostViaHeader()Landroid/javax/sip/header/ViaHeader;
    .locals 1

    .line 1929
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    return-object v0
.end method

.method public getTransactionId()Ljava/lang/String;
    .locals 10

    .line 907
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    .line 914
    .local v0, "topVia":Landroid/gov/nist/javax/sip/header/Via;
    const-string v1, ":"

    const-string v2, "CANCEL"

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "Z9HG4BK"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 921
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 922
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 924
    :cond_0
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 928
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 929
    .local v3, "retval":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/From;

    .line 930
    .local v4, "from":Landroid/gov/nist/javax/sip/header/From;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/header/To;

    .line 933
    .local v5, "to":Landroid/gov/nist/javax/sip/header/To;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/From;->hasTag()Z

    move-result v6

    const-string v7, "-"

    if-eqz v6, :cond_2

    .line 934
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/From;->getTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 937
    :cond_2
    iget-object v6, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/header/CallID;->getCallId()Ljava/lang/String;

    move-result-object v6

    .line 938
    .local v6, "cid":Ljava/lang/String;
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 939
    iget-object v8, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/header/CSeq;->getSequenceNumber()I

    move-result v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/header/CSeq;->getMethod()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 941
    if-eqz v0, :cond_3

    .line 942
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getSentBy()Landroid/gov/nist/core/HostPort;

    move-result-object v9

    invoke-virtual {v9}, Landroid/gov/nist/core/HostPort;->encode()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 943
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getSentBy()Landroid/gov/nist/core/HostPort;

    move-result-object v8

    invoke-virtual {v8}, Landroid/gov/nist/core/HostPort;->hasPort()Z

    move-result v8

    if-nez v8, :cond_3

    .line 944
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x13c4

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 947
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v8

    invoke-interface {v8}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 948
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 950
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v1, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v8, "@"

    invoke-virtual {v1, v8, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/gov/nist/javax/sip/Utils;->getSignature()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getUnrecognizedHeaders()Ljava/util/ListIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1649
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getUnrecognizedHeadersList()Ljava/util/LinkedList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method protected getUnrecognizedHeadersList()Ljava/util/LinkedList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 2022
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->unrecognizedHeaders:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 2023
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->unrecognizedHeaders:Ljava/util/LinkedList;

    .line 2025
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->unrecognizedHeaders:Ljava/util/LinkedList;

    return-object v0
.end method

.method public getViaHeaders()Landroid/gov/nist/javax/sip/header/ViaList;
    .locals 1

    .line 1077
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->VIA_LOWERCASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getSIPHeaderListLowerCase(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ViaList;

    return-object v0
.end method

.method public hasContent()Z
    .locals 1

    .line 972
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public hasFromTag()Z
    .locals 1

    .line 1535
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/From;->getTag()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasHeader(Ljava/lang/String;)Z
    .locals 2
    .param p1, "headerName"    # Ljava/lang/String;

    .line 1526
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-static {p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasToTag()Z
    .locals 1

    .line 1544
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/To;->getTag()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 961
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    if-eqz v0, :cond_0

    .line 965
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/CallID;->getCallId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0

    .line 962
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Invalid message! Cannot compute hashcode! call-id header is missing !"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isNullRequest()Z
    .locals 1

    .line 1953
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->nullRequest:Z

    return v0
.end method

.method public match(Ljava/lang/Object;)Z
    .locals 12
    .param p1, "other"    # Ljava/lang/Object;

    .line 344
    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 345
    return v0

    .line 346
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 347
    return v2

    .line 348
    :cond_1
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 349
    .local v1, "matchObj":Landroid/gov/nist/javax/sip/message/SIPMessage;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeaders()Ljava/util/Iterator;

    move-result-object v3

    .line 350
    .local v3, "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 351
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 352
    .local v4, "hisHeaders":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getHeaderName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeaderList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 355
    .local v5, "myHeaders":Ljava/util/List;, "Ljava/util/List<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    if-eqz v5, :cond_c

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-nez v6, :cond_2

    goto :goto_7

    .line 358
    :cond_2
    instance-of v6, v4, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-eqz v6, :cond_8

    .line 359
    move-object v6, v4

    check-cast v6, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->listIterator()Ljava/util/ListIterator;

    move-result-object v6

    .line 361
    .local v6, "outerIterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<*>;"
    :goto_1
    invoke-interface {v6}, Ljava/util/ListIterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 362
    invoke-interface {v6}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 363
    .local v7, "hisHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    instance-of v8, v7, Landroid/gov/nist/javax/sip/header/ContentLength;

    if-eqz v8, :cond_3

    .line 364
    goto :goto_1

    .line 365
    :cond_3
    invoke-interface {v5}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v8

    .line 366
    .local v8, "innerIterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<*>;"
    const/4 v9, 0x0

    .line 367
    .local v9, "found":Z
    :goto_2
    invoke-interface {v8}, Ljava/util/ListIterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 368
    invoke-interface {v8}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 369
    .local v10, "myHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v10, v7}, Landroid/gov/nist/javax/sip/header/SIPHeader;->match(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 370
    const/4 v9, 0x1

    .line 371
    goto :goto_3

    .line 373
    .end local v10    # "myHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_4
    goto :goto_2

    .line 374
    :cond_5
    :goto_3
    if-nez v9, :cond_6

    .line 375
    return v2

    .line 376
    .end local v7    # "hisHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .end local v8    # "innerIterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<*>;"
    .end local v9    # "found":Z
    :cond_6
    goto :goto_1

    .line 377
    .end local v6    # "outerIterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<*>;"
    :cond_7
    goto :goto_6

    .line 378
    :cond_8
    move-object v6, v4

    .line 379
    .local v6, "hisHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-interface {v5}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v7

    .line 380
    .local v7, "innerIterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    const/4 v8, 0x0

    .line 381
    .local v8, "found":Z
    :goto_4
    invoke-interface {v7}, Ljava/util/ListIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 382
    invoke-interface {v7}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 383
    .local v9, "myHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v9, v6}, Landroid/gov/nist/javax/sip/header/SIPHeader;->match(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 384
    const/4 v8, 0x1

    .line 385
    goto :goto_5

    .line 387
    .end local v9    # "myHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_9
    goto :goto_4

    .line 388
    :cond_a
    :goto_5
    if-nez v8, :cond_b

    .line 389
    return v2

    .line 391
    .end local v4    # "hisHeaders":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .end local v5    # "myHeaders":Ljava/util/List;, "Ljava/util/List<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    .end local v6    # "hisHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .end local v7    # "innerIterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    .end local v8    # "found":Z
    :cond_b
    :goto_6
    goto :goto_0

    .line 356
    .restart local v4    # "hisHeaders":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .restart local v5    # "myHeaders":Ljava/util/List;, "Ljava/util/List<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_c
    :goto_7
    return v2

    .line 392
    .end local v4    # "hisHeaders":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .end local v5    # "myHeaders":Ljava/util/List;, "Ljava/util/List<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_d
    return v0
.end method

.method public merge(Ljava/lang/Object;)V
    .locals 8
    .param p1, "template"    # Ljava/lang/Object;

    .line 403
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 405
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 406
    .local v0, "templateMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    iget-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->toArray()[Ljava/lang/Object;

    move-result-object v1

    .line 407
    .local v1, "templateHeaders":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_2

    .line 408
    aget-object v3, v1, v2

    check-cast v3, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 409
    .local v3, "hdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getHeaderName()Ljava/lang/String;

    move-result-object v4

    .line 410
    .local v4, "hdrName":Ljava/lang/String;
    invoke-direct {p0, v4}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeaderList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 411
    .local v5, "myHdrs":Ljava/util/List;, "Ljava/util/List<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    if-nez v5, :cond_0

    .line 412
    invoke-direct {p0, v3}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;)V

    goto :goto_2

    .line 414
    :cond_0
    invoke-interface {v5}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v6

    .line 415
    .local v6, "it":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_1
    invoke-interface {v6}, Ljava/util/ListIterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 416
    invoke-interface {v6}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 417
    .local v7, "sipHdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v7, v3}, Landroid/gov/nist/javax/sip/header/SIPHeader;->merge(Ljava/lang/Object;)V

    .line 418
    .end local v7    # "sipHdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    goto :goto_1

    .line 407
    .end local v3    # "hdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .end local v4    # "hdrName":Ljava/lang/String;
    .end local v5    # "myHdrs":Ljava/util/List;, "Ljava/util/List<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    .end local v6    # "it":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 422
    .end local v2    # "i":I
    :cond_2
    return-void

    .line 404
    .end local v0    # "templateMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .end local v1    # "templateHeaders":[Ljava/lang/Object;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeContent()V
    .locals 2

    .line 1447
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    .line 1448
    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    .line 1449
    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    .line 1451
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ContentLength;->setContentLength(I)V
    :try_end_0
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1453
    goto :goto_0

    .line 1452
    :catch_0
    move-exception v0

    .line 1454
    :goto_0
    return-void
.end method

.method public removeFirst(Ljava/lang/String;)V
    .locals 2
    .param p1, "headerName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .line 1843
    if-eqz p1, :cond_0

    .line 1845
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->removeHeader(Ljava/lang/String;Z)V

    .line 1847
    return-void

    .line 1844
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null argument Provided!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeHeader(Ljava/lang/String;)V
    .locals 5
    .param p1, "headerName"    # Ljava/lang/String;

    .line 858
    if-eqz p1, :cond_9

    .line 860
    invoke-static {p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 861
    .local v0, "headerNameLowerCase":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 863
    .local v1, "removed":Landroid/gov/nist/javax/sip/header/SIPHeader;
    if-nez v1, :cond_0

    .line 864
    return-void

    .line 867
    :cond_0
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/From;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 868
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    goto :goto_0

    .line 869
    :cond_1
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/To;

    if-eqz v2, :cond_2

    .line 870
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    goto :goto_0

    .line 871
    :cond_2
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/CSeq;

    if-eqz v2, :cond_3

    .line 872
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    goto :goto_0

    .line 873
    :cond_3
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/CallID;

    if-eqz v2, :cond_4

    .line 874
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    goto :goto_0

    .line 875
    :cond_4
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/MaxForwards;

    if-eqz v2, :cond_5

    .line 876
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->maxForwardsHeader:Landroid/gov/nist/javax/sip/header/MaxForwards;

    goto :goto_0

    .line 877
    :cond_5
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/ContentLength;

    if-eqz v2, :cond_6

    .line 878
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    .line 881
    :cond_6
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 882
    .local v2, "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 883
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 884
    .local v3, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 885
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 887
    .end local v3    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_7
    goto :goto_1

    .line 888
    :cond_8
    return-void

    .line 859
    .end local v0    # "headerNameLowerCase":Ljava/lang/String;
    .end local v1    # "removed":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .end local v2    # "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_9
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeHeader(Ljava/lang/String;Z)V
    .locals 6
    .param p1, "headerName"    # Ljava/lang/String;
    .param p2, "top"    # Z

    .line 802
    invoke-static {p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 803
    .local v0, "headerNameLowerCase":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 805
    .local v1, "toRemove":Landroid/gov/nist/javax/sip/header/SIPHeader;
    if-nez v1, :cond_0

    .line 806
    return-void

    .line 807
    :cond_0
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-eqz v2, :cond_5

    .line 808
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 809
    .local v2, "hdrList":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<*>;"
    if-eqz p2, :cond_1

    .line 810
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->removeFirst()V

    goto :goto_0

    .line 812
    :cond_1
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->removeLast()V

    .line 814
    :goto_0
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 815
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 816
    .local v3, "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 817
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 818
    .local v4, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 819
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 820
    .end local v4    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_2
    goto :goto_1

    .line 824
    :cond_3
    iget-object v4, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    .end local v2    # "hdrList":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<*>;"
    .end local v3    # "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_4
    goto :goto_4

    .line 827
    :cond_5
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headerTable:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 828
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/From;

    const/4 v3, 0x0

    if-eqz v2, :cond_6

    .line 829
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    goto :goto_2

    .line 830
    :cond_6
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/To;

    if-eqz v2, :cond_7

    .line 831
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    goto :goto_2

    .line 832
    :cond_7
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/CSeq;

    if-eqz v2, :cond_8

    .line 833
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    goto :goto_2

    .line 834
    :cond_8
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/CallID;

    if-eqz v2, :cond_9

    .line 835
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    goto :goto_2

    .line 836
    :cond_9
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/MaxForwards;

    if-eqz v2, :cond_a

    .line 837
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->maxForwardsHeader:Landroid/gov/nist/javax/sip/header/MaxForwards;

    goto :goto_2

    .line 838
    :cond_a
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/ContentLength;

    if-eqz v2, :cond_b

    .line 839
    iput-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    .line 841
    :cond_b
    :goto_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->headers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 842
    .local v2, "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 843
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 844
    .local v3, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 845
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 846
    .end local v3    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_c
    goto :goto_3

    .line 849
    .end local v2    # "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_d
    :goto_4
    return-void
.end method

.method public removeLast(Ljava/lang/String;)V
    .locals 2
    .param p1, "headerName"    # Ljava/lang/String;

    .line 1855
    if-eqz p1, :cond_0

    .line 1857
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->removeHeader(Ljava/lang/String;Z)V

    .line 1859
    return-void

    .line 1856
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null argument Provided!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setApplicationData(Ljava/lang/Object;)V
    .locals 0
    .param p1, "applicationData"    # Ljava/lang/Object;

    .line 1880
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->applicationData:Ljava/lang/Object;

    .line 1881
    return-void
.end method

.method public setCSeq(Landroid/javax/sip/header/CSeqHeader;)V
    .locals 0
    .param p1, "cseqHeader"    # Landroid/javax/sip/header/CSeqHeader;

    .line 1868
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1869
    return-void
.end method

.method public setCallId(Landroid/javax/sip/header/CallIdHeader;)V
    .locals 0
    .param p1, "callId"    # Landroid/javax/sip/header/CallIdHeader;

    .line 1186
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1187
    return-void
.end method

.method public setCallId(Ljava/lang/String;)V
    .locals 1
    .param p1, "callId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1195
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    if-nez v0, :cond_0

    .line 1196
    new-instance v0, Landroid/gov/nist/javax/sip/header/CallID;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/CallID;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1198
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/CallID;->setCallId(Ljava/lang/String;)V

    .line 1199
    return-void
.end method

.method public setContent(Ljava/lang/Object;Landroid/javax/sip/header/ContentTypeHeader;)V
    .locals 2
    .param p1, "content"    # Ljava/lang/Object;
    .param p2, "contentTypeHeader"    # Landroid/javax/sip/header/ContentTypeHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1311
    if-eqz p1, :cond_2

    .line 1313
    invoke-virtual {p0, p2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1315
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    .line 1316
    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    .line 1317
    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    .line 1319
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1320
    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    goto :goto_0

    .line 1321
    :cond_0
    instance-of v0, p1, [B

    if-eqz v0, :cond_1

    .line 1322
    move-object v0, p1

    check-cast v0, [B

    check-cast v0, [B

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    goto :goto_0

    .line 1324
    :cond_1
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    .line 1326
    :goto_0
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->computeContentLength(Ljava/lang/Object;)V

    .line 1327
    return-void

    .line 1312
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null content"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContentDisposition(Landroid/javax/sip/header/ContentDispositionHeader;)V
    .locals 0
    .param p1, "contentDispositionHeader"    # Landroid/javax/sip/header/ContentDispositionHeader;

    .line 1763
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1765
    return-void
.end method

.method public setContentEncoding(Landroid/javax/sip/header/ContentEncodingHeader;)V
    .locals 0
    .param p1, "contentEncodingHeader"    # Landroid/javax/sip/header/ContentEncodingHeader;

    .line 1768
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1770
    return-void
.end method

.method public setContentLanguage(Landroid/javax/sip/header/ContentLanguageHeader;)V
    .locals 0
    .param p1, "contentLanguageHeader"    # Landroid/javax/sip/header/ContentLanguageHeader;

    .line 1773
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1774
    return-void
.end method

.method public setContentLength(Landroid/javax/sip/header/ContentLengthHeader;)V
    .locals 2
    .param p1, "contentLength"    # Landroid/javax/sip/header/ContentLengthHeader;

    .line 1783
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-interface {p1}, Landroid/javax/sip/header/ContentLengthHeader;->getContentLength()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ContentLength;->setContentLength(I)V
    :try_end_0
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1785
    goto :goto_0

    .line 1784
    :catch_0
    move-exception v0

    .line 1787
    :goto_0
    return-void
.end method

.method public setExpires(Landroid/javax/sip/header/ExpiresHeader;)V
    .locals 0
    .param p1, "expiresHeader"    # Landroid/javax/sip/header/ExpiresHeader;

    .line 1753
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1754
    return-void
.end method

.method public setFrom(Landroid/javax/sip/header/FromHeader;)V
    .locals 0
    .param p1, "from"    # Landroid/javax/sip/header/FromHeader;

    .line 1227
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1229
    return-void
.end method

.method public setFromTag(Ljava/lang/String;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;

    .line 1564
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/From;->setTag(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1566
    goto :goto_0

    .line 1565
    :catch_0
    move-exception v0

    .line 1567
    :goto_0
    return-void
.end method

.method public setHeader(Landroid/gov/nist/javax/sip/header/SIPHeaderList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
            "Landroid/gov/nist/javax/sip/header/Via;",
            ">;)V"
        }
    .end annotation

    .line 1104
    .local p1, "sipHeaderList":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<Landroid/gov/nist/javax/sip/header/Via;>;"
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1105
    return-void
.end method

.method public setHeader(Landroid/javax/sip/header/Header;)V
    .locals 3
    .param p1, "sipHeader"    # Landroid/javax/sip/header/Header;

    .line 656
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 657
    .local v0, "header":Landroid/gov/nist/javax/sip/header/SIPHeader;
    if-eqz v0, :cond_1

    .line 660
    :try_start_0
    instance-of v1, v0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-eqz v1, :cond_0

    .line 661
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 663
    .local v1, "hl":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<*>;"
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 664
    return-void

    .line 666
    .end local v1    # "hl":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<*>;"
    :cond_0
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getHeaderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->removeHeader(Ljava/lang/String;)V

    .line 667
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;ZZ)V
    :try_end_0
    .catch Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 670
    goto :goto_0

    .line 668
    :catch_0
    move-exception v1

    .line 669
    .local v1, "ex":Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
    invoke-static {v1}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 671
    .end local v1    # "ex":Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
    :goto_0
    return-void

    .line 658
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "null header!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setHeaders(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/gov/nist/javax/sip/header/SIPHeader;",
            ">;)V"
        }
    .end annotation

    .line 679
    .local p1, "headers":Ljava/util/List;, "Ljava/util/List<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    invoke-interface {p1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 680
    .local v0, "listIterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 681
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 683
    .local v1, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0, v1, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;Z)V
    :try_end_0
    .catch Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 685
    goto :goto_1

    .line 684
    :catch_0
    move-exception v2

    .line 686
    .end local v1    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :goto_1
    goto :goto_0

    .line 687
    :cond_0
    return-void
.end method

.method public setLocalAddress(Ljava/net/InetAddress;)V
    .locals 0
    .param p1, "localAddress"    # Ljava/net/InetAddress;

    .line 2045
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->localAddress:Ljava/net/InetAddress;

    .line 2046
    return-void
.end method

.method public setLocalPort(I)V
    .locals 0
    .param p1, "localPort"    # I

    .line 2053
    iput p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->localPort:I

    .line 2054
    return-void
.end method

.method public setMaxForwards(Landroid/javax/sip/header/MaxForwardsHeader;)V
    .locals 0
    .param p1, "maxForwards"    # Landroid/javax/sip/header/MaxForwardsHeader;

    .line 1156
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1157
    return-void
.end method

.method public setMessageContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "subType"    # Ljava/lang/String;
    .param p3, "messageContent"    # Ljava/lang/String;

    .line 1291
    if-eqz p3, :cond_0

    .line 1293
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentType;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/javax/sip/header/ContentType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1294
    .local v0, "ct":Landroid/gov/nist/javax/sip/header/ContentType;
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1295
    iput-object p3, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    .line 1296
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    .line 1297
    iput-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    .line 1300
    invoke-direct {p0, p3}, Landroid/gov/nist/javax/sip/message/SIPMessage;->computeContentLength(Ljava/lang/Object;)V

    .line 1301
    return-void

    .line 1292
    .end local v0    # "ct":Landroid/gov/nist/javax/sip/header/ContentType;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "messgeContent is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMessageContent(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "subType"    # Ljava/lang/String;
    .param p3, "messageContent"    # [B

    .line 1353
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentType;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/javax/sip/header/ContentType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1354
    .local v0, "ct":Landroid/gov/nist/javax/sip/header/ContentType;
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1355
    invoke-virtual {p0, p3}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setMessageContent([B)V

    .line 1357
    invoke-direct {p0, p3}, Landroid/gov/nist/javax/sip/message/SIPMessage;->computeContentLength(Ljava/lang/Object;)V

    .line 1358
    return-void
.end method

.method public setMessageContent([B)V
    .locals 1
    .param p1, "content"    # [B

    .line 1389
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->computeContentLength(Ljava/lang/Object;)V

    .line 1391
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    .line 1392
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    .line 1393
    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    .line 1394
    return-void
.end method

.method public setMessageContent([BZI)V
    .locals 3
    .param p1, "content"    # [B
    .param p2, "computeContentLength"    # Z
    .param p3, "givenLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1404
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->computeContentLength(Ljava/lang/Object;)V

    .line 1405
    if-nez p2, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/ContentLength;->getContentLength()I

    move-result v0

    if-lt v0, p3, :cond_0

    goto :goto_0

    .line 1407
    :cond_0
    new-instance v0, Ljava/text/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid content length "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/ContentLength;->getContentLength()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 1410
    :cond_1
    :goto_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    .line 1411
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    .line 1412
    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    .line 1413
    return-void
.end method

.method public setMessageContent([BZZI)V
    .locals 3
    .param p1, "content"    # [B
    .param p2, "strict"    # Z
    .param p3, "computeContentLength"    # Z
    .param p4, "givenLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1369
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->computeContentLength(Ljava/lang/Object;)V

    .line 1370
    if-nez p3, :cond_2

    .line 1371
    if-nez p2, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/ContentLength;->getContentLength()I

    move-result v0

    if-ne v0, p4, :cond_1

    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/ContentLength;->getContentLength()I

    move-result v0

    if-lt v0, p4, :cond_1

    goto :goto_0

    .line 1373
    :cond_1
    new-instance v0, Ljava/text/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid content length "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->contentLengthHeader:Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/ContentLength;->getContentLength()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 1378
    :cond_2
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContent:Ljava/lang/String;

    .line 1379
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentBytes:[B

    .line 1380
    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->messageContentObject:Ljava/lang/Object;

    .line 1381
    return-void
.end method

.method public setNullRequest()V
    .locals 1

    .line 1961
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->nullRequest:Z

    .line 1962
    return-void
.end method

.method public setPeerPacketSourceAddress(Ljava/net/InetAddress;)V
    .locals 0
    .param p1, "peerPacketSourceAddress"    # Ljava/net/InetAddress;

    .line 2061
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->peerPacketSourceAddress:Ljava/net/InetAddress;

    .line 2062
    return-void
.end method

.method public setPeerPacketSourcePort(I)V
    .locals 0
    .param p1, "peerPacketSourcePort"    # I

    .line 2069
    iput p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->peerPacketSourcePort:I

    .line 2070
    return-void
.end method

.method public setRemoteAddress(Ljava/net/InetAddress;)V
    .locals 0
    .param p1, "remoteAddress"    # Ljava/net/InetAddress;

    .line 2029
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->remoteAddress:Ljava/net/InetAddress;

    .line 2030
    return-void
.end method

.method public setRemotePort(I)V
    .locals 0
    .param p1, "remotePort"    # I

    .line 2037
    iput p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->remotePort:I

    .line 2038
    return-void
.end method

.method public abstract setSIPVersion(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public setSize(I)V
    .locals 0
    .param p1, "size"    # I

    .line 1795
    iput p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->size:I

    .line 1796
    return-void
.end method

.method public setTo(Landroid/javax/sip/header/ToHeader;)V
    .locals 0
    .param p1, "to"    # Landroid/javax/sip/header/ToHeader;

    .line 1223
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1224
    return-void
.end method

.method public setToTag(Ljava/lang/String;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;

    .line 1576
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/To;->setTag(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1578
    goto :goto_0

    .line 1577
    :catch_0
    move-exception v0

    .line 1579
    :goto_0
    return-void
.end method

.method protected setUnrecognizedHeadersList(Ljava/util/LinkedList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2015
    .local p1, "unrecognizedHeaders":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPMessage;->unrecognizedHeaders:Ljava/util/LinkedList;

    .line 2016
    return-void
.end method

.method public setVia(Ljava/util/List;)V
    .locals 3
    .param p1, "viaList"    # Ljava/util/List;

    .line 1088
    new-instance v0, Landroid/gov/nist/javax/sip/header/ViaList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ViaList;-><init>()V

    .line 1089
    .local v0, "vList":Landroid/gov/nist/javax/sip/header/ViaList;
    invoke-interface {p1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 1090
    .local v1, "it":Ljava/util/ListIterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1091
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/Via;

    .line 1092
    .local v2, "via":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/ViaList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 1093
    .end local v2    # "via":Landroid/gov/nist/javax/sip/header/Via;
    goto :goto_0

    .line 1094
    :cond_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setHeader(Landroid/gov/nist/javax/sip/header/SIPHeaderList;)V

    .line 1095
    return-void
.end method

.method public abstract toString()Ljava/lang/String;
.end method
