.class public final Landroid/gov/nist/javax/sip/header/ReferTo;
.super Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
.source "ReferTo.java"

# interfaces
.implements Landroid/javax/sip/header/ReferToHeader;


# static fields
.field private static final serialVersionUID:J = -0x17214f358828de23L


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 58
    const-string/jumbo v0, "Refer-To"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 59
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 66
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ReferTo;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    if-nez v0, :cond_0

    .line 67
    const/4 v0, 0x0

    return-object v0

    .line 68
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ReferTo;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 69
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ReferTo;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 72
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ReferTo;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    if-ne v0, v1, :cond_2

    .line 73
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ReferTo;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 77
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ReferTo;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 80
    :cond_3
    return-object p1
.end method
