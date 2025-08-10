.class public Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;
.super Landroid/gov/nist/javax/sdp/fields/SDPObject;
.source "ConnectionAddress.java"


# instance fields
.field protected address:Landroid/gov/nist/core/Host;

.field protected port:I

.field protected ttl:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;-><init>()V

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 104
    invoke-super {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    .line 105
    .local v0, "retval":Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->address:Landroid/gov/nist/core/Host;

    if-eqz v1, :cond_0

    .line 106
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->address:Landroid/gov/nist/core/Host;

    invoke-virtual {v1}, Landroid/gov/nist/core/Host;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/core/Host;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->address:Landroid/gov/nist/core/Host;

    .line 107
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 4

    .line 79
    const-string v0, ""

    .line 81
    .local v0, "encoded_string":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->address:Landroid/gov/nist/core/Host;

    if-eqz v1, :cond_0

    .line 82
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->address:Landroid/gov/nist/core/Host;

    invoke-virtual {v1}, Landroid/gov/nist/core/Host;->encode()Ljava/lang/String;

    move-result-object v0

    .line 87
    invoke-static {v0}, Landroid/gov/nist/core/Host;->isIPv6Reference(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 91
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 95
    :cond_0
    iget v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->ttl:I

    const-string v2, "/"

    if-eqz v1, :cond_1

    iget v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->port:I

    if-eqz v1, :cond_1

    .line 96
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->ttl:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 97
    :cond_1
    iget v1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->ttl:I

    if-eqz v1, :cond_2

    .line 98
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->ttl:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 100
    :cond_2
    :goto_0
    return-object v0
.end method

.method public getAddress()Landroid/gov/nist/core/Host;
    .locals 1

    .line 48
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->address:Landroid/gov/nist/core/Host;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 54
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->port:I

    return v0
.end method

.method public getTtl()I
    .locals 1

    .line 51
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->ttl:I

    return v0
.end method

.method public setAddress(Landroid/gov/nist/core/Host;)V
    .locals 0
    .param p1, "a"    # Landroid/gov/nist/core/Host;

    .line 60
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->address:Landroid/gov/nist/core/Host;

    .line 61
    return-void
.end method

.method public setPort(I)V
    .locals 0
    .param p1, "p"    # I

    .line 72
    iput p1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->port:I

    .line 73
    return-void
.end method

.method public setTtl(I)V
    .locals 0
    .param p1, "ttl"    # I

    .line 66
    iput p1, p0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->ttl:I

    .line 67
    return-void
.end method
