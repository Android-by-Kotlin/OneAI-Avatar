.class public abstract Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "SecurityAgree.java"


# instance fields
.field private secMechanism:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 86
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>()V

    .line 87
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string v1, ";"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->setSeparator(Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 77
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string v1, ";"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->setSeparator(Ljava/lang/String;)V

    .line 79
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 360
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;

    .line 361
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->secMechanism:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 362
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->secMechanism:Ljava/lang/String;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->secMechanism:Ljava/lang/String;

    .line 363
    :cond_0
    return-object v0
.end method

.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 121
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->secMechanism:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 348
    instance-of v0, p1, Landroid/gov/nist/javax/sip/header/ims/SecurityAgreeHeader;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 350
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/SecurityAgreeHeader;

    .line 351
    .local v0, "o":Landroid/gov/nist/javax/sip/header/ims/SecurityAgreeHeader;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->getSecurityMechanism()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgreeHeader;->getSecurityMechanism()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->equalParameters(Landroid/javax/sip/header/Parameters;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 354
    .end local v0    # "o":Landroid/gov/nist/javax/sip/header/ims/SecurityAgreeHeader;
    :cond_1
    return v1
.end method

.method public getAlgorithm()Ljava/lang/String;
    .locals 1

    .line 285
    const-string/jumbo v0, "alg"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEncryptionAlgorithm()Ljava/lang/String;
    .locals 1

    .line 277
    const-string/jumbo v0, "ealg"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMode()Ljava/lang/String;
    .locals 1

    .line 301
    const-string/jumbo v0, "mod"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPortClient()I
    .locals 1

    .line 325
    const-string/jumbo v0, "port-c"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getPortServer()I
    .locals 1

    .line 333
    const-string/jumbo v0, "port-s"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getPreference()F
    .locals 1

    .line 341
    const-string/jumbo v0, "q"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public getProtocol()Ljava/lang/String;
    .locals 1

    .line 293
    const-string/jumbo v0, "prot"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSPIClient()I
    .locals 1

    .line 309
    const-string/jumbo v0, "spi-c"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getSPIServer()I
    .locals 1

    .line 317
    const-string/jumbo v0, "spi-s"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getSecurityMechanism()Ljava/lang/String;
    .locals 1

    .line 270
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->secMechanism:Ljava/lang/String;

    return-object v0
.end method

.method public setAlgorithm(Ljava/lang/String;)V
    .locals 2
    .param p1, "alg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 160
    if-eqz p1, :cond_0

    .line 164
    const-string/jumbo v0, "alg"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    return-void

    .line 161
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, SecurityClient, setAlgorithm(), the algorithm parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setEncryptionAlgorithm(Ljava/lang/String;)V
    .locals 2
    .param p1, "ealg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 146
    if-eqz p1, :cond_0

    .line 151
    const-string/jumbo v0, "ealg"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    return-void

    .line 147
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, SecurityClient, setEncryptionAlgorithm(), the encryption-algorithm parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMode(Ljava/lang/String;)V
    .locals 2
    .param p1, "mod"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 186
    if-eqz p1, :cond_0

    .line 190
    const-string/jumbo v0, "mod"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    return-void

    .line 187
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, SecurityClient, setMode(), the mode parameter is null"

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

    .line 93
    if-eqz p2, :cond_3

    .line 96
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 97
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    if-nez v0, :cond_2

    .line 99
    new-instance v1, Landroid/gov/nist/core/NameValue;

    invoke-direct {v1, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, v1

    .line 102
    const-string/jumbo v1, "d-ver"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 104
    invoke-virtual {v0}, Landroid/gov/nist/core/NameValue;->setQuotedValue()V

    .line 106
    const-string v1, "\""

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 107
    :cond_0
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

    .line 111
    :cond_1
    :goto_0
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->setParameter(Landroid/gov/nist/core/NameValue;)V

    goto :goto_1

    .line 115
    :cond_2
    invoke-virtual {v0, p2}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    .line 118
    :goto_1
    return-void

    .line 94
    .end local v0    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null value"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPortClient(I)V
    .locals 2
    .param p1, "portC"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 225
    if-ltz p1, :cond_0

    .line 229
    const-string/jumbo v0, "port-c"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->setParameter(Ljava/lang/String;I)V

    .line 230
    return-void

    .line 226
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, SecurityClient, setPortClient(), the port-c parameter is <0"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPortServer(I)V
    .locals 2
    .param p1, "portS"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 238
    if-ltz p1, :cond_0

    .line 242
    const-string/jumbo v0, "port-s"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->setParameter(Ljava/lang/String;I)V

    .line 243
    return-void

    .line 239
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, SecurityClient, setPortServer(), the port-s parameter is <0"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPreference(F)V
    .locals 2
    .param p1, "q"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 254
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    .line 258
    const-string/jumbo v0, "q"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->setParameter(Ljava/lang/String;F)V

    .line 259
    return-void

    .line 255
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, SecurityClient, setPreference(), the preference (q) parameter is <0"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setProtocol(Ljava/lang/String;)V
    .locals 2
    .param p1, "prot"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 173
    if-eqz p1, :cond_0

    .line 177
    const-string/jumbo v0, "prot"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    return-void

    .line 174
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, SecurityClient, setProtocol(), the protocol parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSPIClient(I)V
    .locals 2
    .param p1, "spic"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 199
    if-ltz p1, :cond_0

    .line 203
    const-string/jumbo v0, "spi-c"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->setParameter(Ljava/lang/String;I)V

    .line 204
    return-void

    .line 200
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, SecurityClient, setSPIClient(), the spi-c parameter is <0"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSPIServer(I)V
    .locals 2
    .param p1, "spis"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 212
    if-ltz p1, :cond_0

    .line 216
    const-string/jumbo v0, "spi-s"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->setParameter(Ljava/lang/String;I)V

    .line 217
    return-void

    .line 213
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, SecurityClient, setSPIServer(), the spi-s parameter is <0"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSecurityMechanism(Ljava/lang/String;)V
    .locals 2
    .param p1, "secMech"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 133
    if-eqz p1, :cond_0

    .line 137
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;->secMechanism:Ljava/lang/String;

    .line 138
    return-void

    .line 134
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, SecurityAgree, setSecurityMechanism(), the sec-mechanism parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
