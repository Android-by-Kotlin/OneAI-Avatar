.class public abstract Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "AddressParametersHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;


# instance fields
.field protected address:Landroid/gov/nist/javax/sip/address/AddressImpl;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 67
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sync"    # Z

    .line 78
    invoke-direct {p0, p1, p2}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;Z)V

    .line 79
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 85
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;

    .line 86
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    if-eqz v1, :cond_0

    .line 87
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/address/AddressImpl;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 88
    :cond_0
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "other"    # Ljava/lang/Object;

    .line 95
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 99
    :cond_0
    instance-of v1, p1, Landroid/javax/sip/header/HeaderAddress;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    instance-of v1, p1, Landroid/javax/sip/header/Parameters;

    if-eqz v1, :cond_2

    .line 100
    move-object v1, p1

    check-cast v1, Landroid/javax/sip/header/HeaderAddress;

    .line 101
    .local v1, "o":Landroid/javax/sip/header/HeaderAddress;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v3

    invoke-interface {v1}, Landroid/javax/sip/header/HeaderAddress;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/javax/sip/address/Address;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v3, v1

    check-cast v3, Landroid/javax/sip/header/Parameters;

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->equalParameters(Landroid/javax/sip/header/Parameters;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    return v0

    .line 103
    .end local v1    # "o":Landroid/javax/sip/header/HeaderAddress;
    :cond_2
    return v2
.end method

.method public getAddress()Landroid/javax/sip/address/Address;
    .locals 1

    .line 53
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    return-object v0
.end method

.method public setAddress(Landroid/javax/sip/address/Address;)V
    .locals 1
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 60
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/address/AddressImpl;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 61
    return-void
.end method
