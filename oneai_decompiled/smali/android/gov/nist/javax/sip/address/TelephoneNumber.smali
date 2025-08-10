.class public Landroid/gov/nist/javax/sip/address/TelephoneNumber;
.super Landroid/gov/nist/javax/sip/address/NetObject;
.source "TelephoneNumber.java"


# static fields
.field public static final ISUB:Ljava/lang/String; = "isub"

.field public static final PHONE_CONTEXT_TAG:Ljava/lang/String; = "context-tag"

.field public static final POSTDIAL:Ljava/lang/String; = "postdial"

.field public static final PROVIDER_TAG:Ljava/lang/String; = "provider-tag"


# instance fields
.field protected isglobal:Z

.field protected parameters:Landroid/gov/nist/core/NameValueList;

.field protected phoneNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 60
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/address/NetObject;-><init>()V

    .line 61
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    .line 62
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 239
    invoke-super {p0}, Landroid/gov/nist/javax/sip/address/NetObject;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    .line 240
    .local v0, "retval":Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    if-eqz v1, :cond_0

    .line 241
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1}, Landroid/gov/nist/core/NameValueList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/core/NameValueList;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    .line 242
    :cond_0
    return-object v0
.end method

.method public deleteParm(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 68
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 69
    return-void
.end method

.method public encode()Ljava/lang/String;
    .locals 1

    .line 185
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 189
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->isglobal:Z

    if-eqz v0, :cond_0

    .line 190
    const/16 v0, 0x2b

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 191
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->phoneNumber:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 193
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 196
    :cond_1
    return-object p1
.end method

.method public getIsdnSubaddress()Ljava/lang/String;
    .locals 2

    .line 90
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "isub"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 209
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 210
    .local v0, "val":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 211
    const/4 v1, 0x0

    return-object v1

    .line 212
    :cond_0
    instance-of v1, v0, Landroid/gov/nist/core/GenericObject;

    if-eqz v1, :cond_1

    .line 213
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v1}, Landroid/gov/nist/core/GenericObject;->encode()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 215
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getParameterNames()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 226
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->getNames()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getParameters()Landroid/gov/nist/core/NameValueList;
    .locals 1

    .line 246
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    return-object v0
.end method

.method public getPhoneNumber()Ljava/lang/String;
    .locals 1

    .line 75
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->phoneNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getPostDial()Ljava/lang/String;
    .locals 2

    .line 82
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "postdial"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public hasIsdnSubaddress()Z
    .locals 1

    .line 113
    const-string/jumbo v0, "isub"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->hasParm(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasParm(Ljava/lang/String;)Z
    .locals 1
    .param p1, "pname"    # Ljava/lang/String;

    .line 105
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->hasNameValue(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasPostDial()Z
    .locals 2

    .line 97
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "postdial"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isGlobal()Z
    .locals 1

    .line 121
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->isglobal:Z

    return v0
.end method

.method public removeIsdnSubaddress()V
    .locals 1

    .line 134
    const-string/jumbo v0, "isub"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->deleteParm(Ljava/lang/String;)V

    .line 135
    return-void
.end method

.method public removeParameter(Ljava/lang/String;)V
    .locals 1
    .param p1, "parameter"    # Ljava/lang/String;

    .line 230
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 231
    return-void
.end method

.method public removePostDial()V
    .locals 2

    .line 127
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "postdial"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 128
    return-void
.end method

.method public setGlobal(Z)V
    .locals 0
    .param p1, "g"    # Z

    .line 149
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->isglobal:Z

    .line 150
    return-void
.end method

.method public setIsdnSubaddress(Ljava/lang/String;)V
    .locals 1
    .param p1, "isub"    # Ljava/lang/String;

    .line 174
    const-string/jumbo v0, "isub"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->setParm(Ljava/lang/String;Ljava/lang/Object;)V

    .line 175
    return-void
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 234
    new-instance v0, Landroid/gov/nist/core/NameValue;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 235
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 236
    return-void
.end method

.method public setParameters(Landroid/gov/nist/core/NameValueList;)V
    .locals 0
    .param p1, "p"    # Landroid/gov/nist/core/NameValueList;

    .line 142
    iput-object p1, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    .line 143
    return-void
.end method

.method public setParm(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 165
    new-instance v0, Landroid/gov/nist/core/NameValue;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 166
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 167
    return-void
.end method

.method public setPhoneNumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "num"    # Ljava/lang/String;

    .line 181
    iput-object p1, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->phoneNumber:Ljava/lang/String;

    .line 182
    return-void
.end method

.method public setPostDial(Ljava/lang/String;)V
    .locals 2
    .param p1, "p"    # Ljava/lang/String;

    .line 156
    new-instance v0, Landroid/gov/nist/core/NameValue;

    const-string/jumbo v1, "postdial"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 157
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 158
    return-void
.end method
