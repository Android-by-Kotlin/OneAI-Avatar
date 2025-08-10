.class public Landroid/javax/sdp/SdpFactory;
.super Ljava/lang/Object;
.source "SdpFactory.java"


# static fields
.field private static final singletonInstance:Landroid/javax/sdp/SdpFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    new-instance v0, Landroid/javax/sdp/SdpFactory;

    invoke-direct {v0}, Landroid/javax/sdp/SdpFactory;-><init>()V

    sput-object v0, Landroid/javax/sdp/SdpFactory;->singletonInstance:Landroid/javax/sdp/SdpFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public static getDateFromNtp(J)Ljava/util/Date;
    .locals 5
    .param p0, "ntpTime"    # J

    .line 724
    new-instance v0, Ljava/util/Date;

    const-wide v1, 0x83aa7e80L

    sub-long v1, p0, v1

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public static getInstance()Landroid/javax/sdp/SdpFactory;
    .locals 1

    .line 46
    sget-object v0, Landroid/javax/sdp/SdpFactory;->singletonInstance:Landroid/javax/sdp/SdpFactory;

    return-object v0
.end method

.method public static getNtpTime(Ljava/util/Date;)J
    .locals 4
    .param p0, "d"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 735
    if-nez p0, :cond_0

    .line 736
    const-wide/16 v0, -0x1

    return-wide v0

    .line 737
    :cond_0
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    const-wide v2, 0x83aa7e80L

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 11
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;,
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 743
    const-string/jumbo v0, "v=0\r\no=CiscoSystemsSIP-GW-UserAgent 2578 3027 IN IP4 83.211.215.216\r\ns=SIP Call\r\nc=IN IP4 62.94.199.36\r\nt=0 0\r\nm=audio 62278 RTP/AVP 18 8 0 4 3 125 101 19\r\nc=IN IP4 62.94.199.36\r\na=rtpmap:18 G729/8000\r\na=fmtp:18 annexb=yes\r\na=rtpmap:8 PCMA/8000\r\na=rtpmap:0 PCMU/8000\r\na=rtpmap:4 G723/8000\r\na=fmtp:4 bitrate=5.3;annexa=no\r\na=rtpmap:3 GSM/8000\r\na=rtpmap:125 X-CCD/8000\r\na=rtpmap:101 telephone-event/8000\r\na=fmtp:101 0-16\r\na=rtpmap:19 CN/8000\r\na=direction:passive\r\n"

    .line 756
    .local v0, "sdpFields":Ljava/lang/String;
    new-instance v1, Landroid/javax/sdp/SdpFactory;

    invoke-direct {v1}, Landroid/javax/sdp/SdpFactory;-><init>()V

    .line 757
    .local v1, "sdpFactory":Landroid/javax/sdp/SdpFactory;
    invoke-virtual {v1, v0}, Landroid/javax/sdp/SdpFactory;->createSessionDescription(Ljava/lang/String;)Landroid/javax/sdp/SessionDescription;

    move-result-object v2

    .line 760
    .local v2, "sessionDescription":Landroid/javax/sdp/SessionDescription;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "sessionDescription = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 761
    const/4 v3, 0x1

    invoke-interface {v2, v3}, Landroid/javax/sdp/SessionDescription;->getMediaDescriptions(Z)Ljava/util/Vector;

    move-result-object v3

    .line 764
    .local v3, "mediaDescriptions":Ljava/util/Vector;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v4, v5, :cond_0

    .line 765
    invoke-virtual {v3, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/javax/sdp/MediaDescription;

    .line 767
    .local v5, "m":Landroid/javax/sdp/MediaDescription;
    move-object v6, v5

    check-cast v6, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    const-string/jumbo v7, "sendrecv"

    invoke-virtual {v6, v7}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setDuplexity(Ljava/lang/String;)V

    .line 768
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "m = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 769
    invoke-interface {v5}, Landroid/javax/sdp/MediaDescription;->getMedia()Landroid/javax/sdp/Media;

    move-result-object v6

    .line 770
    .local v6, "media":Landroid/javax/sdp/Media;
    const/4 v7, 0x0

    invoke-interface {v6, v7}, Landroid/javax/sdp/Media;->getMediaFormats(Z)Ljava/util/Vector;

    move-result-object v7

    .line 771
    .local v7, "formats":Ljava/util/Vector;
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "formats = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 764
    .end local v5    # "m":Landroid/javax/sdp/MediaDescription;
    .end local v6    # "media":Landroid/javax/sdp/Media;
    .end local v7    # "formats":Ljava/util/Vector;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 773
    .end local v4    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public createAttribute(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sdp/Attribute;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 168
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;-><init>()V

    .line 171
    .local v0, "attributeImpl":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setName(Ljava/lang/String;)V

    .line 172
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setValueAllowNull(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    goto :goto_0

    .line 174
    :catch_0
    move-exception v1

    .line 175
    .local v1, "s":Landroid/javax/sdp/SdpException;
    invoke-virtual {v1}, Landroid/javax/sdp/SdpException;->printStackTrace()V

    .line 177
    .end local v1    # "s":Landroid/javax/sdp/SdpException;
    :goto_0
    return-object v0
.end method

.method public createBandwidth(Ljava/lang/String;I)Landroid/javax/sdp/BandWidth;
    .locals 2
    .param p1, "modifier"    # Ljava/lang/String;
    .param p2, "value"    # I

    .line 146
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;-><init>()V

    .line 149
    .local v0, "bandWidthImpl":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->setType(Ljava/lang/String;)V

    .line 150
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->setValue(I)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    goto :goto_0

    .line 152
    :catch_0
    move-exception v1

    .line 153
    .local v1, "s":Landroid/javax/sdp/SdpException;
    invoke-virtual {v1}, Landroid/javax/sdp/SdpException;->printStackTrace()V

    .line 155
    .end local v1    # "s":Landroid/javax/sdp/SdpException;
    :goto_0
    return-object v0
.end method

.method public createConnection(Ljava/lang/String;)Landroid/javax/sdp/Connection;
    .locals 2
    .param p1, "addr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 623
    const-string v0, "IN"

    const-string v1, "IP4"

    invoke-virtual {p0, v0, v1, p1}, Landroid/javax/sdp/SdpFactory;->createConnection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sdp/Connection;

    move-result-object v0

    return-object v0
.end method

.method public createConnection(Ljava/lang/String;II)Landroid/javax/sdp/Connection;
    .locals 1
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "ttl"    # I
    .param p3, "numAddrs"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 602
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;-><init>()V

    .line 604
    .local v0, "connectionImpl":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setAddress(Ljava/lang/String;)V

    .line 606
    return-object v0
.end method

.method public createConnection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sdp/Connection;
    .locals 1
    .param p1, "netType"    # Ljava/lang/String;
    .param p2, "addrType"    # Ljava/lang/String;
    .param p3, "addr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 579
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;-><init>()V

    .line 581
    .local v0, "connectionImpl":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setNetworkType(Ljava/lang/String;)V

    .line 582
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setAddressType(Ljava/lang/String;)V

    .line 583
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setAddress(Ljava/lang/String;)V

    .line 585
    return-object v0
.end method

.method public createConnection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)Landroid/javax/sdp/Connection;
    .locals 1
    .param p1, "netType"    # Ljava/lang/String;
    .param p2, "addrType"    # Ljava/lang/String;
    .param p3, "addr"    # Ljava/lang/String;
    .param p4, "ttl"    # I
    .param p5, "numAddrs"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 554
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;-><init>()V

    .line 556
    .local v0, "connectionImpl":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setNetworkType(Ljava/lang/String;)V

    .line 557
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setAddressType(Ljava/lang/String;)V

    .line 558
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setAddress(Ljava/lang/String;)V

    .line 560
    return-object v0
.end method

.method public createEMail(Ljava/lang/String;)Landroid/javax/sdp/EMail;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 226
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/EmailField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/EmailField;-><init>()V

    .line 229
    .local v0, "emailImpl":Landroid/gov/nist/javax/sdp/fields/EmailField;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/EmailField;->setValue(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    goto :goto_0

    .line 231
    :catch_0
    move-exception v1

    .line 232
    .local v1, "s":Landroid/javax/sdp/SdpException;
    invoke-virtual {v1}, Landroid/javax/sdp/SdpException;->printStackTrace()V

    .line 234
    .end local v1    # "s":Landroid/javax/sdp/SdpException;
    :goto_0
    return-object v0
.end method

.method public createInfo(Ljava/lang/String;)Landroid/javax/sdp/Info;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 188
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/InformationField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/InformationField;-><init>()V

    .line 191
    .local v0, "infoImpl":Landroid/gov/nist/javax/sdp/fields/InformationField;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/InformationField;->setValue(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    goto :goto_0

    .line 193
    :catch_0
    move-exception v1

    .line 194
    .local v1, "s":Landroid/javax/sdp/SdpException;
    invoke-virtual {v1}, Landroid/javax/sdp/SdpException;->printStackTrace()V

    .line 196
    .end local v1    # "s":Landroid/javax/sdp/SdpException;
    :goto_0
    return-object v0
.end method

.method public createKey(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sdp/Key;
    .locals 3
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .line 282
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/KeyField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/KeyField;-><init>()V

    .line 285
    .local v0, "keyImpl":Landroid/gov/nist/javax/sdp/fields/KeyField;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/KeyField;->setMethod(Ljava/lang/String;)V

    .line 286
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sdp/fields/KeyField;->setKey(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    nop

    .line 292
    return-object v0

    .line 288
    :catch_0
    move-exception v1

    .line 289
    .local v1, "s":Landroid/javax/sdp/SdpException;
    invoke-virtual {v1}, Landroid/javax/sdp/SdpException;->printStackTrace()V

    .line 290
    const/4 v2, 0x0

    return-object v2
.end method

.method public createMedia(Ljava/lang/String;IILjava/lang/String;Ljava/util/Vector;)Landroid/javax/sdp/Media;
    .locals 1
    .param p1, "media"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "numPorts"    # I
    .param p4, "transport"    # Ljava/lang/String;
    .param p5, "staticRtpAvpTypes"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 333
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/MediaField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/MediaField;-><init>()V

    .line 334
    .local v0, "mediaImpl":Landroid/gov/nist/javax/sdp/fields/MediaField;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMediaType(Ljava/lang/String;)V

    .line 335
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMediaPort(I)V

    .line 336
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setPortCount(I)V

    .line 337
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setProtocol(Ljava/lang/String;)V

    .line 338
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMediaFormats(Ljava/util/Vector;)V

    .line 339
    return-object v0
.end method

.method public createMediaDescription(Ljava/lang/String;IILjava/lang/String;[I)Landroid/javax/sdp/MediaDescription;
    .locals 6
    .param p1, "media"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "numPorts"    # I
    .param p4, "transport"    # Ljava/lang/String;
    .param p5, "staticRtpAvpTypes"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 420
    new-instance v0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;-><init>()V

    .line 421
    .local v0, "mediaDescriptionImpl":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    new-instance v1, Landroid/gov/nist/javax/sdp/fields/MediaField;

    invoke-direct {v1}, Landroid/gov/nist/javax/sdp/fields/MediaField;-><init>()V

    .line 422
    .local v1, "mediaImpl":Landroid/gov/nist/javax/sdp/fields/MediaField;
    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMediaType(Ljava/lang/String;)V

    .line 423
    invoke-virtual {v1, p2}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMediaPort(I)V

    .line 424
    invoke-virtual {v1, p3}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setPortCount(I)V

    .line 425
    invoke-virtual {v1, p4}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setProtocol(Ljava/lang/String;)V

    .line 426
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setMedia(Landroid/javax/sdp/Media;)V

    .line 428
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 429
    .local v2, "payload":Ljava/util/Vector;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, p5

    if-ge v3, v4, :cond_0

    .line 430
    new-instance v4, Ljava/lang/Integer;

    aget v5, p5, v3

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v4}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 429
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 431
    .end local v3    # "i":I
    :cond_0
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMediaFormats(Ljava/util/Vector;)V

    .line 432
    return-object v0
.end method

.method public createMediaDescription(Ljava/lang/String;IILjava/lang/String;[Ljava/lang/String;)Landroid/javax/sdp/MediaDescription;
    .locals 5
    .param p1, "media"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "numPorts"    # I
    .param p4, "transport"    # Ljava/lang/String;
    .param p5, "formats"    # [Ljava/lang/String;

    .line 455
    new-instance v0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;-><init>()V

    .line 458
    .local v0, "mediaDescriptionImpl":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sdp/fields/MediaField;

    invoke-direct {v1}, Landroid/gov/nist/javax/sdp/fields/MediaField;-><init>()V

    .line 459
    .local v1, "mediaImpl":Landroid/gov/nist/javax/sdp/fields/MediaField;
    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMediaType(Ljava/lang/String;)V

    .line 460
    invoke-virtual {v1, p2}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMediaPort(I)V

    .line 461
    invoke-virtual {v1, p3}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setPortCount(I)V

    .line 462
    invoke-virtual {v1, p4}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setProtocol(Ljava/lang/String;)V

    .line 464
    new-instance v2, Ljava/util/Vector;

    array-length v3, p5

    invoke-direct {v2, v3}, Ljava/util/Vector;-><init>(I)V

    .line 465
    .local v2, "formatsV":Ljava/util/Vector;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, p5

    if-ge v3, v4, :cond_0

    .line 466
    aget-object v4, p5, v3

    invoke-virtual {v2, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 465
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 467
    .end local v3    # "i":I
    :cond_0
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMediaFormats(Ljava/util/Vector;)V

    .line 468
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setMedia(Landroid/javax/sdp/Media;)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 471
    .end local v1    # "mediaImpl":Landroid/gov/nist/javax/sdp/fields/MediaField;
    .end local v2    # "formatsV":Ljava/util/Vector;
    goto :goto_1

    .line 469
    :catch_0
    move-exception v1

    .line 470
    .local v1, "s":Landroid/javax/sdp/SdpException;
    invoke-virtual {v1}, Landroid/javax/sdp/SdpException;->printStackTrace()V

    .line 472
    .end local v1    # "s":Landroid/javax/sdp/SdpException;
    :goto_1
    return-object v0
.end method

.method public createOrigin(Ljava/lang/String;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sdp/Origin;
    .locals 1
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "sessionId"    # J
    .param p4, "sessionVersion"    # J
    .param p6, "networkType"    # Ljava/lang/String;
    .param p7, "addrType"    # Ljava/lang/String;
    .param p8, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 385
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/OriginField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/OriginField;-><init>()V

    .line 386
    .local v0, "originImpl":Landroid/gov/nist/javax/sdp/fields/OriginField;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setUsername(Ljava/lang/String;)V

    .line 387
    invoke-virtual {v0, p8}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setAddress(Ljava/lang/String;)V

    .line 388
    invoke-virtual {v0, p2, p3}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setSessionId(J)V

    .line 389
    invoke-virtual {v0, p4, p5}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setSessionVersion(J)V

    .line 390
    invoke-virtual {v0, p7}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setAddressType(Ljava/lang/String;)V

    .line 391
    invoke-virtual {v0, p6}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setNetworkType(Ljava/lang/String;)V

    .line 392
    return-object v0
.end method

.method public createOrigin(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sdp/Origin;
    .locals 2
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 355
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/OriginField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/OriginField;-><init>()V

    .line 356
    .local v0, "originImpl":Landroid/gov/nist/javax/sdp/fields/OriginField;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setUsername(Ljava/lang/String;)V

    .line 357
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setAddress(Ljava/lang/String;)V

    .line 358
    const-string v1, "IN"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setNetworkType(Ljava/lang/String;)V

    .line 359
    const-string v1, "IP4"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setAddressType(Ljava/lang/String;)V

    .line 360
    return-object v0
.end method

.method public createPhone(Ljava/lang/String;)Landroid/javax/sdp/Phone;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 207
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/PhoneField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/PhoneField;-><init>()V

    .line 210
    .local v0, "phoneImpl":Landroid/gov/nist/javax/sdp/fields/PhoneField;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/PhoneField;->setValue(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 214
    goto :goto_0

    .line 212
    :catch_0
    move-exception v1

    .line 213
    .local v1, "s":Landroid/javax/sdp/SdpException;
    invoke-virtual {v1}, Landroid/javax/sdp/SdpException;->printStackTrace()V

    .line 215
    .end local v1    # "s":Landroid/javax/sdp/SdpException;
    :goto_0
    return-object v0
.end method

.method public createRepeatTime(II[I)Landroid/javax/sdp/RepeatTime;
    .locals 2
    .param p1, "repeatInterval"    # I
    .param p2, "activeDuration"    # I
    .param p3, "offsets"    # [I

    .line 672
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/RepeatField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/RepeatField;-><init>()V

    .line 675
    .local v0, "repeatTimeField":Landroid/gov/nist/javax/sdp/fields/RepeatField;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/RepeatField;->setRepeatInterval(I)V

    .line 676
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sdp/fields/RepeatField;->setActiveDuration(I)V

    .line 677
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sdp/fields/RepeatField;->setOffsetArray([I)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 681
    goto :goto_0

    .line 679
    :catch_0
    move-exception v1

    .line 680
    .local v1, "s":Landroid/javax/sdp/SdpException;
    invoke-virtual {v1}, Landroid/javax/sdp/SdpException;->printStackTrace()V

    .line 682
    .end local v1    # "s":Landroid/javax/sdp/SdpException;
    :goto_0
    return-object v0
.end method

.method public createSessionDescription()Landroid/javax/sdp/SessionDescription;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 66
    new-instance v0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;-><init>()V

    .line 68
    .local v0, "sessionDescriptionImpl":Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;
    new-instance v1, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

    invoke-direct {v1}, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;-><init>()V

    .line 69
    .local v1, "ProtoVersionField":Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;->setVersion(I)V

    .line 70
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setVersion(Landroid/javax/sdp/Version;)V

    .line 72
    const/4 v2, 0x0

    .line 74
    .local v2, "originImpl":Landroid/gov/nist/javax/sdp/fields/OriginField;
    :try_start_0
    const-string/jumbo v3, "user"

    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Landroid/javax/sdp/SdpFactory;->createOrigin(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sdp/Origin;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/OriginField;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v3

    .line 78
    goto :goto_0

    .line 76
    :catch_0
    move-exception v3

    .line 77
    .local v3, "e":Ljava/net/UnknownHostException;
    invoke-virtual {v3}, Ljava/net/UnknownHostException;->printStackTrace()V

    .line 79
    .end local v3    # "e":Ljava/net/UnknownHostException;
    :goto_0
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setOrigin(Landroid/javax/sdp/Origin;)V

    .line 81
    new-instance v3, Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    invoke-direct {v3}, Landroid/gov/nist/javax/sdp/fields/SessionNameField;-><init>()V

    .line 82
    .local v3, "sessionNameImpl":Landroid/gov/nist/javax/sdp/fields/SessionNameField;
    const-string v4, "-"

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sdp/fields/SessionNameField;->setValue(Ljava/lang/String;)V

    .line 83
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setSessionName(Landroid/javax/sdp/SessionName;)V

    .line 85
    new-instance v4, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

    invoke-direct {v4}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;-><init>()V

    .line 86
    .local v4, "timeDescriptionImpl":Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;
    new-instance v5, Landroid/gov/nist/javax/sdp/fields/TimeField;

    invoke-direct {v5}, Landroid/gov/nist/javax/sdp/fields/TimeField;-><init>()V

    .line 87
    .local v5, "timeImpl":Landroid/gov/nist/javax/sdp/fields/TimeField;
    invoke-virtual {v5}, Landroid/gov/nist/javax/sdp/fields/TimeField;->setZero()V

    .line 88
    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->setTime(Landroid/javax/sdp/Time;)V

    .line 89
    new-instance v6, Ljava/util/Vector;

    invoke-direct {v6}, Ljava/util/Vector;-><init>()V

    .line 90
    .local v6, "times":Ljava/util/Vector;
    invoke-virtual {v6, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 91
    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setTimeDescriptions(Ljava/util/Vector;)V

    .line 93
    return-object v0
.end method

.method public createSessionDescription(Landroid/javax/sdp/SessionDescription;)Landroid/javax/sdp/SessionDescription;
    .locals 1
    .param p1, "otherSessionDescription"    # Landroid/javax/sdp/SessionDescription;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 109
    new-instance v0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;-><init>(Landroid/javax/sdp/SessionDescription;)V

    return-object v0
.end method

.method public createSessionDescription(Ljava/lang/String;)Landroid/javax/sdp/SessionDescription;
    .locals 4
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 128
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/SDPAnnounceParser;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sdp/parser/SDPAnnounceParser;-><init>(Ljava/lang/String;)V

    .line 129
    .local v0, "sdpParser":Landroid/gov/nist/javax/sdp/parser/SDPAnnounceParser;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/parser/SDPAnnounceParser;->parse()Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;

    move-result-object v1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 130
    .end local v0    # "sdpParser":Landroid/gov/nist/javax/sdp/parser/SDPAnnounceParser;
    :catch_0
    move-exception v0

    .line 131
    .local v0, "e":Ljava/text/ParseException;
    invoke-virtual {v0}, Ljava/text/ParseException;->printStackTrace()V

    .line 132
    new-instance v1, Landroid/javax/sdp/SdpParseException;

    const-string v2, "Could not parse message"

    const/4 v3, 0x0

    invoke-direct {v1, v3, v3, v2}, Landroid/javax/sdp/SdpParseException;-><init>(IILjava/lang/String;)V

    throw v1
.end method

.method public createSessionName(Ljava/lang/String;)Landroid/javax/sdp/SessionName;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 261
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/SessionNameField;-><init>()V

    .line 264
    .local v0, "sessionNameImpl":Landroid/gov/nist/javax/sdp/fields/SessionNameField;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/SessionNameField;->setValue(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 268
    goto :goto_0

    .line 266
    :catch_0
    move-exception v1

    .line 267
    .local v1, "s":Landroid/javax/sdp/SdpException;
    invoke-virtual {v1}, Landroid/javax/sdp/SdpException;->printStackTrace()V

    .line 269
    .end local v1    # "s":Landroid/javax/sdp/SdpException;
    :goto_0
    return-object v0
.end method

.method public createTime()Landroid/javax/sdp/Time;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 652
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/TimeField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/TimeField;-><init>()V

    .line 653
    .local v0, "timeImpl":Landroid/gov/nist/javax/sdp/fields/TimeField;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/TimeField;->setZero()V

    .line 654
    return-object v0
.end method

.method public createTime(Ljava/util/Date;Ljava/util/Date;)Landroid/javax/sdp/Time;
    .locals 1
    .param p1, "start"    # Ljava/util/Date;
    .param p2, "stop"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 639
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/TimeField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/TimeField;-><init>()V

    .line 640
    .local v0, "timeImpl":Landroid/gov/nist/javax/sdp/fields/TimeField;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/TimeField;->setStart(Ljava/util/Date;)V

    .line 641
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sdp/fields/TimeField;->setStop(Ljava/util/Date;)V

    .line 642
    return-object v0
.end method

.method public createTimeDescription()Landroid/javax/sdp/TimeDescription;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 497
    new-instance v0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;-><init>()V

    .line 498
    .local v0, "timeDescriptionImpl":Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;
    new-instance v1, Landroid/gov/nist/javax/sdp/fields/TimeField;

    invoke-direct {v1}, Landroid/gov/nist/javax/sdp/fields/TimeField;-><init>()V

    .line 499
    .local v1, "timeImpl":Landroid/gov/nist/javax/sdp/fields/TimeField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/TimeField;->setZero()V

    .line 500
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->setTime(Landroid/javax/sdp/Time;)V

    .line 501
    return-object v0
.end method

.method public createTimeDescription(Landroid/javax/sdp/Time;)Landroid/javax/sdp/TimeDescription;
    .locals 1
    .param p1, "t"    # Landroid/javax/sdp/Time;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 485
    new-instance v0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;-><init>()V

    .line 486
    .local v0, "timeDescriptionImpl":Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->setTime(Landroid/javax/sdp/Time;)V

    .line 487
    return-object v0
.end method

.method public createTimeDescription(Ljava/util/Date;Ljava/util/Date;)Landroid/javax/sdp/TimeDescription;
    .locals 2
    .param p1, "start"    # Ljava/util/Date;
    .param p2, "stop"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 517
    new-instance v0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;-><init>()V

    .line 518
    .local v0, "timeDescriptionImpl":Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;
    new-instance v1, Landroid/gov/nist/javax/sdp/fields/TimeField;

    invoke-direct {v1}, Landroid/gov/nist/javax/sdp/fields/TimeField;-><init>()V

    .line 519
    .local v1, "timeImpl":Landroid/gov/nist/javax/sdp/fields/TimeField;
    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sdp/fields/TimeField;->setStart(Ljava/util/Date;)V

    .line 520
    invoke-virtual {v1, p2}, Landroid/gov/nist/javax/sdp/fields/TimeField;->setStop(Ljava/util/Date;)V

    .line 521
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->setTime(Landroid/javax/sdp/Time;)V

    .line 522
    return-object v0
.end method

.method public createTimeZoneAdjustment(Ljava/util/Date;I)Landroid/javax/sdp/TimeZoneAdjustment;
    .locals 3
    .param p1, "d"    # Ljava/util/Date;
    .param p2, "offset"    # I

    .line 697
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/ZoneField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/ZoneField;-><init>()V

    .line 700
    .local v0, "timeZoneAdjustmentImpl":Landroid/gov/nist/javax/sdp/fields/ZoneField;
    :try_start_0
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    .line 701
    .local v1, "map":Ljava/util/Hashtable;
    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, p2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1, p1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/ZoneField;->setZoneAdjustments(Ljava/util/Hashtable;)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 705
    .end local v1    # "map":Ljava/util/Hashtable;
    goto :goto_0

    .line 703
    :catch_0
    move-exception v1

    .line 704
    .local v1, "s":Landroid/javax/sdp/SdpException;
    invoke-virtual {v1}, Landroid/javax/sdp/SdpException;->printStackTrace()V

    .line 706
    .end local v1    # "s":Landroid/javax/sdp/SdpException;
    :goto_0
    return-object v0
.end method

.method public createURI(Ljava/net/URL;)Landroid/javax/sdp/URI;
    .locals 1
    .param p1, "value"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 247
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/URIField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/URIField;-><init>()V

    .line 248
    .local v0, "uriImpl":Landroid/gov/nist/javax/sdp/fields/URIField;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/URIField;->set(Ljava/net/URL;)V

    .line 249
    return-object v0
.end method

.method public createVersion(I)Landroid/javax/sdp/Version;
    .locals 3
    .param p1, "value"    # I

    .line 303
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;-><init>()V

    .line 306
    .local v0, "protoVersionField":Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;->setVersion(I)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 311
    nop

    .line 312
    return-object v0

    .line 308
    :catch_0
    move-exception v1

    .line 309
    .local v1, "s":Landroid/javax/sdp/SdpException;
    invoke-virtual {v1}, Landroid/javax/sdp/SdpException;->printStackTrace()V

    .line 310
    const/4 v2, 0x0

    return-object v2
.end method

.method public formatMulticastAddress(Ljava/lang/String;II)Ljava/lang/String;
    .locals 2
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "ttl"    # I
    .param p3, "numAddrs"    # I

    .line 533
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 534
    .local v0, "res":Ljava/lang/String;
    return-object v0
.end method
