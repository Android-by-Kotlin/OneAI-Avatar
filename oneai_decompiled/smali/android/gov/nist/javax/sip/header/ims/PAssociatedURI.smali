.class public Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;
.super Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
.source "PAssociatedURI.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/ims/PAssociatedURIHeader;
.implements Landroid/gov/nist/javax/sip/header/ims/SIPHeaderNamesIms;
.implements Landroid/javax/sip/header/ExtensionHeader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 76
    const-string/jumbo v0, "P-Associated-URI"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/address/AddressImpl;)V
    .locals 1
    .param p1, "address"    # Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 85
    const-string/jumbo v0, "P-Associated-URI"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 86
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 87
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/address/GenericURI;)V
    .locals 1
    .param p1, "associatedURI"    # Landroid/gov/nist/javax/sip/address/GenericURI;

    .line 95
    const-string/jumbo v0, "P-Associated-URI"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 96
    new-instance v0, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 97
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setURI(Landroid/javax/sip/address/URI;)V

    .line 98
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 149
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;

    .line 150
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    if-eqz v1, :cond_0

    .line 151
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/address/AddressImpl;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 152
    :cond_0
    return-object v0
.end method

.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 109
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 110
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 113
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 114
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 119
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 120
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 122
    :cond_2
    return-object p1
.end method

.method public getAssociatedURI()Landroid/javax/sip/address/URI;
    .locals 1

    .line 144
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v0

    return-object v0
.end method

.method public setAssociatedURI(Landroid/javax/sip/address/URI;)V
    .locals 2
    .param p1, "associatedURI"    # Landroid/javax/sip/address/URI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .line 133
    if-eqz p1, :cond_0

    .line 136
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setURI(Landroid/javax/sip/address/URI;)V

    .line 137
    return-void

    .line 134
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null URI"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 158
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
