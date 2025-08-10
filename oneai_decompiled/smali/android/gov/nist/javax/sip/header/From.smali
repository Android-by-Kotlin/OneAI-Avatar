.class public final Landroid/gov/nist/javax/sip/header/From;
.super Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
.source "From.java"

# interfaces
.implements Landroid/javax/sip/header/FromHeader;


# static fields
.field private static final serialVersionUID:J = -0x579b4ff92e364db4L


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 60
    const-string v0, "From"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/header/To;)V
    .locals 1
    .param p1, "to"    # Landroid/gov/nist/javax/sip/header/To;

    .line 66
    const-string v0, "From"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 67
    iget-object v0, p1, Landroid/gov/nist/javax/sip/header/To;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 68
    iget-object v0, p1, Landroid/gov/nist/javax/sip/header/To;->parameters:Landroid/gov/nist/core/NameValueList;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->parameters:Landroid/gov/nist/core/NameValueList;

    .line 69
    return-void
.end method


# virtual methods
.method protected encodeBody()Ljava/lang/String;
    .locals 1

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/From;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 81
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 82
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 85
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 86
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 89
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 92
    :cond_2
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .line 161
    instance-of v0, p1, Landroid/javax/sip/header/FromHeader;

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

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .line 110
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHostPort()Landroid/gov/nist/core/HostPort;
    .locals 1

    .line 102
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getHostPort()Landroid/gov/nist/core/HostPort;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .line 118
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->parameters:Landroid/gov/nist/core/NameValueList;

    if-nez v0, :cond_0

    .line 119
    const/4 v0, 0x0

    return-object v0

    .line 120
    :cond_0
    const-string/jumbo v0, "tag"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/From;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserAtHostPort()Ljava/lang/String;
    .locals 1

    .line 157
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getUserAtHostPort()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasTag()Z
    .locals 1

    .line 127
    const-string/jumbo v0, "tag"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/From;->hasParameter(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public removeTag()V
    .locals 2

    .line 133
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "tag"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 134
    return-void
.end method

.method public setAddress(Landroid/javax/sip/address/Address;)V
    .locals 1
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 141
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/address/AddressImpl;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/From;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 142
    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 150
    invoke-static {p1}, Landroid/gov/nist/javax/sip/parser/Parser;->checkToken(Ljava/lang/String;)V

    .line 151
    const-string/jumbo v0, "tag"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/From;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    return-void
.end method
