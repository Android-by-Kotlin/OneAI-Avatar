.class public abstract Landroid/gov/nist/javax/sip/header/AuthenticationHeader;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "AuthenticationHeader.java"


# static fields
.field public static final ALGORITHM:Ljava/lang/String; = "algorithm"

.field public static final CK:Ljava/lang/String; = "ck"

.field public static final CNONCE:Ljava/lang/String; = "cnonce"

.field public static final DOMAIN:Ljava/lang/String; = "domain"

.field public static final IK:Ljava/lang/String; = "ik"

.field public static final INTEGRITY_PROTECTED:Ljava/lang/String; = "integrity-protected"

.field public static final NC:Ljava/lang/String; = "nc"

.field public static final NONCE:Ljava/lang/String; = "nonce"

.field public static final OPAQUE:Ljava/lang/String; = "opaque"

.field public static final QOP:Ljava/lang/String; = "qop"

.field public static final REALM:Ljava/lang/String; = "realm"

.field public static final RESPONSE:Ljava/lang/String; = "response"

.field public static final SIGNATURE:Ljava/lang/String; = "signature"

.field public static final SIGNED_BY:Ljava/lang/String; = "signed-by"

.field public static final STALE:Ljava/lang/String; = "stale"

.field public static final URI:Ljava/lang/String; = "uri"

.field public static final USERNAME:Ljava/lang/String; = "username"


# instance fields
.field protected scheme:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 93
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>()V

    .line 94
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string v1, ","

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->setSeparator(Ljava/lang/String;)V

    .line 95
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 87
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 88
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string v1, ","

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->setSeparator(Ljava/lang/String;)V

    .line 89
    const-string v0, "Digest"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->scheme:Ljava/lang/String;

    .line 90
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 157
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string v1, ","

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->setSeparator(Ljava/lang/String;)V

    .line 158
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->scheme:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 159
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getAlgorithm()Ljava/lang/String;
    .locals 1

    .line 308
    const-string/jumbo v0, "algorithm"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCK()Ljava/lang/String;
    .locals 1

    .line 534
    const-string/jumbo v0, "ck"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCNonce()Ljava/lang/String;
    .locals 1

    .line 434
    const-string/jumbo v0, "cnonce"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 1

    .line 392
    const-string/jumbo v0, "domain"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIK()Ljava/lang/String;
    .locals 1

    .line 522
    const-string/jumbo v0, "ik"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIntegrityProtected()Ljava/lang/String;
    .locals 1

    .line 551
    const-string/jumbo v0, "integrity-protected"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNonce()Ljava/lang/String;
    .locals 1

    .line 244
    const-string/jumbo v0, "nonce"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNonceCount()I
    .locals 1

    .line 438
    const-string/jumbo v0, "nc"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameterAsHexInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getOpaque()Ljava/lang/String;
    .locals 1

    .line 364
    const-string/jumbo v0, "opaque"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQop()Ljava/lang/String;
    .locals 1

    .line 336
    const-string/jumbo v0, "qop"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRealm()Ljava/lang/String;
    .locals 1

    .line 214
    const-string/jumbo v0, "realm"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 1

    .line 464
    const-string/jumbo v0, "response"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 1

    .line 181
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public getURI()Landroid/javax/sip/address/URI;
    .locals 1

    .line 280
    const-string/jumbo v0, "uri"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameterAsURI(Ljava/lang/String;)Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v0

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .line 491
    const-string/jumbo v0, "username"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isStale()Z
    .locals 1

    .line 415
    const-string/jumbo v0, "stale"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->getParameterAsBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setAlgorithm(Ljava/lang/String;)V
    .locals 2
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 295
    if-eqz p1, :cond_0

    .line 297
    const-string/jumbo v0, "algorithm"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    return-void

    .line 296
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setCK(Ljava/lang/String;)V
    .locals 2
    .param p1, "ck"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 526
    if-eqz p1, :cond_0

    .line 530
    const-string/jumbo v0, "ck"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 531
    return-void

    .line 527
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception,  AuthenticationHeader, setCk(), The auth-param CK parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setCNonce(Ljava/lang/String;)V
    .locals 1
    .param p1, "cnonce"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 425
    const-string/jumbo v0, "cnonce"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    return-void
.end method

.method public setChallenge(Landroid/gov/nist/javax/sip/header/Challenge;)V
    .locals 1
    .param p1, "challenge"    # Landroid/gov/nist/javax/sip/header/Challenge;

    .line 147
    iget-object v0, p1, Landroid/gov/nist/javax/sip/header/Challenge;->scheme:Ljava/lang/String;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->scheme:Ljava/lang/String;

    .line 148
    iget-object v0, p1, Landroid/gov/nist/javax/sip/header/Challenge;->authParams:Landroid/gov/nist/core/NameValueList;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    .line 149
    return-void
.end method

.method public setDomain(Ljava/lang/String;)V
    .locals 2
    .param p1, "domain"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 379
    if-eqz p1, :cond_0

    .line 381
    const-string/jumbo v0, "domain"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    return-void

    .line 380
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setIK(Ljava/lang/String;)V
    .locals 2
    .param p1, "ik"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 514
    if-eqz p1, :cond_0

    .line 518
    const-string/jumbo v0, "ik"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    return-void

    .line 515
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception,  AuthenticationHeader, setIk(), The auth-param IK parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setIntegrityProtected(Ljava/lang/String;)V
    .locals 2
    .param p1, "integrityProtected"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 540
    if-eqz p1, :cond_0

    .line 545
    const-string/jumbo v0, "integrity-protected"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 546
    return-void

    .line 541
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception,  AuthenticationHeader, setIntegrityProtected(), The integrity-protected parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setNonce(Ljava/lang/String;)V
    .locals 2
    .param p1, "nonce"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 229
    if-eqz p1, :cond_0

    .line 233
    const-string/jumbo v0, "nonce"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    return-void

    .line 230
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception,  AuthenticationHeader, setNonce(), The nonce parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setNonceCount(I)V
    .locals 5
    .param p1, "param"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 447
    const/4 v0, 0x0

    if-ltz p1, :cond_0

    .line 450
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 452
    .local v1, "nc":Ljava/lang/String;
    const-string v2, "00000000"

    .line 453
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

    .line 454
    .end local v1    # "nc":Ljava/lang/String;
    .local v0, "nc":Ljava/lang/String;
    const-string/jumbo v1, "nc"

    invoke-virtual {p0, v1, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 456
    return-void

    .line 448
    .end local v0    # "nc":Ljava/lang/String;
    .end local v2    # "base":Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/text/ParseException;

    const-string/jumbo v2, "bad value"

    invoke-direct {v1, v2, v0}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public setOpaque(Ljava/lang/String;)V
    .locals 2
    .param p1, "opaque"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 351
    if-eqz p1, :cond_0

    .line 353
    const-string/jumbo v0, "opaque"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    return-void

    .line 352
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
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

    .line 106
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 107
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    if-nez v0, :cond_6

    .line 108
    new-instance v1, Landroid/gov/nist/core/NameValue;

    invoke-direct {v1, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, v1

    .line 109
    const-string/jumbo v1, "qop"

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

    const-string/jumbo v2, "username"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "domain"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "opaque"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "nextnonce"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "uri"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "ik"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "ck"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "integrity-protected"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 122
    :cond_0
    instance-of v2, p0, Landroid/gov/nist/javax/sip/header/Authorization;

    if-nez v2, :cond_1

    instance-of v2, p0, Landroid/gov/nist/javax/sip/header/ProxyAuthorization;

    if-eqz v2, :cond_2

    :cond_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 126
    :cond_2
    invoke-virtual {v0}, Landroid/gov/nist/core/NameValue;->setQuotedValue()V

    .line 128
    :goto_0
    if-eqz p2, :cond_5

    .line 130
    const-string v1, "\""

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 134
    :cond_3
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->setParameter(Landroid/gov/nist/core/NameValue;)V

    goto :goto_1

    .line 131
    :cond_4
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

    .line 129
    :cond_5
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "null value"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 136
    :cond_6
    invoke-virtual {v0, p2}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    .line 138
    :goto_1
    return-void
.end method

.method public setQop(Ljava/lang/String;)V
    .locals 2
    .param p1, "qop"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 323
    if-eqz p1, :cond_0

    .line 325
    const-string/jumbo v0, "qop"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    return-void

    .line 324
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRealm(Ljava/lang/String;)V
    .locals 2
    .param p1, "realm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 198
    if-eqz p1, :cond_0

    .line 202
    const-string/jumbo v0, "realm"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    return-void

    .line 199
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception,  AuthenticationHeader, setRealm(), The realm parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setResponse(Ljava/lang/String;)V
    .locals 2
    .param p1, "response"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 474
    if-eqz p1, :cond_0

    .line 477
    const-string/jumbo v0, "response"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    return-void

    .line 475
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null parameter"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setScheme(Ljava/lang/String;)V
    .locals 0
    .param p1, "scheme"    # Ljava/lang/String;

    .line 171
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->scheme:Ljava/lang/String;

    .line 172
    return-void
.end method

.method public setStale(Z)V
    .locals 3
    .param p1, "stale"    # Z

    .line 404
    new-instance v0, Landroid/gov/nist/core/NameValue;

    const-string/jumbo v1, "stale"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Landroid/gov/nist/core/NameValue;)V

    .line 405
    return-void
.end method

.method public setURI(Landroid/javax/sip/address/URI;)V
    .locals 2
    .param p1, "uri"    # Landroid/javax/sip/address/URI;

    .line 259
    if-eqz p1, :cond_0

    .line 260
    new-instance v0, Landroid/gov/nist/core/NameValue;

    const-string/jumbo v1, "uri"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 261
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v0}, Landroid/gov/nist/core/NameValue;->setQuotedValue()V

    .line 262
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 263
    .end local v0    # "nv":Landroid/gov/nist/core/NameValue;
    nop

    .line 266
    return-void

    .line 264
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null URI"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 1
    .param p1, "username"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 510
    const-string/jumbo v0, "username"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    return-void
.end method
