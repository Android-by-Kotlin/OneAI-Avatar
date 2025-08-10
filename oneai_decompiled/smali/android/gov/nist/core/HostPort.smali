.class public final Landroid/gov/nist/core/HostPort;
.super Landroid/gov/nist/core/GenericObject;
.source "HostPort.java"


# static fields
.field private static final serialVersionUID:J = -0x629463c90d3e66ebL


# instance fields
.field protected host:Landroid/gov/nist/core/Host;

.field protected port:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObject;-><init>()V

    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Landroid/gov/nist/core/HostPort;->port:I

    .line 63
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 157
    invoke-super {p0}, Landroid/gov/nist/core/GenericObject;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/HostPort;

    .line 158
    .local v0, "retval":Landroid/gov/nist/core/HostPort;
    iget-object v1, p0, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    if-eqz v1, :cond_0

    .line 159
    iget-object v1, p0, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    invoke-virtual {v1}, Landroid/gov/nist/core/Host;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/core/Host;

    iput-object v1, v0, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    .line 160
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 1

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/HostPort;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 76
    iget-object v0, p0, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/Host;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 77
    iget v0, p0, Landroid/gov/nist/core/HostPort;->port:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 78
    const-string v0, ":"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/core/HostPort;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    :cond_0
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 87
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 88
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    .line 89
    return v0

    .line 91
    :cond_1
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/core/HostPort;

    .line 92
    .local v1, "that":Landroid/gov/nist/core/HostPort;
    iget v2, p0, Landroid/gov/nist/core/HostPort;->port:I

    iget v3, v1, Landroid/gov/nist/core/HostPort;->port:I

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    iget-object v3, v1, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/Host;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method public getHost()Landroid/gov/nist/core/Host;
    .locals 1

    .line 99
    iget-object v0, p0, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    return-object v0
.end method

.method public getInetAddress()Ljava/net/InetAddress;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 144
    iget-object v0, p0, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    if-nez v0, :cond_0

    .line 145
    const/4 v0, 0x0

    return-object v0

    .line 147
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    invoke-virtual {v0}, Landroid/gov/nist/core/Host;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 106
    iget v0, p0, Landroid/gov/nist/core/HostPort;->port:I

    return v0
.end method

.method public hasPort()Z
    .locals 2

    .line 114
    iget v0, p0, Landroid/gov/nist/core/HostPort;->port:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 169
    iget-object v0, p0, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    invoke-virtual {v0}, Landroid/gov/nist/core/Host;->hashCode()I

    move-result v0

    iget v1, p0, Landroid/gov/nist/core/HostPort;->port:I

    add-int/2addr v0, v1

    return v0
.end method

.method public merge(Ljava/lang/Object;)V
    .locals 2
    .param p1, "mergeObject"    # Ljava/lang/Object;

    .line 151
    invoke-super {p0, p1}, Landroid/gov/nist/core/GenericObject;->merge(Ljava/lang/Object;)V

    .line 152
    iget v0, p0, Landroid/gov/nist/core/HostPort;->port:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 153
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/core/HostPort;

    iget v0, v0, Landroid/gov/nist/core/HostPort;->port:I

    iput v0, p0, Landroid/gov/nist/core/HostPort;->port:I

    .line 154
    :cond_0
    return-void
.end method

.method public removePort()V
    .locals 1

    .line 120
    const/4 v0, -0x1

    iput v0, p0, Landroid/gov/nist/core/HostPort;->port:I

    .line 121
    return-void
.end method

.method public setHost(Landroid/gov/nist/core/Host;)V
    .locals 0
    .param p1, "h"    # Landroid/gov/nist/core/Host;

    .line 128
    iput-object p1, p0, Landroid/gov/nist/core/HostPort;->host:Landroid/gov/nist/core/Host;

    .line 129
    return-void
.end method

.method public setPort(I)V
    .locals 0
    .param p1, "p"    # I

    .line 136
    iput p1, p0, Landroid/gov/nist/core/HostPort;->port:I

    .line 137
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 164
    invoke-virtual {p0}, Landroid/gov/nist/core/HostPort;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
