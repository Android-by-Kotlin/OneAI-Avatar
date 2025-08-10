.class public Landroid/gov/nist/javax/sip/header/Route;
.super Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
.source "Route.java"

# interfaces
.implements Landroid/javax/sip/header/RouteHeader;


# static fields
.field private static final serialVersionUID:J = 0x4ee01f7faef81a4eL


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 56
    const-string/jumbo v0, "Route"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/address/AddressImpl;)V
    .locals 1
    .param p1, "address"    # Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 66
    const-string/jumbo v0, "Route"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 67
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Route;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 68
    return-void
.end method


# virtual methods
.method public encodeBody()Ljava/lang/String;
    .locals 1

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Route;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 91
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Route;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    move v0, v1

    .line 92
    .local v0, "addrFlag":Z
    if-nez v0, :cond_1

    .line 93
    const/16 v1, 0x3c

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Route;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 95
    const/16 v1, 0x3e

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 97
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Route;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 99
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Route;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 100
    const-string v1, ";"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Route;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 103
    :cond_2
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .line 107
    instance-of v0, p1, Landroid/javax/sip/header/RouteHeader;

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Route;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getHostPort()Landroid/gov/nist/core/HostPort;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->encode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
