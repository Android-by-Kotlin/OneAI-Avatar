.class public Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "PChargingFunctionAddresses.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddressesHeader;
.implements Landroid/gov/nist/javax/sip/header/ims/SIPHeaderNamesIms;
.implements Landroid/javax/sip/header/ExtensionHeader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 83
    const-string/jumbo v0, "P-Charging-Function-Addresses"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 84
    return-void
.end method


# virtual methods
.method public addChargingCollectionFunctionAddress(Ljava/lang/String;)V
    .locals 2
    .param p1, "ccfAddress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 129
    if-eqz p1, :cond_0

    .line 134
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "ccf"

    invoke-virtual {v0, v1, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 136
    return-void

    .line 130
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, P-Charging-Function-Addresses, setChargingCollectionFunctionAddress(), the ccfAddress parameter is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addEventChargingFunctionAddress(Ljava/lang/String;)V
    .locals 2
    .param p1, "ecfAddress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 212
    if-eqz p1, :cond_0

    .line 217
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "ecf"

    invoke-virtual {v0, v1, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 219
    return-void

    .line 213
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, P-Charging-Function-Addresses, setEventChargingFunctionAddress(), the ecfAddress parameter is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public delete(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .line 280
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 282
    .local v0, "li":Ljava/util/Iterator;
    const/4 v1, 0x0

    .line 283
    .local v1, "removed":Z
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 284
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/NameValue;

    .line 285
    .local v2, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 286
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 287
    const/4 v1, 0x1

    goto :goto_0

    .line 291
    .end local v2    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_1
    return v1
.end method

.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "encoding"    # Ljava/lang/StringBuilder;

    .line 94
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/DuplicateNameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/DuplicateNameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 99
    :cond_0
    return-object p1
.end method

.method public getChargingCollectionFunctionAddresses()Ljava/util/ListIterator;
    .locals 5

    .line 166
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 167
    .local v0, "li":Ljava/util/Iterator;
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 169
    .local v1, "ccfLIST":Ljava/util/LinkedList;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 170
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/NameValue;

    .line 171
    .local v2, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "ccf"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 173
    new-instance v3, Landroid/gov/nist/core/NameValue;

    invoke-direct {v3}, Landroid/gov/nist/core/NameValue;-><init>()V

    .line 175
    .local v3, "ccfNV":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/NameValue;->setName(Ljava/lang/String;)V

    .line 176
    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    .line 178
    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 180
    .end local v3    # "ccfNV":Landroid/gov/nist/core/NameValue;
    goto :goto_0

    .line 183
    .end local v2    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_1
    invoke-virtual {v1}, Ljava/util/LinkedList;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    return-object v2
.end method

.method public getEventChargingFunctionAddresses()Ljava/util/ListIterator;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator<",
            "Landroid/gov/nist/core/NameValue;",
            ">;"
        }
    .end annotation

    .line 249
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 251
    .local v0, "listw":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Landroid/gov/nist/core/NameValue;>;"
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1}, Landroid/gov/nist/core/NameValueList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 252
    .local v1, "li":Ljava/util/Iterator;
    invoke-virtual {v0}, Ljava/util/LinkedList;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    .line 254
    .local v2, "ecfLIST":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/core/NameValue;>;"
    const/4 v3, 0x0

    .line 255
    .local v3, "removed":Z
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 256
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/core/NameValue;

    .line 257
    .local v4, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v4}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "ecf"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 259
    new-instance v5, Landroid/gov/nist/core/NameValue;

    invoke-direct {v5}, Landroid/gov/nist/core/NameValue;-><init>()V

    .line 261
    .local v5, "ecfNV":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v4}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/NameValue;->setName(Ljava/lang/String;)V

    .line 262
    invoke-virtual {v4}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    .line 264
    invoke-interface {v2, v5}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 266
    .end local v5    # "ecfNV":Landroid/gov/nist/core/NameValue;
    goto :goto_0

    .line 269
    .end local v4    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_1
    return-object v2
.end method

.method public removeChargingCollectionFunctionAddress(Ljava/lang/String;)V
    .locals 3
    .param p1, "ccfAddress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 146
    if-eqz p1, :cond_1

    .line 151
    const-string/jumbo v0, "ccf"

    invoke-virtual {p0, p1, v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->delete(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 157
    return-void

    .line 153
    :cond_0
    new-instance v0, Ljava/text/ParseException;

    const-string v1, "CCF Address Not Removed"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 147
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, P-Charging-Function-Addresses, setChargingCollectionFunctionAddress(), the ccfAddress parameter is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeEventChargingFunctionAddress(Ljava/lang/String;)V
    .locals 3
    .param p1, "ecfAddress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 229
    if-eqz p1, :cond_1

    .line 234
    const-string/jumbo v0, "ecf"

    invoke-virtual {p0, p1, v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->delete(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 240
    return-void

    .line 236
    :cond_0
    new-instance v0, Ljava/text/ParseException;

    const-string v1, "ECF Address Not Removed"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 230
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, P-Charging-Function-Addresses, setEventChargingFunctionAddress(), the ecfAddress parameter is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setChargingCollectionFunctionAddress(Ljava/lang/String;)V
    .locals 2
    .param p1, "ccfAddress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 111
    if-eqz p1, :cond_0

    .line 117
    const-string/jumbo v0, "ccf"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->setMultiParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    return-void

    .line 112
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, P-Charging-Function-Addresses, setChargingCollectionFunctionAddress(), the ccfAddress parameter is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setEventChargingFunctionAddress(Ljava/lang/String;)V
    .locals 2
    .param p1, "ecfAddress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 194
    if-eqz p1, :cond_0

    .line 199
    const-string/jumbo v0, "ecf"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->setMultiParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    return-void

    .line 195
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, P-Charging-Function-Addresses, setEventChargingFunctionAddress(), the ecfAddress parameter is null."

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

    .line 296
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
