.class public Landroid/gov/nist/javax/sdp/fields/ConnectionField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "ConnectionField.java"

# interfaces
.implements Landroid/javax/sdp/Connection;


# instance fields
.field protected address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

.field protected addrtype:Ljava/lang/String;

.field protected nettype:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 49
    const-string/jumbo v0, "c="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 50
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 174
    invoke-super {p0}, Landroid/gov/nist/javax/sdp/fields/SDPField;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    .line 175
    .local v0, "retval":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    if-eqz v1, :cond_0

    .line 176
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    .line 177
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 4

    .line 83
    const-string/jumbo v0, "c="

    .line 84
    .local v0, "encoded_string":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->nettype:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->nettype:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 86
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->addrtype:Ljava/lang/String;

    const-string v2, " "

    if-eqz v1, :cond_1

    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->addrtype:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 88
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    if-eqz v1, :cond_2

    .line 89
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->encode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 90
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v0, v1

    return-object v1
.end method

.method public getAddress()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 101
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->getConnectionAddress()Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    move-result-object v0

    .line 102
    .local v0, "connectionAddress":Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 103
    return-object v1

    .line 105
    :cond_0
    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->getAddress()Landroid/gov/nist/core/Host;

    move-result-object v2

    .line 106
    .local v2, "host":Landroid/gov/nist/core/Host;
    if-nez v2, :cond_1

    .line 107
    return-object v1

    .line 109
    :cond_1
    invoke-virtual {v2}, Landroid/gov/nist/core/Host;->getAddress()Ljava/lang/String;

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

    .line 118
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->getAddrtype()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAddrtype()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->addrtype:Ljava/lang/String;

    return-object v0
.end method

.method public getConnectionAddress()Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;
    .locals 1

    .line 58
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    return-object v0
.end method

.method public getNettype()Ljava/lang/String;
    .locals 1

    .line 52
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->nettype:Ljava/lang/String;

    return-object v0
.end method

.method public getNetworkType()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 126
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->getNettype()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAddrType(Ljava/lang/String;)V
    .locals 0
    .param p1, "a"    # Ljava/lang/String;

    .line 70
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->addrtype:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public setAddress(Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;)V
    .locals 0
    .param p1, "a"    # Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    .line 76
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    .line 77
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

    .line 134
    if-eqz p1, :cond_2

    .line 137
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    if-nez v0, :cond_0

    .line 138
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    .line 139
    new-instance v0, Landroid/gov/nist/core/Host;

    invoke-direct {v0, p1}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    .line 140
    .local v0, "host":Landroid/gov/nist/core/Host;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->setAddress(Landroid/gov/nist/core/Host;)V

    .line 141
    .end local v0    # "host":Landroid/gov/nist/core/Host;
    goto :goto_0

    .line 142
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->getAddress()Landroid/gov/nist/core/Host;

    move-result-object v0

    .line 143
    .restart local v0    # "host":Landroid/gov/nist/core/Host;
    if-nez v0, :cond_1

    .line 144
    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-direct {v1, p1}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    move-object v0, v1

    .line 145
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->setAddress(Landroid/gov/nist/core/Host;)V

    goto :goto_0

    .line 147
    :cond_1
    invoke-virtual {v0, p1}, Landroid/gov/nist/core/Host;->setAddress(Ljava/lang/String;)V

    .line 149
    .end local v0    # "host":Landroid/gov/nist/core/Host;
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->address:Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setAddress(Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;)V

    .line 151
    return-void

    .line 135
    :cond_2
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "the addr is null"

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

    .line 158
    if-eqz p1, :cond_0

    .line 160
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->addrtype:Ljava/lang/String;

    .line 161
    return-void

    .line 159
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "the type is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setNettype(Ljava/lang/String;)V
    .locals 0
    .param p1, "n"    # Ljava/lang/String;

    .line 64
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->nettype:Ljava/lang/String;

    .line 65
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

    .line 168
    if-eqz p1, :cond_0

    .line 171
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setNettype(Ljava/lang/String;)V

    .line 172
    return-void

    .line 169
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "the type is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 94
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
