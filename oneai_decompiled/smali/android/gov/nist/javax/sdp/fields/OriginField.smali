.class public Landroid/gov/nist/javax/sdp/fields/OriginField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "OriginField.java"

# interfaces
.implements Landroid/javax/sdp/Origin;


# instance fields
.field protected address:Landroid/gov/nist/core/Host;

.field protected addrtype:Ljava/lang/String;

.field protected nettype:Ljava/lang/String;

.field private sessIdString:Ljava/lang/String;

.field private sessVersionString:Ljava/lang/String;

.field protected username:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 57
    const-string/jumbo v0, "o="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 58
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 307
    invoke-super {p0}, Landroid/gov/nist/javax/sdp/fields/SDPField;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/OriginField;

    .line 308
    .local v0, "retval":Landroid/gov/nist/javax/sdp/fields/OriginField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->address:Landroid/gov/nist/core/Host;

    if-eqz v1, :cond_0

    .line 309
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->address:Landroid/gov/nist/core/Host;

    invoke-virtual {v1}, Landroid/gov/nist/core/Host;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/core/Host;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/OriginField;->address:Landroid/gov/nist/core/Host;

    .line 310
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 4

    .line 274
    const/4 v0, 0x0

    .line 276
    .local v0, "addressStr":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->address:Landroid/gov/nist/core/Host;

    if-eqz v1, :cond_0

    .line 277
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->address:Landroid/gov/nist/core/Host;

    invoke-virtual {v1}, Landroid/gov/nist/core/Host;->encode()Ljava/lang/String;

    move-result-object v0

    .line 282
    invoke-static {v0}, Landroid/gov/nist/core/Host;->isIPv6Reference(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 286
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 291
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "o="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->username:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->sessIdString:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->sessVersionString:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->nettype:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->addrtype:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getAddress()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 208
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/OriginField;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v0

    .line 209
    .local v0, "addr":Landroid/gov/nist/core/Host;
    if-nez v0, :cond_0

    .line 210
    const/4 v1, 0x0

    return-object v1

    .line 212
    :cond_0
    invoke-virtual {v0}, Landroid/gov/nist/core/Host;->getAddress()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getAddressType()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 220
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/OriginField;->getAddrtype()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAddrtype()Ljava/lang/String;
    .locals 1

    .line 99
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->addrtype:Ljava/lang/String;

    return-object v0
.end method

.method public getHost()Landroid/gov/nist/core/Host;
    .locals 1

    .line 105
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->address:Landroid/gov/nist/core/Host;

    return-object v0
.end method

.method public getNettype()Ljava/lang/String;
    .locals 1

    .line 93
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->nettype:Ljava/lang/String;

    return-object v0
.end method

.method public getNetworkType()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 228
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/OriginField;->getNettype()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSessId()J
    .locals 2

    .line 72
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->sessIdString:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSessIdAsString()Ljava/lang/String;
    .locals 1

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->sessIdString:Ljava/lang/String;

    return-object v0
.end method

.method public getSessVersion()J
    .locals 2

    .line 83
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->sessVersionString:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSessVersionAsString()Ljava/lang/String;
    .locals 1

    .line 87
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->sessVersionString:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionId()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 170
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/OriginField;->getSessId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSessionVersion()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 189
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/OriginField;->getSessVersion()J

    move-result-wide v0

    return-wide v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 65
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->username:Ljava/lang/String;

    return-object v0
.end method

.method public setAddress(Landroid/gov/nist/core/Host;)V
    .locals 0
    .param p1, "a"    # Landroid/gov/nist/core/Host;

    .line 150
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->address:Landroid/gov/nist/core/Host;

    .line 151
    return-void
.end method

.method public setAddress(Ljava/lang/String;)V
    .locals 2
    .param p1, "addr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 236
    if-eqz p1, :cond_1

    .line 239
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/OriginField;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v0

    .line 240
    .local v0, "host":Landroid/gov/nist/core/Host;
    if-nez v0, :cond_0

    .line 241
    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-direct {v1}, Landroid/gov/nist/core/Host;-><init>()V

    move-object v0, v1

    .line 242
    :cond_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/core/Host;->setAddress(Ljava/lang/String;)V

    .line 243
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setAddress(Landroid/gov/nist/core/Host;)V

    .line 245
    .end local v0    # "host":Landroid/gov/nist/core/Host;
    return-void

    .line 237
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The addr parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAddressType(Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 252
    if-eqz p1, :cond_0

    .line 255
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setAddrtype(Ljava/lang/String;)V

    .line 256
    return-void

    .line 253
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The type parameter is <0"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAddrtype(Ljava/lang/String;)V
    .locals 0
    .param p1, "a"    # Ljava/lang/String;

    .line 144
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->addrtype:Ljava/lang/String;

    .line 145
    return-void
.end method

.method public setNettype(Ljava/lang/String;)V
    .locals 0
    .param p1, "n"    # Ljava/lang/String;

    .line 138
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->nettype:Ljava/lang/String;

    .line 139
    return-void
.end method

.method public setNetworkType(Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 263
    if-eqz p1, :cond_0

    .line 266
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setNettype(Ljava/lang/String;)V

    .line 267
    return-void

    .line 264
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The type parameter is <0"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSessId(J)V
    .locals 1
    .param p1, "s"    # J

    .line 111
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->sessIdString:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public setSessVersion(J)V
    .locals 1
    .param p1, "s"    # J

    .line 125
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->sessVersionString:Ljava/lang/String;

    .line 126
    return-void
.end method

.method public setSessVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .line 132
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->sessVersionString:Ljava/lang/String;

    .line 133
    return-void
.end method

.method public setSessionId(J)V
    .locals 2
    .param p1, "id"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 178
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 181
    invoke-virtual {p0, p1, p2}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setSessId(J)V

    .line 182
    return-void

    .line 179
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The is parameter is <0"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSessionId(Ljava/lang/String;)V
    .locals 0
    .param p1, "sessId"    # Ljava/lang/String;

    .line 119
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->sessIdString:Ljava/lang/String;

    .line 120
    return-void
.end method

.method public setSessionVersion(J)V
    .locals 2
    .param p1, "version"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 197
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 200
    invoke-virtual {p0, p1, p2}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setSessVersion(J)V

    .line 201
    return-void

    .line 198
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The version parameter is <0"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 2
    .param p1, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 158
    if-eqz p1, :cond_0

    .line 161
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/OriginField;->username:Ljava/lang/String;

    .line 163
    return-void

    .line 159
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The user parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
