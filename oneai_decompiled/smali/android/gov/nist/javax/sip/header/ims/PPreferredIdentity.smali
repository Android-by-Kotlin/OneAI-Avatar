.class public Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;
.super Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
.source "PPreferredIdentity.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentityHeader;
.implements Landroid/gov/nist/javax/sip/header/ims/SIPHeaderNamesIms;
.implements Landroid/javax/sip/header/ExtensionHeader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 68
    const-string/jumbo v0, "P-Preferred-Identity"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/address/AddressImpl;)V
    .locals 1
    .param p1, "address"    # Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 60
    const-string/jumbo v0, "P-Preferred-Identity"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 61
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 62
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 77
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 80
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 81
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    :cond_1
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
