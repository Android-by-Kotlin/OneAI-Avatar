.class public Landroid/gov/nist/javax/sip/address/SipUri;
.super Landroid/gov/nist/javax/sip/address/GenericURI;
.source "SipUri.java"

# interfaces
.implements Landroid/javax/sip/address/SipURI;
.implements Landroid/gov/nist/javax/sip/address/SipURIExt;


# static fields
.field private static final serialVersionUID:J = 0x6b8cc0d42713c224L


# instance fields
.field protected authority:Landroid/gov/nist/javax/sip/address/Authority;

.field protected qheaders:Landroid/gov/nist/core/NameValueList;

.field protected telephoneSubscriber:Landroid/gov/nist/javax/sip/address/TelephoneNumber;

.field protected uriParms:Landroid/gov/nist/core/NameValueList;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 83
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/address/GenericURI;-><init>()V

    .line 84
    const-string/jumbo v0, "sip"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->scheme:Ljava/lang/String;

    .line 85
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    .line 86
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    .line 87
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    const-string v1, "&"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->setSeparator(Ljava/lang/String;)V

    .line 88
    return-void
.end method


# virtual methods
.method public clearPassword()V
    .locals 1

    .line 117
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/Authority;->getUserInfo()Landroid/gov/nist/javax/sip/address/UserInfo;

    move-result-object v0

    .line 119
    .local v0, "userInfo":Landroid/gov/nist/javax/sip/address/UserInfo;
    if-eqz v0, :cond_0

    .line 120
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/UserInfo;->clearPassword()V

    .line 122
    .end local v0    # "userInfo":Landroid/gov/nist/javax/sip/address/UserInfo;
    :cond_0
    return-void
.end method

.method public clearQheaders()V
    .locals 1

    .line 134
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    .line 135
    return-void
.end method

.method public clearUriParms()V
    .locals 1

    .line 111
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    .line 112
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 715
    invoke-super {p0}, Landroid/gov/nist/javax/sip/address/GenericURI;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/address/SipUri;

    .line 716
    .local v0, "retval":Landroid/gov/nist/javax/sip/address/SipUri;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    if-eqz v1, :cond_0

    .line 717
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/Authority;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/address/Authority;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    .line 718
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    if-eqz v1, :cond_1

    .line 719
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1}, Landroid/gov/nist/core/NameValueList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/core/NameValueList;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    .line 720
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    if-eqz v1, :cond_2

    .line 721
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1}, Landroid/gov/nist/core/NameValueList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/core/NameValueList;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    .line 722
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->telephoneSubscriber:Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    if-eqz v1, :cond_3

    .line 723
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->telephoneSubscriber:Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/address/SipUri;->telephoneSubscriber:Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    .line 724
    :cond_3
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 1

    .line 240
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/address/SipUri;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 244
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->scheme:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    if-eqz v0, :cond_0

    .line 246
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/Authority;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 247
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 248
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 251
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 252
    const-string v0, "?"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 255
    :cond_2
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 12
    .param p1, "that"    # Ljava/lang/Object;

    .line 157
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 159
    :cond_0
    instance-of v1, p1, Landroid/javax/sip/address/SipURI;

    const/4 v2, 0x0

    if-eqz v1, :cond_27

    .line 160
    move-object v1, p0

    .line 161
    .local v1, "a":Landroid/javax/sip/address/SipURI;
    move-object v3, p1

    check-cast v3, Landroid/javax/sip/address/SipURI;

    .line 164
    .local v3, "b":Landroid/javax/sip/address/SipURI;
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->isSecure()Z

    move-result v4

    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->isSecure()Z

    move-result v5

    xor-int/2addr v4, v5

    if-eqz v4, :cond_1

    return v2

    .line 168
    :cond_1
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getUser()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2

    move v4, v0

    goto :goto_0

    :cond_2
    move v4, v2

    :goto_0
    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getUser()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_3

    move v5, v0

    goto :goto_1

    :cond_3
    move v5, v2

    :goto_1
    xor-int/2addr v4, v5

    if-eqz v4, :cond_4

    return v2

    .line 169
    :cond_4
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getUserPassword()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_5

    move v4, v0

    goto :goto_2

    :cond_5
    move v4, v2

    :goto_2
    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getUserPassword()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_6

    move v5, v0

    goto :goto_3

    :cond_6
    move v5, v2

    :goto_3
    xor-int/2addr v4, v5

    if-eqz v4, :cond_7

    return v2

    .line 171
    :cond_7
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getUser()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_8

    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/gov/nist/javax/sip/address/UriDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getUser()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/gov/nist/javax/sip/address/UriDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    return v2

    .line 172
    :cond_8
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getUserPassword()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_9

    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getUserPassword()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/gov/nist/javax/sip/address/UriDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getUserPassword()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/gov/nist/javax/sip/address/UriDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    return v2

    .line 173
    :cond_9
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getHost()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_a

    move v4, v0

    goto :goto_4

    :cond_a
    move v4, v2

    :goto_4
    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getHost()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_b

    move v5, v0

    goto :goto_5

    :cond_b
    move v5, v2

    :goto_5
    xor-int/2addr v4, v5

    if-eqz v4, :cond_c

    return v2

    .line 174
    :cond_c
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getHost()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_d

    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_d

    return v2

    .line 175
    :cond_d
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getPort()I

    move-result v4

    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getPort()I

    move-result v5

    if-eq v4, v5, :cond_e

    return v2

    .line 178
    :cond_e
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getParameterNames()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_10

    .line 179
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 181
    .local v5, "pname":Ljava/lang/String;
    invoke-interface {v1, v5}, Landroid/javax/sip/address/SipURI;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 182
    .local v6, "p1":Ljava/lang/String;
    invoke-interface {v3, v5}, Landroid/javax/sip/address/SipURI;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 185
    .local v7, "p2":Ljava/lang/String;
    if-eqz v6, :cond_f

    if-eqz v7, :cond_f

    invoke-static {v6}, Landroid/gov/nist/javax/sip/address/UriDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7}, Landroid/gov/nist/javax/sip/address/UriDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_f

    return v2

    .line 186
    .end local v5    # "pname":Ljava/lang/String;
    .end local v6    # "p1":Ljava/lang/String;
    .end local v7    # "p2":Ljava/lang/String;
    :cond_f
    goto :goto_6

    .line 189
    .end local v4    # "i":Ljava/util/Iterator;
    :cond_10
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getTransportParam()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_11

    move v4, v0

    goto :goto_7

    :cond_11
    move v4, v2

    :goto_7
    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getTransportParam()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_12

    move v5, v0

    goto :goto_8

    :cond_12
    move v5, v2

    :goto_8
    xor-int/2addr v4, v5

    if-eqz v4, :cond_13

    return v2

    .line 190
    :cond_13
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getUserParam()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_14

    move v4, v0

    goto :goto_9

    :cond_14
    move v4, v2

    :goto_9
    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getUserParam()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_15

    move v5, v0

    goto :goto_a

    :cond_15
    move v5, v2

    :goto_a
    xor-int/2addr v4, v5

    if-eqz v4, :cond_16

    return v2

    .line 191
    :cond_16
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getTTLParam()I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_17

    move v4, v0

    goto :goto_b

    :cond_17
    move v4, v2

    :goto_b
    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getTTLParam()I

    move-result v6

    if-ne v6, v5, :cond_18

    move v5, v0

    goto :goto_c

    :cond_18
    move v5, v2

    :goto_c
    xor-int/2addr v4, v5

    if-eqz v4, :cond_19

    return v2

    .line 192
    :cond_19
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getMethodParam()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1a

    move v4, v0

    goto :goto_d

    :cond_1a
    move v4, v2

    :goto_d
    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getMethodParam()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1b

    move v5, v0

    goto :goto_e

    :cond_1b
    move v5, v2

    :goto_e
    xor-int/2addr v4, v5

    if-eqz v4, :cond_1c

    return v2

    .line 193
    :cond_1c
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getMAddrParam()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1d

    move v4, v0

    goto :goto_f

    :cond_1d
    move v4, v2

    :goto_f
    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getMAddrParam()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1e

    move v5, v0

    goto :goto_10

    :cond_1e
    move v5, v2

    :goto_10
    xor-int/2addr v4, v5

    if-eqz v4, :cond_1f

    return v2

    .line 196
    :cond_1f
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getHeaderNames()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_20

    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getHeaderNames()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_20

    return v2

    .line 197
    :cond_20
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getHeaderNames()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_21

    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getHeaderNames()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_21

    return v2

    .line 199
    :cond_21
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getHeaderNames()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_26

    invoke-interface {v3}, Landroid/javax/sip/address/SipURI;->getHeaderNames()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_26

    .line 200
    const/4 v4, 0x0

    .line 202
    .local v4, "headerFactory":Landroid/javax/sip/header/HeaderFactory;
    :try_start_0
    invoke-static {}, Landroid/javax/sip/SipFactory;->getInstance()Landroid/javax/sip/SipFactory;

    move-result-object v5

    invoke-virtual {v5}, Landroid/javax/sip/SipFactory;->createHeaderFactory()Landroid/javax/sip/header/HeaderFactory;

    move-result-object v5
    :try_end_0
    .catch Landroid/javax/sip/PeerUnavailableException; {:try_start_0 .. :try_end_0} :catch_1

    move-object v4, v5

    .line 206
    nop

    .line 207
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getHeaderNames()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_26

    .line 208
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 210
    .local v6, "hname":Ljava/lang/String;
    invoke-interface {v1, v6}, Landroid/javax/sip/address/SipURI;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 211
    .local v7, "h1":Ljava/lang/String;
    invoke-interface {v3, v6}, Landroid/javax/sip/address/SipURI;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 213
    .local v8, "h2":Ljava/lang/String;
    if-nez v7, :cond_22

    if-eqz v8, :cond_22

    return v2

    .line 214
    :cond_22
    if-nez v8, :cond_23

    if-eqz v7, :cond_23

    return v2

    .line 216
    :cond_23
    if-nez v7, :cond_24

    if-nez v8, :cond_24

    goto :goto_11

    .line 218
    :cond_24
    :try_start_1
    invoke-static {v7}, Landroid/gov/nist/javax/sip/address/UriDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v4, v6, v9}, Landroid/javax/sip/header/HeaderFactory;->createHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v9

    .line 219
    .local v9, "header1":Landroid/javax/sip/header/Header;
    invoke-static {v8}, Landroid/gov/nist/javax/sip/address/UriDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v4, v6, v10}, Landroid/javax/sip/header/HeaderFactory;->createHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v10

    .line 221
    .local v10, "header2":Landroid/javax/sip/header/Header;
    invoke-interface {v9, v10}, Landroid/javax/sip/header/Header;->equals(Ljava/lang/Object;)Z

    move-result v11
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v11, :cond_25

    return v2

    .line 225
    .end local v9    # "header1":Landroid/javax/sip/header/Header;
    .end local v10    # "header2":Landroid/javax/sip/header/Header;
    :cond_25
    nop

    .line 226
    .end local v6    # "hname":Ljava/lang/String;
    .end local v7    # "h1":Ljava/lang/String;
    .end local v8    # "h2":Ljava/lang/String;
    goto :goto_11

    .line 222
    .restart local v6    # "hname":Ljava/lang/String;
    .restart local v7    # "h1":Ljava/lang/String;
    .restart local v8    # "h2":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 223
    .local v0, "e":Ljava/text/ParseException;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Cannot parse one of the header of the sip uris to compare "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v0}, Landroid/gov/nist/core/Debug;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 224
    return v2

    .line 203
    .end local v0    # "e":Ljava/text/ParseException;
    .end local v5    # "i":Ljava/util/Iterator;
    .end local v6    # "hname":Ljava/lang/String;
    .end local v7    # "h1":Ljava/lang/String;
    .end local v8    # "h2":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 204
    .local v0, "e":Landroid/javax/sip/PeerUnavailableException;
    const-string v5, "Cannot get the header factory to parse the header of the sip uris to compare"

    invoke-static {v5, v0}, Landroid/gov/nist/core/Debug;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 205
    return v2

    .line 230
    .end local v0    # "e":Landroid/javax/sip/PeerUnavailableException;
    .end local v4    # "headerFactory":Landroid/javax/sip/header/HeaderFactory;
    :cond_26
    return v0

    .line 232
    .end local v1    # "a":Landroid/javax/sip/address/SipURI;
    .end local v3    # "b":Landroid/javax/sip/address/SipURI;
    :cond_27
    return v2
.end method

.method public getAuthority()Landroid/gov/nist/javax/sip/address/Authority;
    .locals 1

    .line 127
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    return-object v0
.end method

.method public getGrParam()Ljava/lang/String;
    .locals 2

    .line 1055
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "gr"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 737
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getHeaderNames()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 750
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->getNames()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 2

    .line 426
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 427
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/Authority;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v0

    if-nez v0, :cond_1

    return-object v1

    .line 428
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/Authority;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/core/Host;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHostPort()Landroid/gov/nist/core/HostPort;
    .locals 1

    .line 404
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/Authority;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 407
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/Authority;->getHostPort()Landroid/gov/nist/core/HostPort;

    move-result-object v0

    return-object v0

    .line 405
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLrParam()Ljava/lang/String;
    .locals 2

    .line 760
    const-string/jumbo v0, "lr"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/address/SipUri;->hasParameter(Ljava/lang/String;)Z

    move-result v0

    .line 761
    .local v0, "haslr":Z
    if-eqz v0, :cond_0

    const-string/jumbo v1, "true"

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getMAddrParam()Ljava/lang/String;
    .locals 2

    .line 770
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "maddr"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 771
    .local v0, "maddr":Landroid/gov/nist/core/NameValue;
    if-nez v0, :cond_0

    .line 772
    const/4 v1, 0x0

    return-object v1

    .line 773
    :cond_0
    invoke-virtual {v0}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 774
    .local v1, "host":Ljava/lang/String;
    return-object v1
.end method

.method public getMethod()Ljava/lang/String;
    .locals 1

    .line 328
    const-string/jumbo v0, "method"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/address/SipUri;->getParm(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getMethodParam()Ljava/lang/String;
    .locals 1

    .line 784
    const-string/jumbo v0, "method"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/address/SipUri;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 795
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 796
    .local v0, "val":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 797
    const/4 v1, 0x0

    return-object v1

    .line 798
    :cond_0
    instance-of v1, v0, Landroid/gov/nist/core/GenericObject;

    if-eqz v1, :cond_1

    .line 799
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v1}, Landroid/gov/nist/core/GenericObject;->encode()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 801
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

    .line 815
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->getNames()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getParameters()Landroid/gov/nist/core/NameValueList;
    .locals 1

    .line 336
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    return-object v0
.end method

.method public getParm(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "parmname"    # Ljava/lang/String;

    .line 319
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 320
    .local v0, "obj":Ljava/lang/Object;
    return-object v0
.end method

.method public getPort()I
    .locals 2

    .line 416
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/address/SipUri;->getHostPort()Landroid/gov/nist/core/HostPort;

    move-result-object v0

    .line 417
    .local v0, "hp":Landroid/gov/nist/core/HostPort;
    if-nez v0, :cond_0

    .line 418
    const/4 v1, -0x1

    return v1

    .line 419
    :cond_0
    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v1

    return v1
.end method

.method public getQheaders()Landroid/gov/nist/core/NameValueList;
    .locals 1

    .line 352
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    return-object v0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 1

    .line 103
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public getTTLParam()I
    .locals 2

    .line 824
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "ttl"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 825
    .local v0, "ttl":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 826
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1

    .line 828
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public getTelephoneSubscriber()Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    .locals 1

    .line 390
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->telephoneSubscriber:Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    if-nez v0, :cond_0

    .line 392
    new-instance v0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->telephoneSubscriber:Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    .line 394
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->telephoneSubscriber:Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    return-object v0
.end method

.method public getTransportParam()Ljava/lang/String;
    .locals 2

    .line 837
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    .line 838
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "transport"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 840
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .line 851
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/Authority;->getUser()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserAtHost()Ljava/lang/String;
    .locals 5

    .line 274
    const-string v0, ""

    .line 275
    .local v0, "user":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/Authority;->getUserInfo()Landroid/gov/nist/javax/sip/address/UserInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 276
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/Authority;->getUserInfo()Landroid/gov/nist/javax/sip/address/UserInfo;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/UserInfo;->getUser()Ljava/lang/String;

    move-result-object v0

    .line 278
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/Authority;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/core/Host;->encode()Ljava/lang/String;

    move-result-object v1

    .line 279
    .local v1, "host":Ljava/lang/String;
    const/4 v2, 0x0

    .line 280
    .local v2, "s":Ljava/lang/StringBuilder;
    if-eqz v0, :cond_2

    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 283
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "@"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    goto :goto_1

    .line 281
    :cond_2
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object v2, v3

    .line 285
    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getUserAtHostPort()Ljava/lang/String;
    .locals 6

    .line 293
    const-string v0, ""

    .line 294
    .local v0, "user":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/Authority;->getUserInfo()Landroid/gov/nist/javax/sip/address/UserInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 295
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/Authority;->getUserInfo()Landroid/gov/nist/javax/sip/address/UserInfo;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/UserInfo;->getUser()Ljava/lang/String;

    move-result-object v0

    .line 297
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/Authority;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/core/Host;->encode()Ljava/lang/String;

    move-result-object v1

    .line 298
    .local v1, "host":Ljava/lang/String;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/address/Authority;->getPort()I

    move-result v2

    .line 300
    .local v2, "port":I
    const/4 v3, 0x0

    .line 301
    .local v3, "s":Ljava/lang/StringBuilder;
    if-eqz v0, :cond_2

    const-string v4, ""

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_0

    .line 304
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "@"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    goto :goto_1

    .line 302
    :cond_2
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object v3, v4

    .line 306
    :goto_1
    const/4 v4, -0x1

    if-eq v2, v4, :cond_3

    .line 307
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 309
    :cond_3
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public getUserParam()Ljava/lang/String;
    .locals 1

    .line 1016
    const-string/jumbo v0, "user"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/address/SipUri;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserPassword()Ljava/lang/String;
    .locals 1

    .line 369
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    if-nez v0, :cond_0

    .line 370
    const/4 v0, 0x0

    return-object v0

    .line 371
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/Authority;->getPassword()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserType()Ljava/lang/String;
    .locals 2

    .line 360
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "user"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public hasGrParam()Z
    .locals 2

    .line 1037
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "gr"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasLrParam()Z
    .locals 2

    .line 1027
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "lr"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasParameter(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 669
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasTransport()Z
    .locals 1

    .line 691
    const-string/jumbo v0, "transport"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/address/SipUri;->hasParameter(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSecure()Z
    .locals 2

    .line 861
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/address/SipUri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "sips"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSipURI()Z
    .locals 1

    .line 869
    const/4 v0, 0x1

    return v0
.end method

.method public isUserTelephoneSubscriber()Z
    .locals 2

    .line 458
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "user"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 459
    .local v0, "usrtype":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 460
    const/4 v1, 0x0

    return v1

    .line 461
    :cond_0
    const-string/jumbo v1, "phone"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public removeHeader(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 492
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    .line 493
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 494
    :cond_0
    return-void
.end method

.method public removeHeaders()V
    .locals 1

    .line 499
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    .line 500
    return-void
.end method

.method public removeMAddr()V
    .locals 2

    .line 476
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    .line 477
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "maddr"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 478
    :cond_0
    return-void
.end method

.method public removeMethod()V
    .locals 2

    .line 521
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    .line 522
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "method"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 523
    :cond_0
    return-void
.end method

.method public removeParameter(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 699
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 700
    return-void
.end method

.method public removeParameters()V
    .locals 1

    .line 343
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    .line 344
    return-void
.end method

.method public removePort()V
    .locals 1

    .line 514
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/Authority;->removePort()V

    .line 515
    return-void
.end method

.method public removeTTL()V
    .locals 2

    .line 468
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    .line 469
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "ttl"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 470
    :cond_0
    return-void
.end method

.method public removeTransport()V
    .locals 2

    .line 484
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    .line 485
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "transport"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 486
    :cond_0
    return-void
.end method

.method public removeUser()V
    .locals 1

    .line 544
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/Authority;->removeUserInfo()V

    .line 545
    return-void
.end method

.method public removeUserType()V
    .locals 2

    .line 506
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    .line 507
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "user"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 508
    :cond_0
    return-void
.end method

.method public setAuthority(Landroid/gov/nist/javax/sip/address/Authority;)V
    .locals 0
    .param p1, "authority"    # Landroid/gov/nist/javax/sip/address/Authority;

    .line 564
    iput-object p1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    .line 565
    return-void
.end method

.method public setDefaultParm(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 554
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 555
    new-instance v0, Landroid/gov/nist/core/NameValue;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 556
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 558
    .end local v0    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_0
    return-void
.end method

.method public setGrParam(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 1046
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "gr"

    invoke-virtual {v0, v1, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1047
    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 880
    new-instance v0, Landroid/gov/nist/core/NameValue;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 881
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 883
    return-void
.end method

.method public setHost(Landroid/gov/nist/core/Host;)V
    .locals 1
    .param p1, "h"    # Landroid/gov/nist/core/Host;

    .line 571
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    if-nez v0, :cond_0

    .line 572
    new-instance v0, Landroid/gov/nist/javax/sip/address/Authority;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/Authority;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    .line 573
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/Authority;->setHost(Landroid/gov/nist/core/Host;)V

    .line 574
    return-void
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 891
    new-instance v0, Landroid/gov/nist/core/Host;

    invoke-direct {v0, p1}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    .line 892
    .local v0, "h":Landroid/gov/nist/core/Host;
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/address/SipUri;->setHost(Landroid/gov/nist/core/Host;)V

    .line 893
    return-void
.end method

.method public setHostPort(Landroid/gov/nist/core/HostPort;)V
    .locals 1
    .param p1, "hostPort"    # Landroid/gov/nist/core/HostPort;

    .line 706
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    if-nez v0, :cond_0

    .line 707
    new-instance v0, Landroid/gov/nist/javax/sip/address/Authority;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/Authority;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    .line 709
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/Authority;->setHostPort(Landroid/gov/nist/core/HostPort;)V

    .line 710
    return-void
.end method

.method public setIsdnSubAddress(Ljava/lang/String;)V
    .locals 1
    .param p1, "isdnSubAddress"    # Ljava/lang/String;

    .line 640
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->telephoneSubscriber:Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    if-nez v0, :cond_0

    .line 641
    new-instance v0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->telephoneSubscriber:Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    .line 642
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->telephoneSubscriber:Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->setIsdnSubaddress(Ljava/lang/String;)V

    .line 643
    return-void
.end method

.method public setLrParam()V
    .locals 3

    .line 903
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "lr"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 904
    return-void
.end method

.method public setMAddr(Ljava/lang/String;)V
    .locals 4
    .param p1, "mAddr"    # Ljava/lang/String;

    .line 606
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "maddr"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 607
    .local v0, "nameValue":Landroid/gov/nist/core/NameValue;
    new-instance v2, Landroid/gov/nist/core/Host;

    invoke-direct {v2}, Landroid/gov/nist/core/Host;-><init>()V

    .line 608
    .local v2, "host":Landroid/gov/nist/core/Host;
    invoke-virtual {v2, p1}, Landroid/gov/nist/core/Host;->setAddress(Ljava/lang/String;)V

    .line 609
    if-eqz v0, :cond_0

    .line 610
    invoke-virtual {v0, v2}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 612
    :cond_0
    new-instance v3, Landroid/gov/nist/core/NameValue;

    invoke-direct {v3, v1, v2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, v3

    .line 613
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 615
    :goto_0
    return-void
.end method

.method public setMAddrParam(Ljava/lang/String;)V
    .locals 2
    .param p1, "maddr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 915
    if-eqz p1, :cond_0

    .line 917
    const-string/jumbo v0, "maddr"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/address/SipUri;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 918
    return-void

    .line 916
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "bad maddr"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMethod(Ljava/lang/String;)V
    .locals 2
    .param p1, "method"    # Ljava/lang/String;

    .line 632
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "method"

    invoke-virtual {v0, v1, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 633
    return-void
.end method

.method public setMethodParam(Ljava/lang/String;)V
    .locals 1
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 927
    const-string/jumbo v0, "method"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/address/SipUri;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 928
    return-void
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

    .line 949
    const-string/jumbo v0, "ttl"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 951
    :try_start_0
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 954
    goto :goto_0

    .line 952
    :catch_0
    move-exception v0

    .line 953
    .local v0, "ex":Ljava/lang/NumberFormatException;
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "bad parameter "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 956
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    :cond_0
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1, p2}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 957
    return-void
.end method

.method public setPort(I)V
    .locals 1
    .param p1, "p"    # I

    .line 657
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    if-nez v0, :cond_0

    .line 658
    new-instance v0, Landroid/gov/nist/javax/sip/address/Authority;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/Authority;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    .line 659
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/Authority;->setPort(I)V

    .line 660
    return-void
.end method

.method public setQHeader(Landroid/gov/nist/core/NameValue;)V
    .locals 1
    .param p1, "nameValue"    # Landroid/gov/nist/core/NameValue;

    .line 677
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 678
    return-void
.end method

.method public setQheaders(Landroid/gov/nist/core/NameValueList;)V
    .locals 0
    .param p1, "parms"    # Landroid/gov/nist/core/NameValueList;

    .line 598
    iput-object p1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->qheaders:Landroid/gov/nist/core/NameValueList;

    .line 599
    return-void
.end method

.method public setScheme(Ljava/lang/String;)V
    .locals 3
    .param p1, "scheme"    # Ljava/lang/String;

    .line 94
    const-string/jumbo v0, "sip"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "sips"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 96
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad scheme "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :cond_1
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->scheme:Ljava/lang/String;

    .line 98
    return-void
.end method

.method public setSecure(Z)V
    .locals 1
    .param p1, "secure"    # Z

    .line 965
    if-eqz p1, :cond_0

    .line 966
    const-string/jumbo v0, "sips"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->scheme:Ljava/lang/String;

    goto :goto_0

    .line 968
    :cond_0
    const-string/jumbo v0, "sip"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->scheme:Ljava/lang/String;

    .line 969
    :goto_0
    return-void
.end method

.method public setTTLParam(I)V
    .locals 3
    .param p1, "ttl"    # I

    .line 978
    if-lez p1, :cond_1

    .line 980
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    .line 981
    new-instance v0, Landroid/gov/nist/core/NameValue;

    const-string/jumbo v1, "ttl"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 982
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 984
    .end local v0    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_0
    return-void

    .line 979
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad ttl value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setTelephoneSubscriber(Landroid/gov/nist/javax/sip/address/TelephoneNumber;)V
    .locals 0
    .param p1, "tel"    # Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    .line 650
    iput-object p1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->telephoneSubscriber:Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    .line 651
    return-void
.end method

.method public setTransportParam(Ljava/lang/String;)V
    .locals 3
    .param p1, "transport"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 997
    if-eqz p1, :cond_0

    .line 1005
    new-instance v0, Landroid/gov/nist/core/NameValue;

    const-string/jumbo v1, "transport"

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1006
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 1009
    return-void

    .line 998
    .end local v0    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setUriParameter(Landroid/gov/nist/core/NameValue;)V
    .locals 1
    .param p1, "nameValue"    # Landroid/gov/nist/core/NameValue;

    .line 684
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 685
    return-void
.end method

.method public setUriParm(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 590
    new-instance v0, Landroid/gov/nist/core/NameValue;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 591
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 592
    return-void
.end method

.method public setUriParms(Landroid/gov/nist/core/NameValueList;)V
    .locals 0
    .param p1, "parms"    # Landroid/gov/nist/core/NameValueList;

    .line 580
    iput-object p1, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    .line 581
    return-void
.end method

.method public setUser(Ljava/lang/String;)V
    .locals 1
    .param p1, "uname"    # Ljava/lang/String;

    .line 534
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    if-nez v0, :cond_0

    .line 535
    new-instance v0, Landroid/gov/nist/javax/sip/address/Authority;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/Authority;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    .line 538
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/Authority;->setUser(Ljava/lang/String;)V

    .line 539
    return-void
.end method

.method public setUserParam(Ljava/lang/String;)V
    .locals 2
    .param p1, "usertype"    # Ljava/lang/String;

    .line 624
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->uriParms:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "user"

    invoke-virtual {v0, v1, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 625
    return-void
.end method

.method public setUserPassword(Ljava/lang/String;)V
    .locals 1
    .param p1, "password"    # Ljava/lang/String;

    .line 378
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    if-nez v0, :cond_0

    .line 379
    new-instance v0, Landroid/gov/nist/javax/sip/address/Authority;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/Authority;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    .line 380
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/SipUri;->authority:Landroid/gov/nist/javax/sip/address/Authority;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/Authority;->setPassword(Ljava/lang/String;)V

    .line 381
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 264
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/address/SipUri;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
