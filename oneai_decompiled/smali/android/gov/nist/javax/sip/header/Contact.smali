.class public final Landroid/gov/nist/javax/sip/header/Contact;
.super Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
.source "Contact.java"

# interfaces
.implements Landroid/javax/sip/header/ContactHeader;


# static fields
.field public static final ACTION:Ljava/lang/String; = "action"

.field public static final EXPIRES:Ljava/lang/String; = "expires"

.field public static final PROXY:Ljava/lang/String; = "proxy"

.field public static final Q:Ljava/lang/String; = "q"

.field public static final REDIRECT:Ljava/lang/String; = "redirect"

.field private static final serialVersionUID:J = 0x1746f2cc9301c8b0L


# instance fields
.field private contactList:Landroid/gov/nist/javax/sip/header/ContactList;

.field protected wildCardFlag:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 78
    const-string v0, "Contact"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 79
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 221
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Contact;

    .line 222
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/Contact;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Contact;->contactList:Landroid/gov/nist/javax/sip/header/ContactList;

    if-eqz v1, :cond_0

    .line 223
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Contact;->contactList:Landroid/gov/nist/javax/sip/header/ContactList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/ContactList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/ContactList;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/Contact;->contactList:Landroid/gov/nist/javax/sip/header/ContactList;

    .line 224
    :cond_0
    return-object v0
.end method

.method protected encodeBody()Ljava/lang/String;
    .locals 1

    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Contact;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 104
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->wildCardFlag:Z

    if-eqz v0, :cond_0

    .line 105
    const/16 v0, 0x2a

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 109
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 110
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 113
    :cond_1
    const/16 v0, 0x3c

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 114
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 115
    const/16 v0, 0x3e

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 117
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 118
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 123
    :cond_2
    :goto_1
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .line 244
    instance-of v0, p1, Landroid/javax/sip/header/ContactHeader;

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

.method public getAddress()Landroid/javax/sip/address/Address;
    .locals 1

    .line 145
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    return-object v0
.end method

.method public getContactList()Landroid/gov/nist/javax/sip/header/ContactList;
    .locals 1

    .line 130
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->contactList:Landroid/gov/nist/javax/sip/header/ContactList;

    return-object v0
.end method

.method public getContactParms()Landroid/gov/nist/core/NameValueList;
    .locals 1

    .line 152
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    return-object v0
.end method

.method public getExpires()I
    .locals 1

    .line 159
    const-string/jumbo v0, "expires"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Contact;->getParameterAsInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getPubGruuParam()Ljava/lang/String;
    .locals 2

    .line 269
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "pub-gruu"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getQValue()F
    .locals 1

    .line 175
    const-string/jumbo v0, "q"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Contact;->getParameterAsFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public getSipInstanceParam()Ljava/lang/String;
    .locals 2

    .line 253
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string v1, "+sip.instance"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getTempGruuParam()Ljava/lang/String;
    .locals 2

    .line 286
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "temp-gruu"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getWildCardFlag()Z
    .locals 1

    .line 137
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->wildCardFlag:Z

    return v0
.end method

.method public isWildCard()Z
    .locals 1

    .line 240
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->isWildcard()Z

    move-result v0

    return v0
.end method

.method public removePubGruuParam()V
    .locals 2

    .line 264
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "pub-gruu"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 266
    :cond_0
    return-void
.end method

.method public removeSipInstanceParam()V
    .locals 2

    .line 248
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    .line 249
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string v1, "+sip.instance"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 250
    :cond_0
    return-void
.end method

.method public removeTempGruuParam()V
    .locals 2

    .line 281
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "temp-gruu"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 283
    :cond_0
    return-void
.end method

.method public setAddress(Landroid/javax/sip/address/Address;)V
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 202
    if-eqz p1, :cond_0

    .line 204
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/address/AddressImpl;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 205
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->wildCardFlag:Z

    .line 206
    return-void

    .line 203
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContactList(Landroid/gov/nist/javax/sip/header/ContactList;)V
    .locals 0
    .param p1, "cl"    # Landroid/gov/nist/javax/sip/header/ContactList;

    .line 182
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Contact;->contactList:Landroid/gov/nist/javax/sip/header/ContactList;

    .line 183
    return-void
.end method

.method public setExpires(I)V
    .locals 3
    .param p1, "expiryDeltaSeconds"    # I

    .line 167
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 168
    .local v0, "deltaSeconds":Ljava/lang/Integer;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v2, "expires"

    invoke-virtual {v1, v2, v0}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 169
    return-void
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 84
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 85
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {v0, p2}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 88
    :cond_0
    new-instance v1, Landroid/gov/nist/core/NameValue;

    invoke-direct {v1, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, v1

    .line 89
    const-string/jumbo v1, "methods"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 90
    invoke-virtual {v0}, Landroid/gov/nist/core/NameValue;->setQuotedValue()V

    .line 91
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 93
    :goto_0
    return-void
.end method

.method public setPubGruuParam(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 274
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "pub-gruu"

    invoke-virtual {v0, v1, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 275
    return-void
.end method

.method public setQValue(F)V
    .locals 3
    .param p1, "qValue"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 213
    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 214
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, Contact, setQValue(), the qValue is not between 0 and 1"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 217
    :cond_1
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "q"

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 218
    return-void
.end method

.method public setSipInstanceParam(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 257
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string v1, "+sip.instance"

    invoke-virtual {v0, v1, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 258
    return-void
.end method

.method public setTempGruuParam(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 291
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "temp-gruu"

    invoke-virtual {v0, v1, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 292
    return-void
.end method

.method public setWildCard()V
    .locals 1

    .line 231
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Contact;->setWildCardFlag(Z)V

    .line 233
    return-void
.end method

.method public setWildCardFlag(Z)V
    .locals 1
    .param p1, "w"    # Z

    .line 190
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->wildCardFlag:Z

    .line 191
    new-instance v0, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 192
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Contact;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setWildCardFlag()V

    .line 193
    return-void
.end method
