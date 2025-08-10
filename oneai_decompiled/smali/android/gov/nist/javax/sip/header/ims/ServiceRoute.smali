.class public Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;
.super Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
.source "ServiceRoute.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/ims/ServiceRouteHeader;
.implements Landroid/gov/nist/javax/sip/header/ims/SIPHeaderNamesIms;
.implements Landroid/javax/sip/header/ExtensionHeader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 64
    const-string/jumbo v0, "Service-Route"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/address/AddressImpl;)V
    .locals 1
    .param p1, "address"    # Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 56
    const-string/jumbo v0, "Service-Route"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 57
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 58
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 72
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 73
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 77
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 81
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 84
    :cond_2
    return-object p1
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 89
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
