.class public Landroid/gov/nist/javax/sip/header/Via;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "Via.java"

# interfaces
.implements Landroid/javax/sip/header/ViaHeader;
.implements Landroid/gov/nist/javax/sip/header/ViaHeaderExt;


# static fields
.field public static final BRANCH:Ljava/lang/String; = "branch"

.field public static final MADDR:Ljava/lang/String; = "maddr"

.field public static final RECEIVED:Ljava/lang/String; = "received"

.field public static final RPORT:Ljava/lang/String; = "rport"

.field public static final TTL:Ljava/lang/String; = "ttl"

.field private static final serialVersionUID:J = 0x494c77f8c8b074d2L


# instance fields
.field protected comment:Ljava/lang/String;

.field protected sentBy:Landroid/gov/nist/core/HostPort;

.field protected sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 102
    const-string/jumbo v0, "Via"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 103
    new-instance v0, Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Protocol;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    .line 104
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 3

    .line 536
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Via;

    .line 537
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/Via;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    if-eqz v1, :cond_0

    .line 538
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Protocol;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/Protocol;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    .line 539
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    if-eqz v1, :cond_1

    .line 540
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v1}, Landroid/gov/nist/core/HostPort;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/core/HostPort;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    .line 541
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/Via;->getRPort()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 542
    const-string/jumbo v1, "rport"

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/Via;->getRPort()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/javax/sip/header/Via;->setParameter(Ljava/lang/String;I)V

    .line 543
    :cond_2
    return-object v0
.end method

.method protected encodeBody()Ljava/lang/String;
    .locals 1

    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Via;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 258
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Protocol;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 259
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v1, p1}, Landroid/gov/nist/core/HostPort;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 261
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Via;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 262
    const-string v1, ";"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Via;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 265
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Via;->comment:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 266
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Via;->comment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    :cond_1
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "other"    # Ljava/lang/Object;

    .line 108
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 110
    :cond_0
    instance-of v1, p1, Landroid/javax/sip/header/ViaHeader;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 111
    move-object v1, p1

    check-cast v1, Landroid/javax/sip/header/ViaHeader;

    .line 112
    .local v1, "o":Landroid/javax/sip/header/ViaHeader;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/Via;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Landroid/javax/sip/header/ViaHeader;->getProtocol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Landroid/javax/sip/header/ViaHeader;->getTransport()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/Via;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Landroid/javax/sip/header/ViaHeader;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v3

    invoke-interface {v1}, Landroid/javax/sip/header/ViaHeader;->getPort()I

    move-result v4

    if-ne v3, v4, :cond_1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/header/Via;->equalParameters(Landroid/javax/sip/header/Parameters;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    return v0

    .line 118
    .end local v1    # "o":Landroid/javax/sip/header/ViaHeader;
    :cond_2
    return v2
.end method

.method public getBranch()Ljava/lang/String;
    .locals 1

    .line 515
    const-string/jumbo v0, "branch"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Via;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .line 174
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public getHop()Landroid/javax/sip/address/Hop;
    .locals 4

    .line 155
    new-instance v0, Landroid/gov/nist/javax/sip/stack/HopImpl;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v1}, Landroid/gov/nist/core/HostPort;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/core/Host;->getHostname()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v2}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Protocol;->getTransport()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/HopImpl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 157
    .local v0, "hop":Landroid/gov/nist/javax/sip/stack/HopImpl;
    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 2

    .line 295
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 296
    return-object v1

    .line 298
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v0

    .line 299
    .local v0, "host":Landroid/gov/nist/core/Host;
    if-nez v0, :cond_1

    .line 300
    return-object v1

    .line 302
    :cond_1
    invoke-virtual {v0}, Landroid/gov/nist/core/Host;->getHostname()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getMAddr()Ljava/lang/String;
    .locals 1

    .line 456
    const-string/jumbo v0, "maddr"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Via;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 341
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    if-nez v0, :cond_0

    .line 342
    const/4 v0, -0x1

    return v0

    .line 343
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v0

    return v0
.end method

.method public getProtocol()Ljava/lang/String;
    .locals 1

    .line 398
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    if-nez v0, :cond_0

    .line 399
    const/4 v0, 0x0

    return-object v0

    .line 400
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Protocol;->getProtocol()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProtocolVersion()Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    if-nez v0, :cond_0

    .line 127
    const/4 v0, 0x0

    return-object v0

    .line 129
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Protocol;->getProtocolVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRPort()I
    .locals 2

    .line 353
    const-string/jumbo v0, "rport"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Via;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 354
    .local v0, "strRport":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 355
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1

    .line 357
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public getReceived()Ljava/lang/String;
    .locals 1

    .line 488
    const-string/jumbo v0, "received"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Via;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSentBy()Landroid/gov/nist/core/HostPort;
    .locals 1

    .line 146
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    return-object v0
.end method

.method public getSentByField()Ljava/lang/String;
    .locals 1

    .line 551
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    if-eqz v0, :cond_0

    .line 552
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 553
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSentProtocol()Landroid/gov/nist/javax/sip/header/Protocol;
    .locals 1

    .line 138
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    return-object v0
.end method

.method public getSentProtocolField()Ljava/lang/String;
    .locals 1

    .line 560
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    if-eqz v0, :cond_0

    .line 561
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Protocol;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 562
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTTL()I
    .locals 1

    .line 429
    const-string/jumbo v0, "ttl"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Via;->getParameterAsInt(Ljava/lang/String;)I

    move-result v0

    .line 430
    .local v0, "ttl":I
    return v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 367
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    if-nez v0, :cond_0

    .line 368
    const/4 v0, 0x0

    return-object v0

    .line 369
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Protocol;->getTransport()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViaParms()Landroid/gov/nist/core/NameValueList;
    .locals 1

    .line 165
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->parameters:Landroid/gov/nist/core/NameValueList;

    return-object v0
.end method

.method public hasComment()Z
    .locals 1

    .line 191
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->comment:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasPort()Z
    .locals 1

    .line 183
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/Via;->getSentBy()Landroid/gov/nist/core/HostPort;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->hasPort()Z

    move-result v0

    return v0
.end method

.method public removeComment()V
    .locals 1

    .line 203
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->comment:Ljava/lang/String;

    .line 204
    return-void
.end method

.method public removePort()V
    .locals 1

    .line 197
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->removePort()V

    .line 198
    return-void
.end method

.method public setBranch(Ljava/lang/String;)V
    .locals 2
    .param p1, "branch"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 527
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 532
    const-string/jumbo v0, "branch"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/Via;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    return-void

    .line 528
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, Via, setBranch(), the branch parameter is null or length 0."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "c"    # Ljava/lang/String;

    .line 247
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Via;->comment:Ljava/lang/String;

    .line 248
    return-void
.end method

.method public setHost(Landroid/gov/nist/core/Host;)V
    .locals 1
    .param p1, "host"    # Landroid/gov/nist/core/Host;

    .line 219
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    if-nez v0, :cond_0

    .line 220
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    .line 222
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 223
    return-void
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 3
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 279
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    if-nez v0, :cond_0

    .line 280
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    .line 282
    :cond_0
    :try_start_0
    new-instance v0, Landroid/gov/nist/core/Host;

    invoke-direct {v0, p1}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    .line 283
    .local v0, "h":Landroid/gov/nist/core/Host;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    .end local v0    # "h":Landroid/gov/nist/core/Host;
    nop

    .line 287
    return-void

    .line 284
    :catch_0
    move-exception v0

    .line 285
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, " host parameter is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setMAddr(Ljava/lang/String;)V
    .locals 3
    .param p1, "mAddr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 469
    if-eqz p1, :cond_0

    .line 474
    new-instance v0, Landroid/gov/nist/core/Host;

    invoke-direct {v0}, Landroid/gov/nist/core/Host;-><init>()V

    .line 475
    .local v0, "host":Landroid/gov/nist/core/Host;
    invoke-virtual {v0, p1}, Landroid/gov/nist/core/Host;->setAddress(Ljava/lang/String;)V

    .line 476
    new-instance v1, Landroid/gov/nist/core/NameValue;

    const-string/jumbo v2, "maddr"

    invoke-direct {v1, v2, v0}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 477
    .local v1, "nameValue":Landroid/gov/nist/core/NameValue;
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/header/Via;->setParameter(Landroid/gov/nist/core/NameValue;)V

    .line 479
    return-void

    .line 470
    .end local v0    # "host":Landroid/gov/nist/core/Host;
    .end local v1    # "nameValue":Landroid/gov/nist/core/NameValue;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, Via, setMAddr(), the mAddr parameter is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPort(I)V
    .locals 2
    .param p1, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 314
    const/4 v0, -0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    const v0, 0xffff

    if-gt p1, v0, :cond_0

    goto :goto_0

    .line 315
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "Port value out of range -1, [1..65535]"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 318
    :cond_1
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    if-nez v0, :cond_2

    .line 319
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    .line 320
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/HostPort;->setPort(I)V

    .line 321
    return-void
.end method

.method public setProtocol(Ljava/lang/String;)V
    .locals 2
    .param p1, "protocol"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 412
    if-eqz p1, :cond_1

    .line 417
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    if-nez v0, :cond_0

    .line 418
    new-instance v0, Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Protocol;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    .line 420
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Protocol;->setProtocol(Ljava/lang/String;)V

    .line 421
    return-void

    .line 413
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, Via, setProtocol(), the protocol parameter is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setProtocolVersion(Ljava/lang/String;)V
    .locals 1
    .param p1, "protocolVersion"    # Ljava/lang/String;

    .line 210
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    if-nez v0, :cond_0

    .line 211
    new-instance v0, Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Protocol;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    .line 212
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Protocol;->setProtocolVersion(Ljava/lang/String;)V

    .line 213
    return-void
.end method

.method public setRPort()V
    .locals 2

    .line 329
    :try_start_0
    const-string/jumbo v0, "rport"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/Via;->setParameter(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 332
    goto :goto_0

    .line 330
    :catch_0
    move-exception v0

    .line 331
    .local v0, "e":Ljava/text/ParseException;
    invoke-virtual {v0}, Ljava/text/ParseException;->printStackTrace()V

    .line 333
    .end local v0    # "e":Ljava/text/ParseException;
    :goto_0
    return-void
.end method

.method public setReceived(Ljava/lang/String;)V
    .locals 2
    .param p1, "received"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 499
    if-eqz p1, :cond_0

    .line 504
    const-string/jumbo v0, "received"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/Via;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 506
    return-void

    .line 500
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, Via, setReceived(), the received parameter is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSentBy(Landroid/gov/nist/core/HostPort;)V
    .locals 0
    .param p1, "s"    # Landroid/gov/nist/core/HostPort;

    .line 238
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Via;->sentBy:Landroid/gov/nist/core/HostPort;

    .line 239
    return-void
.end method

.method public setSentProtocol(Landroid/gov/nist/javax/sip/header/Protocol;)V
    .locals 0
    .param p1, "s"    # Landroid/gov/nist/javax/sip/header/Protocol;

    .line 230
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    .line 231
    return-void
.end method

.method public setTTL(I)V
    .locals 3
    .param p1, "ttl"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 442
    if-gez p1, :cond_1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 443
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, Via, setTTL(), the ttl parameter is < 0"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 446
    :cond_1
    :goto_0
    new-instance v0, Landroid/gov/nist/core/NameValue;

    const-string/jumbo v1, "ttl"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Via;->setParameter(Landroid/gov/nist/core/NameValue;)V

    .line 447
    return-void
.end method

.method public setTransport(Ljava/lang/String;)V
    .locals 2
    .param p1, "transport"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 383
    if-eqz p1, :cond_1

    .line 387
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    if-nez v0, :cond_0

    .line 388
    new-instance v0, Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Protocol;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    .line 389
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Via;->sentProtocol:Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Protocol;->setTransport(Ljava/lang/String;)V

    .line 390
    return-void

    .line 384
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, Via, setTransport(), the transport parameter is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
