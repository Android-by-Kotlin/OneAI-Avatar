.class public final Landroid/gov/nist/javax/sip/header/AuthenticationInfo;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "AuthenticationInfo.java"

# interfaces
.implements Landroid/javax/sip/header/AuthenticationInfoHeader;


# static fields
.field private static final serialVersionUID:J = -0x3cac35432dc8d791L


# instance fields
.field private scheme:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 56
    const-string v0, "Authentication-Info"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 57
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string v1, ","

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->setSeparator(Ljava/lang/String;)V

    .line 58
    return-void
.end method


# virtual methods
.method public add(Landroid/gov/nist/core/NameValue;)V
    .locals 1
    .param p1, "nv"    # Landroid/gov/nist/core/NameValue;

    .line 61
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 62
    return-void
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 68
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->scheme:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->scheme:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 70
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getAuthInfo(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 81
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    return-object v0
.end method

.method public getAuthenticationInfo()Ljava/lang/String;
    .locals 1

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCNonce()Ljava/lang/String;
    .locals 1

    .line 105
    const-string/jumbo v0, "cnonce"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNextNonce()Ljava/lang/String;
    .locals 1

    .line 115
    const-string/jumbo v0, "nextnonce"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNonceCount()I
    .locals 1

    .line 125
    const-string/jumbo v0, "nc"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->getParameterAsInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getQop()Ljava/lang/String;
    .locals 1

    .line 135
    const-string/jumbo v0, "qop"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 1

    .line 144
    const-string/jumbo v0, "rspauth"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSNum()Ljava/lang/String;
    .locals 1

    .line 152
    const-string/jumbo v0, "snum"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSRand()Ljava/lang/String;
    .locals 1

    .line 159
    const-string/jumbo v0, "srand"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 1

    .line 173
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public getTargetName()Ljava/lang/String;
    .locals 1

    .line 166
    const-string/jumbo v0, "targetname"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setCNonce(Ljava/lang/String;)V
    .locals 1
    .param p1, "cNonce"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 185
    const-string/jumbo v0, "cnonce"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    return-void
.end method

.method public setNextNonce(Ljava/lang/String;)V
    .locals 1
    .param p1, "nextNonce"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 197
    const-string/jumbo v0, "nextnonce"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    return-void
.end method

.method public setNonceCount(I)V
    .locals 5
    .param p1, "nonceCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 209
    const/4 v0, 0x0

    if-ltz p1, :cond_0

    .line 211
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 213
    .local v1, "nc":Ljava/lang/String;
    const-string v2, "00000000"

    .line 214
    .local v2, "base":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    rsub-int/lit8 v4, v4, 0x8

    invoke-virtual {v2, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 215
    .end local v1    # "nc":Ljava/lang/String;
    .local v0, "nc":Ljava/lang/String;
    const-string/jumbo v1, "nc"

    invoke-virtual {p0, v1, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    return-void

    .line 210
    .end local v0    # "nc":Ljava/lang/String;
    .end local v2    # "base":Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/text/ParseException;

    const-string/jumbo v2, "bad value"

    invoke-direct {v1, v2, v0}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 289
    if-eqz p1, :cond_5

    .line 291
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 292
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    if-nez v0, :cond_4

    .line 293
    new-instance v1, Landroid/gov/nist/core/NameValue;

    invoke-direct {v1, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, v1

    .line 294
    const-string/jumbo v1, "qop"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "nextnonce"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "realm"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "cnonce"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "nonce"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "opaque"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "username"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "domain"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "rspauth"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "srand"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "snum"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "targetname"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 307
    :cond_0
    if-eqz p2, :cond_3

    .line 309
    const-string v1, "\""

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 313
    invoke-virtual {v0}, Landroid/gov/nist/core/NameValue;->setQuotedValue()V

    .line 315
    :cond_1
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->setParameter(Landroid/gov/nist/core/NameValue;)V

    goto :goto_0

    .line 310
    :cond_2
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " : Unexpected DOUBLE_QUOTE"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 308
    :cond_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "null value"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 317
    :cond_4
    invoke-virtual {v0, p2}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    .line 318
    :goto_0
    return-void

    .line 290
    .end local v0    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_5
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null name"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setQop(Ljava/lang/String;)V
    .locals 1
    .param p1, "qop"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 227
    const-string/jumbo v0, "qop"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    return-void
.end method

.method public setResponse(Ljava/lang/String;)V
    .locals 1
    .param p1, "response"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 241
    const-string/jumbo v0, "rspauth"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    return-void
.end method

.method public setSNum(Ljava/lang/String;)V
    .locals 1
    .param p1, "sNum"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 252
    const-string/jumbo v0, "snum"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    return-void
.end method

.method public setSRand(Ljava/lang/String;)V
    .locals 1
    .param p1, "sRand"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 263
    const-string/jumbo v0, "srand"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    return-void
.end method

.method public setScheme(Ljava/lang/String;)V
    .locals 0
    .param p1, "scheme"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 285
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->scheme:Ljava/lang/String;

    .line 286
    return-void
.end method

.method public setTargetName(Ljava/lang/String;)V
    .locals 1
    .param p1, "targetName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 274
    const-string/jumbo v0, "targetname"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    return-void
.end method
