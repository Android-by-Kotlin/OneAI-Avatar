.class public Landroid/gov/nist/javax/sip/header/ims/PServedUser;
.super Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
.source "PServedUser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/ims/PServedUserHeader;
.implements Landroid/gov/nist/javax/sip/header/ims/SIPHeaderNamesIms;
.implements Landroid/javax/sip/header/ExtensionHeader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 53
    const-string/jumbo v0, "P-Served-User"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/address/AddressImpl;)V
    .locals 1
    .param p1, "address"    # Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 47
    const-string/jumbo v0, "P-Served-User"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 48
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 49
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    .line 160
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/PServedUser;

    .line 161
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ims/PServedUser;
    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 4
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 130
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->encode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "regstate"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const-string v2, "="

    const-string v3, ";"

    if-eqz v0, :cond_0

    .line 133
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->getRegistrationState()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "sescase"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 137
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->getSessionCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    :cond_1
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "other"    # Ljava/lang/Object;

    .line 150
    instance-of v0, p1, Landroid/gov/nist/javax/sip/header/ims/PServedUser;

    if-eqz v0, :cond_0

    .line 152
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/PServedUserHeader;

    .line 153
    .local v0, "psu":Landroid/gov/nist/javax/sip/header/ims/PServedUserHeader;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v1

    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/header/ims/PServedUser;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/javax/sip/address/Address;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 155
    .end local v0    # "psu":Landroid/gov/nist/javax/sip/header/ims/PServedUserHeader;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getRegistrationState()Ljava/lang/String;
    .locals 1

    .line 58
    const-string/jumbo v0, "regstate"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSessionCase()Ljava/lang/String;
    .locals 1

    .line 63
    const-string/jumbo v0, "sescase"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setRegistrationState(Ljava/lang/String;)V
    .locals 2
    .param p1, "registrationState"    # Ljava/lang/String;

    .line 68
    if-eqz p1, :cond_2

    .line 70
    const-string/jumbo v0, "reg"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "unreg"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 82
    :cond_0
    :try_start_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "Value can be either reg or unreg"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "registrationState":Ljava/lang/String;
    throw v0
    :try_end_0
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .restart local p1    # "registrationState":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Landroid/javax/sip/InvalidArgumentException;
    invoke-virtual {v0}, Landroid/javax/sip/InvalidArgumentException;->printStackTrace()V

    .line 85
    .end local v0    # "e":Landroid/javax/sip/InvalidArgumentException;
    goto :goto_2

    .line 73
    :cond_1
    :goto_0
    :try_start_1
    const-string/jumbo v0, "regstate"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->setParameter(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 74
    :catch_1
    move-exception v0

    .line 75
    .local v0, "e":Ljava/text/ParseException;
    invoke-virtual {v0}, Ljava/text/ParseException;->printStackTrace()V

    .line 76
    .end local v0    # "e":Ljava/text/ParseException;
    :goto_1
    nop

    .line 94
    :goto_2
    return-void

    .line 91
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "regstate Parameter value is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSessionCase(Ljava/lang/String;)V
    .locals 2
    .param p1, "sessionCase"    # Ljava/lang/String;

    .line 98
    if-eqz p1, :cond_2

    .line 100
    const-string/jumbo v0, "orig"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "term"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 111
    :cond_0
    :try_start_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "Value can be either orig or term"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "sessionCase":Ljava/lang/String;
    throw v0
    :try_end_0
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .restart local p1    # "sessionCase":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Landroid/javax/sip/InvalidArgumentException;
    invoke-virtual {v0}, Landroid/javax/sip/InvalidArgumentException;->printStackTrace()V

    .line 114
    .end local v0    # "e":Landroid/javax/sip/InvalidArgumentException;
    goto :goto_2

    .line 103
    :cond_1
    :goto_0
    :try_start_1
    const-string/jumbo v0, "sescase"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->setParameter(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 104
    :catch_1
    move-exception v0

    .line 105
    .local v0, "e":Ljava/text/ParseException;
    invoke-virtual {v0}, Ljava/text/ParseException;->printStackTrace()V

    .line 106
    .end local v0    # "e":Ljava/text/ParseException;
    :goto_1
    nop

    .line 123
    :goto_2
    return-void

    .line 120
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "sess-case Parameter value is null"

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

    .line 144
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
