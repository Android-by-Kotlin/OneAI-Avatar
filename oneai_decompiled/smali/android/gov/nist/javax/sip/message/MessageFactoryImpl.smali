.class public Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;
.super Ljava/lang/Object;
.source "MessageFactoryImpl.java"

# interfaces
.implements Landroid/javax/sip/message/MessageFactory;
.implements Landroid/gov/nist/javax/sip/message/MessageFactoryExt;


# static fields
.field private static defaultContentEncodingCharset:Ljava/lang/String;

.field private static server:Landroid/javax/sip/header/ServerHeader;

.field private static userAgent:Landroid/javax/sip/header/UserAgentHeader;


# instance fields
.field private strict:Z

.field private testing:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 59
    const-string/jumbo v0, "UTF-8"

    sput-object v0, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->defaultContentEncodingCharset:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->testing:Z

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->strict:Z

    .line 90
    return-void
.end method

.method static synthetic access$000(Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;)Z
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;

    .line 53
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->testing:Z

    return v0
.end method

.method public static getDefaultContentEncodingCharset()Ljava/lang/String;
    .locals 1

    .line 828
    sget-object v0, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->defaultContentEncodingCharset:Ljava/lang/String;

    return-object v0
.end method

.method public static getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;
    .locals 1

    .line 812
    sget-object v0, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->server:Landroid/javax/sip/header/ServerHeader;

    return-object v0
.end method

.method public static getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;
    .locals 1

    .line 802
    sget-object v0, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    return-object v0
.end method


# virtual methods
.method public createMultipartMimeContent(Landroid/javax/sip/header/ContentTypeHeader;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/gov/nist/javax/sip/message/MultipartMimeContent;
    .locals 6
    .param p1, "multipartMimeCth"    # Landroid/javax/sip/header/ContentTypeHeader;
    .param p2, "contentType"    # [Ljava/lang/String;
    .param p3, "contentSubtype"    # [Ljava/lang/String;
    .param p4, "contentBody"    # [Ljava/lang/String;

    .line 836
    const-string/jumbo v0, "boundary"

    invoke-interface {p1, v0}, Landroid/javax/sip/header/ContentTypeHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 837
    .local v0, "boundary":Ljava/lang/String;
    new-instance v1, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;

    invoke-direct {v1, p1}, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;-><init>(Landroid/javax/sip/header/ContentTypeHeader;)V

    .line 838
    .local v1, "retval":Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p2

    if-ge v2, v3, :cond_0

    .line 839
    new-instance v3, Landroid/gov/nist/javax/sip/header/ContentType;

    aget-object v4, p2, v2

    aget-object v5, p3, v2

    invoke-direct {v3, v4, v5}, Landroid/gov/nist/javax/sip/header/ContentType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 840
    .local v3, "cth":Landroid/javax/sip/header/ContentTypeHeader;
    new-instance v4, Landroid/gov/nist/javax/sip/message/ContentImpl;

    aget-object v5, p4, v2

    invoke-direct {v4, v5}, Landroid/gov/nist/javax/sip/message/ContentImpl;-><init>(Ljava/lang/String;)V

    .line 841
    .local v4, "contentImpl":Landroid/gov/nist/javax/sip/message/ContentImpl;
    invoke-virtual {v4, v3}, Landroid/gov/nist/javax/sip/message/ContentImpl;->setContentTypeHeader(Landroid/javax/sip/header/ContentTypeHeader;)V

    .line 842
    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->add(Landroid/gov/nist/javax/sip/message/Content;)Z

    .line 838
    .end local v3    # "cth":Landroid/javax/sip/header/ContentTypeHeader;
    .end local v4    # "contentImpl":Landroid/gov/nist/javax/sip/message/ContentImpl;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 844
    .end local v2    # "i":I
    :cond_0
    return-object v1
.end method

.method public createRequest(Landroid/javax/sip/address/URI;Ljava/lang/String;Landroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;)Landroid/javax/sip/message/Request;
    .locals 3
    .param p1, "requestURI"    # Landroid/javax/sip/address/URI;
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "callId"    # Landroid/javax/sip/header/CallIdHeader;
    .param p4, "cSeq"    # Landroid/javax/sip/header/CSeqHeader;
    .param p5, "from"    # Landroid/javax/sip/header/FromHeader;
    .param p6, "to"    # Landroid/javax/sip/header/ToHeader;
    .param p7, "via"    # Ljava/util/List;
    .param p8, "maxForwards"    # Landroid/javax/sip/header/MaxForwardsHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 234
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    if-eqz p3, :cond_1

    if-eqz p4, :cond_1

    if-eqz p5, :cond_1

    if-eqz p6, :cond_1

    if-eqz p7, :cond_1

    if-eqz p8, :cond_1

    .line 241
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;-><init>()V

    .line 242
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestURI(Landroid/javax/sip/address/URI;)V

    .line 243
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMethod(Ljava/lang/String;)V

    .line 244
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setCallId(Landroid/javax/sip/header/CallIdHeader;)V

    .line 245
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setCSeq(Landroid/javax/sip/header/CSeqHeader;)V

    .line 246
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setFrom(Landroid/javax/sip/header/FromHeader;)V

    .line 247
    invoke-virtual {v0, p6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTo(Landroid/javax/sip/header/ToHeader;)V

    .line 248
    invoke-virtual {v0, p7}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setVia(Ljava/util/List;)V

    .line 249
    invoke-virtual {v0, p8}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMaxForwards(Landroid/javax/sip/header/MaxForwardsHeader;)V

    .line 250
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    if-eqz v1, :cond_0

    .line 251
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 254
    :cond_0
    return-object v0

    .line 237
    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_1
    new-instance v0, Ljava/text/ParseException;

    const-string v1, "JAIN-SIP Exception, some parameters are missing, unable to create the request"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public createRequest(Landroid/javax/sip/address/URI;Ljava/lang/String;Landroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;Landroid/javax/sip/header/ContentTypeHeader;Ljava/lang/Object;)Landroid/javax/sip/message/Request;
    .locals 2
    .param p1, "requestURI"    # Landroid/javax/sip/address/URI;
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "callId"    # Landroid/javax/sip/header/CallIdHeader;
    .param p4, "cSeq"    # Landroid/javax/sip/header/CSeqHeader;
    .param p5, "from"    # Landroid/javax/sip/header/FromHeader;
    .param p6, "to"    # Landroid/javax/sip/header/ToHeader;
    .param p7, "via"    # Ljava/util/List;
    .param p8, "maxForwards"    # Landroid/javax/sip/header/MaxForwardsHeader;
    .param p9, "contentType"    # Landroid/javax/sip/header/ContentTypeHeader;
    .param p10, "content"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 126
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    if-eqz p3, :cond_1

    if-eqz p4, :cond_1

    if-eqz p5, :cond_1

    if-eqz p6, :cond_1

    if-eqz p7, :cond_1

    if-eqz p8, :cond_1

    if-eqz p10, :cond_1

    if-eqz p9, :cond_1

    .line 132
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;-><init>()V

    .line 133
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestURI(Landroid/javax/sip/address/URI;)V

    .line 134
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMethod(Ljava/lang/String;)V

    .line 135
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setCallId(Landroid/javax/sip/header/CallIdHeader;)V

    .line 136
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setCSeq(Landroid/javax/sip/header/CSeqHeader;)V

    .line 137
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setFrom(Landroid/javax/sip/header/FromHeader;)V

    .line 138
    invoke-virtual {v0, p6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTo(Landroid/javax/sip/header/ToHeader;)V

    .line 139
    invoke-virtual {v0, p7}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setVia(Ljava/util/List;)V

    .line 140
    invoke-virtual {v0, p8}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMaxForwards(Landroid/javax/sip/header/MaxForwardsHeader;)V

    .line 141
    invoke-virtual {v0, p10, p9}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setContent(Ljava/lang/Object;Landroid/javax/sip/header/ContentTypeHeader;)V

    .line 142
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    if-eqz v1, :cond_0

    .line 143
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 146
    :cond_0
    return-object v0

    .line 130
    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null parameters"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRequest(Landroid/javax/sip/address/URI;Ljava/lang/String;Landroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;Landroid/javax/sip/header/ContentTypeHeader;[B)Landroid/javax/sip/message/Request;
    .locals 2
    .param p1, "requestURI"    # Landroid/javax/sip/address/URI;
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "callId"    # Landroid/javax/sip/header/CallIdHeader;
    .param p4, "cSeq"    # Landroid/javax/sip/header/CSeqHeader;
    .param p5, "from"    # Landroid/javax/sip/header/FromHeader;
    .param p6, "to"    # Landroid/javax/sip/header/ToHeader;
    .param p7, "via"    # Ljava/util/List;
    .param p8, "maxForwards"    # Landroid/javax/sip/header/MaxForwardsHeader;
    .param p9, "contentType"    # Landroid/javax/sip/header/ContentTypeHeader;
    .param p10, "content"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 549
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    if-eqz p3, :cond_1

    if-eqz p4, :cond_1

    if-eqz p5, :cond_1

    if-eqz p6, :cond_1

    if-eqz p7, :cond_1

    if-eqz p8, :cond_1

    if-eqz p10, :cond_1

    if-eqz p9, :cond_1

    .line 555
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;-><init>()V

    .line 556
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestURI(Landroid/javax/sip/address/URI;)V

    .line 557
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMethod(Ljava/lang/String;)V

    .line 558
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setCallId(Landroid/javax/sip/header/CallIdHeader;)V

    .line 559
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setCSeq(Landroid/javax/sip/header/CSeqHeader;)V

    .line 560
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setFrom(Landroid/javax/sip/header/FromHeader;)V

    .line 561
    invoke-virtual {v0, p6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTo(Landroid/javax/sip/header/ToHeader;)V

    .line 562
    invoke-virtual {v0, p7}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setVia(Ljava/util/List;)V

    .line 563
    invoke-virtual {v0, p8}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMaxForwards(Landroid/javax/sip/header/MaxForwardsHeader;)V

    .line 564
    invoke-virtual {v0, p10, p9}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setContent(Ljava/lang/Object;Landroid/javax/sip/header/ContentTypeHeader;)V

    .line 565
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    if-eqz v1, :cond_0

    .line 566
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 568
    :cond_0
    return-object v0

    .line 553
    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "missing parameters"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRequest(Landroid/javax/sip/address/URI;Ljava/lang/String;Landroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;[BLandroid/javax/sip/header/ContentTypeHeader;)Landroid/javax/sip/message/Request;
    .locals 3
    .param p1, "requestURI"    # Landroid/javax/sip/address/URI;
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "callId"    # Landroid/javax/sip/header/CallIdHeader;
    .param p4, "cSeq"    # Landroid/javax/sip/header/CSeqHeader;
    .param p5, "from"    # Landroid/javax/sip/header/FromHeader;
    .param p6, "to"    # Landroid/javax/sip/header/ToHeader;
    .param p7, "via"    # Ljava/util/List;
    .param p8, "maxForwards"    # Landroid/javax/sip/header/MaxForwardsHeader;
    .param p9, "content"    # [B
    .param p10, "contentType"    # Landroid/javax/sip/header/ContentTypeHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 182
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    if-eqz p3, :cond_1

    if-eqz p4, :cond_1

    if-eqz p5, :cond_1

    if-eqz p6, :cond_1

    if-eqz p7, :cond_1

    if-eqz p8, :cond_1

    if-eqz p9, :cond_1

    if-eqz p10, :cond_1

    .line 190
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;-><init>()V

    .line 191
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestURI(Landroid/javax/sip/address/URI;)V

    .line 192
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMethod(Ljava/lang/String;)V

    .line 193
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setCallId(Landroid/javax/sip/header/CallIdHeader;)V

    .line 194
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setCSeq(Landroid/javax/sip/header/CSeqHeader;)V

    .line 195
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setFrom(Landroid/javax/sip/header/FromHeader;)V

    .line 196
    invoke-virtual {v0, p6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTo(Landroid/javax/sip/header/ToHeader;)V

    .line 197
    invoke-virtual {v0, p7}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setVia(Ljava/util/List;)V

    .line 198
    invoke-virtual {v0, p8}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMaxForwards(Landroid/javax/sip/header/MaxForwardsHeader;)V

    .line 199
    move-object v1, p10

    check-cast v1, Landroid/gov/nist/javax/sip/header/ContentType;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 200
    invoke-virtual {v0, p9}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMessageContent([B)V

    .line 201
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    if-eqz v1, :cond_0

    .line 202
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 204
    :cond_0
    return-object v0

    .line 186
    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_1
    new-instance v0, Ljava/text/ParseException;

    const-string v1, "JAIN-SIP Exception, some parameters are missing, unable to create the request"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public createRequest(Ljava/lang/String;)Landroid/javax/sip/message/Request;
    .locals 6
    .param p1, "requestString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 693
    if-eqz p1, :cond_3

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 699
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;-><init>()V

    .line 706
    .local v0, "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    new-instance v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl$1;

    invoke-direct {v1, p0}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl$1;-><init>(Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;)V

    .line 732
    .local v1, "parseExceptionListener":Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;
    const/4 v2, 0x0

    .line 733
    .local v2, "exHandler":Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;
    iget-boolean v3, p0, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->testing:Z

    if-eqz v3, :cond_1

    .line 734
    move-object v2, v1

    .line 736
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    const/4 v4, 0x1

    iget-boolean v5, p0, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->strict:Z

    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v3

    .line 738
    .local v3, "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    instance-of v4, v3, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v4, :cond_2

    .line 741
    move-object v4, v3

    check-cast v4, Landroid/gov/nist/javax/sip/message/SIPRequest;

    return-object v4

    .line 739
    :cond_2
    new-instance v4, Ljava/text/ParseException;

    const/4 v5, 0x0

    invoke-direct {v4, p1, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 694
    .end local v0    # "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    .end local v1    # "parseExceptionListener":Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;
    .end local v2    # "exHandler":Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;
    .end local v3    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :cond_3
    :goto_0
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;-><init>()V

    .line 695
    .local v0, "retval":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setNullRequest()V

    .line 696
    return-object v0
.end method

.method public createResponse(ILandroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;)Landroid/javax/sip/message/Response;
    .locals 3
    .param p1, "statusCode"    # I
    .param p2, "callId"    # Landroid/javax/sip/header/CallIdHeader;
    .param p3, "cSeq"    # Landroid/javax/sip/header/CSeqHeader;
    .param p4, "from"    # Landroid/javax/sip/header/FromHeader;
    .param p5, "to"    # Landroid/javax/sip/header/ToHeader;
    .param p6, "via"    # Ljava/util/List;
    .param p7, "maxForwards"    # Landroid/javax/sip/header/MaxForwardsHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 393
    if-eqz p2, :cond_1

    if-eqz p3, :cond_1

    if-eqz p4, :cond_1

    if-eqz p5, :cond_1

    if-eqz p6, :cond_1

    if-eqz p7, :cond_1

    .line 399
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;-><init>()V

    .line 400
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setStatusCode(I)V

    .line 401
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setCallId(Landroid/javax/sip/header/CallIdHeader;)V

    .line 402
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setCSeq(Landroid/javax/sip/header/CSeqHeader;)V

    .line 403
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setFrom(Landroid/javax/sip/header/FromHeader;)V

    .line 404
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setTo(Landroid/javax/sip/header/ToHeader;)V

    .line 405
    invoke-virtual {v0, p6}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setVia(Ljava/util/List;)V

    .line 406
    invoke-virtual {v0, p7}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setMaxForwards(Landroid/javax/sip/header/MaxForwardsHeader;)V

    .line 407
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    if-eqz v1, :cond_0

    .line 408
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 410
    :cond_0
    return-object v0

    .line 395
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :cond_1
    new-instance v0, Ljava/text/ParseException;

    const-string v1, "JAIN-SIP Exception, some parameters are missing, unable to create the response"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public createResponse(ILandroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;Landroid/javax/sip/header/ContentTypeHeader;Ljava/lang/Object;)Landroid/javax/sip/message/Response;
    .locals 6
    .param p1, "statusCode"    # I
    .param p2, "callId"    # Landroid/javax/sip/header/CallIdHeader;
    .param p3, "cSeq"    # Landroid/javax/sip/header/CSeqHeader;
    .param p4, "from"    # Landroid/javax/sip/header/FromHeader;
    .param p5, "to"    # Landroid/javax/sip/header/ToHeader;
    .param p6, "via"    # Ljava/util/List;
    .param p7, "maxForwards"    # Landroid/javax/sip/header/MaxForwardsHeader;
    .param p8, "contentType"    # Landroid/javax/sip/header/ContentTypeHeader;
    .param p9, "content"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 602
    if-eqz p2, :cond_2

    if-eqz p3, :cond_2

    if-eqz p4, :cond_2

    if-eqz p5, :cond_2

    if-eqz p6, :cond_2

    if-eqz p7, :cond_2

    if-eqz p9, :cond_2

    if-eqz p8, :cond_2

    .line 606
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;-><init>()V

    .line 607
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    new-instance v1, Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/StatusLine;-><init>()V

    .line 608
    .local v1, "statusLine":Landroid/gov/nist/javax/sip/header/StatusLine;
    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/header/StatusLine;->setStatusCode(I)V

    .line 609
    invoke-static {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getReasonPhrase(I)Ljava/lang/String;

    move-result-object v2

    .line 610
    .local v2, "reason":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 612
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/header/StatusLine;->setReasonPhrase(Ljava/lang/String;)V

    .line 613
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setStatusLine(Landroid/gov/nist/javax/sip/header/StatusLine;)V

    .line 614
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setCallId(Landroid/javax/sip/header/CallIdHeader;)V

    .line 615
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setCSeq(Landroid/javax/sip/header/CSeqHeader;)V

    .line 616
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setFrom(Landroid/javax/sip/header/FromHeader;)V

    .line 617
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setTo(Landroid/javax/sip/header/ToHeader;)V

    .line 618
    invoke-virtual {v0, p6}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setVia(Ljava/util/List;)V

    .line 619
    invoke-virtual {v0, p9, p8}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setContent(Ljava/lang/Object;Landroid/javax/sip/header/ContentTypeHeader;)V

    .line 620
    sget-object v3, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    if-eqz v3, :cond_0

    .line 621
    sget-object v3, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 623
    :cond_0
    return-object v0

    .line 611
    :cond_1
    new-instance v3, Ljava/text/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " Unknown"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 605
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v1    # "statusLine":Landroid/gov/nist/javax/sip/header/StatusLine;
    .end local v2    # "reason":Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "missing parameters"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createResponse(ILandroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;Landroid/javax/sip/header/ContentTypeHeader;[B)Landroid/javax/sip/message/Response;
    .locals 6
    .param p1, "statusCode"    # I
    .param p2, "callId"    # Landroid/javax/sip/header/CallIdHeader;
    .param p3, "cSeq"    # Landroid/javax/sip/header/CSeqHeader;
    .param p4, "from"    # Landroid/javax/sip/header/FromHeader;
    .param p5, "to"    # Landroid/javax/sip/header/ToHeader;
    .param p6, "via"    # Ljava/util/List;
    .param p7, "maxForwards"    # Landroid/javax/sip/header/MaxForwardsHeader;
    .param p8, "contentType"    # Landroid/javax/sip/header/ContentTypeHeader;
    .param p9, "content"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 658
    if-eqz p2, :cond_2

    if-eqz p3, :cond_2

    if-eqz p4, :cond_2

    if-eqz p5, :cond_2

    if-eqz p6, :cond_2

    if-eqz p7, :cond_2

    if-eqz p9, :cond_2

    if-eqz p8, :cond_2

    .line 662
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;-><init>()V

    .line 663
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    new-instance v1, Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/StatusLine;-><init>()V

    .line 664
    .local v1, "statusLine":Landroid/gov/nist/javax/sip/header/StatusLine;
    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/header/StatusLine;->setStatusCode(I)V

    .line 665
    invoke-static {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getReasonPhrase(I)Ljava/lang/String;

    move-result-object v2

    .line 666
    .local v2, "reason":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 668
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/header/StatusLine;->setReasonPhrase(Ljava/lang/String;)V

    .line 669
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setStatusLine(Landroid/gov/nist/javax/sip/header/StatusLine;)V

    .line 670
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setCallId(Landroid/javax/sip/header/CallIdHeader;)V

    .line 671
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setCSeq(Landroid/javax/sip/header/CSeqHeader;)V

    .line 672
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setFrom(Landroid/javax/sip/header/FromHeader;)V

    .line 673
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setTo(Landroid/javax/sip/header/ToHeader;)V

    .line 674
    invoke-virtual {v0, p6}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setVia(Ljava/util/List;)V

    .line 675
    invoke-virtual {v0, p9, p8}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setContent(Ljava/lang/Object;Landroid/javax/sip/header/ContentTypeHeader;)V

    .line 676
    sget-object v3, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    if-eqz v3, :cond_0

    .line 677
    sget-object v3, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 679
    :cond_0
    return-object v0

    .line 667
    :cond_1
    new-instance v3, Ljava/text/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : Unknown"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 661
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v1    # "statusLine":Landroid/gov/nist/javax/sip/header/StatusLine;
    .end local v2    # "reason":Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "missing parameters"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createResponse(ILandroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;Ljava/lang/Object;Landroid/javax/sip/header/ContentTypeHeader;)Landroid/javax/sip/message/Response;
    .locals 4
    .param p1, "statusCode"    # I
    .param p2, "callId"    # Landroid/javax/sip/header/CallIdHeader;
    .param p3, "cSeq"    # Landroid/javax/sip/header/CSeqHeader;
    .param p4, "from"    # Landroid/javax/sip/header/FromHeader;
    .param p5, "to"    # Landroid/javax/sip/header/ToHeader;
    .param p6, "via"    # Ljava/util/List;
    .param p7, "maxForwards"    # Landroid/javax/sip/header/MaxForwardsHeader;
    .param p8, "content"    # Ljava/lang/Object;
    .param p9, "contentType"    # Landroid/javax/sip/header/ContentTypeHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 290
    if-eqz p2, :cond_1

    if-eqz p3, :cond_1

    if-eqz p4, :cond_1

    if-eqz p5, :cond_1

    if-eqz p6, :cond_1

    if-eqz p7, :cond_1

    if-eqz p8, :cond_1

    if-eqz p9, :cond_1

    .line 295
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;-><init>()V

    .line 296
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    new-instance v1, Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/StatusLine;-><init>()V

    .line 297
    .local v1, "statusLine":Landroid/gov/nist/javax/sip/header/StatusLine;
    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/header/StatusLine;->setStatusCode(I)V

    .line 298
    invoke-static {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getReasonPhrase(I)Ljava/lang/String;

    move-result-object v2

    .line 301
    .local v2, "reasonPhrase":Ljava/lang/String;
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/header/StatusLine;->setReasonPhrase(Ljava/lang/String;)V

    .line 302
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setStatusLine(Landroid/gov/nist/javax/sip/header/StatusLine;)V

    .line 303
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setCallId(Landroid/javax/sip/header/CallIdHeader;)V

    .line 304
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setCSeq(Landroid/javax/sip/header/CSeqHeader;)V

    .line 305
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setFrom(Landroid/javax/sip/header/FromHeader;)V

    .line 306
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setTo(Landroid/javax/sip/header/ToHeader;)V

    .line 307
    invoke-virtual {v0, p6}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setVia(Ljava/util/List;)V

    .line 308
    invoke-virtual {v0, p7}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setMaxForwards(Landroid/javax/sip/header/MaxForwardsHeader;)V

    .line 309
    invoke-virtual {v0, p8, p9}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setContent(Ljava/lang/Object;Landroid/javax/sip/header/ContentTypeHeader;)V

    .line 310
    sget-object v3, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    if-eqz v3, :cond_0

    .line 311
    sget-object v3, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 313
    :cond_0
    return-object v0

    .line 293
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v1    # "statusLine":Landroid/gov/nist/javax/sip/header/StatusLine;
    .end local v2    # "reasonPhrase":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, " unable to create the response"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createResponse(ILandroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;[BLandroid/javax/sip/header/ContentTypeHeader;)Landroid/javax/sip/message/Response;
    .locals 2
    .param p1, "statusCode"    # I
    .param p2, "callId"    # Landroid/javax/sip/header/CallIdHeader;
    .param p3, "cSeq"    # Landroid/javax/sip/header/CSeqHeader;
    .param p4, "from"    # Landroid/javax/sip/header/FromHeader;
    .param p5, "to"    # Landroid/javax/sip/header/ToHeader;
    .param p6, "via"    # Ljava/util/List;
    .param p7, "maxForwards"    # Landroid/javax/sip/header/MaxForwardsHeader;
    .param p8, "content"    # [B
    .param p9, "contentType"    # Landroid/javax/sip/header/ContentTypeHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 347
    if-eqz p2, :cond_1

    if-eqz p3, :cond_1

    if-eqz p4, :cond_1

    if-eqz p5, :cond_1

    if-eqz p6, :cond_1

    if-eqz p7, :cond_1

    if-eqz p8, :cond_1

    if-eqz p9, :cond_1

    .line 352
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;-><init>()V

    .line 353
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setStatusCode(I)V

    .line 354
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setCallId(Landroid/javax/sip/header/CallIdHeader;)V

    .line 355
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setCSeq(Landroid/javax/sip/header/CSeqHeader;)V

    .line 356
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setFrom(Landroid/javax/sip/header/FromHeader;)V

    .line 357
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setTo(Landroid/javax/sip/header/ToHeader;)V

    .line 358
    invoke-virtual {v0, p6}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setVia(Ljava/util/List;)V

    .line 359
    invoke-virtual {v0, p7}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setMaxForwards(Landroid/javax/sip/header/MaxForwardsHeader;)V

    .line 360
    move-object v1, p9

    check-cast v1, Landroid/gov/nist/javax/sip/header/ContentType;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 361
    invoke-virtual {v0, p8}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setMessageContent([B)V

    .line 362
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    if-eqz v1, :cond_0

    .line 363
    sget-object v1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 365
    :cond_0
    return-object v0

    .line 350
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null params "

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createResponse(ILandroid/javax/sip/message/Request;)Landroid/javax/sip/message/Response;
    .locals 3
    .param p1, "statusCode"    # I
    .param p2, "request"    # Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 497
    if-eqz p2, :cond_1

    .line 503
    move-object v0, p2

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 504
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v1

    .line 507
    .local v1, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->removeContent()V

    .line 508
    const-string v2, "Content-Type"

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->removeHeader(Ljava/lang/String;)V

    .line 509
    sget-object v2, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->server:Landroid/javax/sip/header/ServerHeader;

    if-eqz v2, :cond_0

    .line 510
    sget-object v2, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->server:Landroid/javax/sip/header/ServerHeader;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 512
    :cond_0
    return-object v1

    .line 498
    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v1    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null parameters"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createResponse(ILandroid/javax/sip/message/Request;Landroid/javax/sip/header/ContentTypeHeader;Ljava/lang/Object;)Landroid/javax/sip/message/Response;
    .locals 3
    .param p1, "statusCode"    # I
    .param p2, "request"    # Landroid/javax/sip/message/Request;
    .param p3, "contentType"    # Landroid/javax/sip/header/ContentTypeHeader;
    .param p4, "content"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 436
    if-eqz p2, :cond_1

    if-eqz p4, :cond_1

    if-eqz p3, :cond_1

    .line 439
    move-object v0, p2

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 440
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v1

    .line 441
    .local v1, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual {v1, p4, p3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setContent(Ljava/lang/Object;Landroid/javax/sip/header/ContentTypeHeader;)V

    .line 442
    sget-object v2, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->server:Landroid/javax/sip/header/ServerHeader;

    if-eqz v2, :cond_0

    .line 443
    sget-object v2, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->server:Landroid/javax/sip/header/ServerHeader;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 445
    :cond_0
    return-object v1

    .line 437
    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v1    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null parameters"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createResponse(ILandroid/javax/sip/message/Request;Landroid/javax/sip/header/ContentTypeHeader;[B)Landroid/javax/sip/message/Response;
    .locals 3
    .param p1, "statusCode"    # I
    .param p2, "request"    # Landroid/javax/sip/message/Request;
    .param p3, "contentType"    # Landroid/javax/sip/header/ContentTypeHeader;
    .param p4, "content"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 469
    if-eqz p2, :cond_1

    if-eqz p4, :cond_1

    if-eqz p3, :cond_1

    .line 472
    move-object v0, p2

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 473
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v1

    .line 474
    .local v1, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    move-object v2, p3

    check-cast v2, Landroid/gov/nist/javax/sip/header/ContentType;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 475
    invoke-virtual {v1, p4}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setMessageContent([B)V

    .line 476
    sget-object v2, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->server:Landroid/javax/sip/header/ServerHeader;

    if-eqz v2, :cond_0

    .line 477
    sget-object v2, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->server:Landroid/javax/sip/header/ServerHeader;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 479
    :cond_0
    return-object v1

    .line 470
    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v1    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null Parameters"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createResponse(Ljava/lang/String;)Landroid/javax/sip/message/Response;
    .locals 5
    .param p1, "responseString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 754
    if-nez p1, :cond_0

    .line 755
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;-><init>()V

    return-object v0

    .line 757
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;-><init>()V

    .line 759
    .local v0, "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v4, v3}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v1

    .line 761
    .local v1, "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    instance-of v2, v1, Landroid/gov/nist/javax/sip/message/SIPResponse;

    if-eqz v2, :cond_1

    .line 764
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/message/SIPResponse;

    return-object v2

    .line 762
    :cond_1
    new-instance v2, Ljava/text/ParseException;

    invoke-direct {v2, p1, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public setDefaultContentEncodingCharset(Ljava/lang/String;)V
    .locals 2
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 822
    if-eqz p1, :cond_0

    .line 823
    sput-object p1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->defaultContentEncodingCharset:Ljava/lang/String;

    .line 825
    return-void

    .line 822
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null argument!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDefaultServerHeader(Landroid/javax/sip/header/ServerHeader;)V
    .locals 0
    .param p1, "server"    # Landroid/javax/sip/header/ServerHeader;

    .line 792
    sput-object p1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->server:Landroid/javax/sip/header/ServerHeader;

    .line 793
    return-void
.end method

.method public setDefaultUserAgentHeader(Landroid/javax/sip/header/UserAgentHeader;)V
    .locals 0
    .param p1, "userAgent"    # Landroid/javax/sip/header/UserAgentHeader;

    .line 778
    sput-object p1, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->userAgent:Landroid/javax/sip/header/UserAgentHeader;

    .line 779
    return-void
.end method

.method public setStrict(Z)V
    .locals 0
    .param p1, "strict"    # Z

    .line 74
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->strict:Z

    .line 75
    return-void
.end method

.method public setTest(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .line 83
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->testing:Z

    .line 84
    return-void
.end method
