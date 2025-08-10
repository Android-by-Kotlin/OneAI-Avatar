.class public Landroid/gov/nist/javax/sip/header/ims/PChargingVector;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "PChargingVector.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/ims/PChargingVectorHeader;
.implements Landroid/gov/nist/javax/sip/header/ims/SIPHeaderNamesIms;
.implements Landroid/javax/sip/header/ExtensionHeader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 54
    const-string/jumbo v0, "P-Charging-Vector"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 55
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 3
    .param p1, "encoding"    # Ljava/lang/StringBuilder;

    .line 74
    const-string/jumbo v0, "icid-value"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 75
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    if-eqz v0, :cond_0

    .line 76
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 79
    :cond_0
    :try_start_0
    new-instance v1, Landroid/javax/sip/SipException;

    const-string/jumbo v2, "icid-value is mandatory"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v0    # "nv":Landroid/gov/nist/core/NameValue;
    .end local p1    # "encoding":Ljava/lang/StringBuilder;
    throw v1
    :try_end_0
    .catch Landroid/javax/sip/SipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .restart local v0    # "nv":Landroid/gov/nist/core/NameValue;
    .restart local p1    # "encoding":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v1

    .line 81
    .local v1, "e":Landroid/javax/sip/SipException;
    invoke-virtual {v1}, Landroid/javax/sip/SipException;->printStackTrace()V

    .line 85
    .end local v1    # "e":Landroid/javax/sip/SipException;
    :goto_0
    return-object p1
.end method

.method public getICID()Ljava/lang/String;
    .locals 1

    .line 97
    const-string/jumbo v0, "icid-value"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getICIDGeneratedAt()Ljava/lang/String;
    .locals 1

    .line 129
    const-string/jumbo v0, "icid-generated-at"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOriginatingIOI()Ljava/lang/String;
    .locals 1

    .line 162
    const-string/jumbo v0, "orig-ioi"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTerminatingIOI()Ljava/lang/String;
    .locals 1

    .line 193
    const-string/jumbo v0, "term-ioi"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setICID(Ljava/lang/String;)V
    .locals 2
    .param p1, "icid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 111
    if-eqz p1, :cond_0

    .line 116
    const-string/jumbo v0, "icid-value"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    return-void

    .line 112
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, P-Charging-Vector, setICID(), the icid parameter is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setICIDGeneratedAt(Ljava/lang/String;)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 144
    if-eqz p1, :cond_0

    .line 149
    const-string/jumbo v0, "icid-generated-at"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    return-void

    .line 145
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, P-Charging-Vector, setICIDGeneratedAt(), the host parameter is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOriginatingIOI(Ljava/lang/String;)V
    .locals 2
    .param p1, "origIOI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 177
    const-string/jumbo v0, "orig-ioi"

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 180
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 178
    :cond_1
    :goto_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->removeParameter(Ljava/lang/String;)V

    .line 182
    :goto_1
    return-void
.end method

.method public setTerminatingIOI(Ljava/lang/String;)V
    .locals 2
    .param p1, "termIOI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 208
    const-string/jumbo v0, "term-ioi"

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 211
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 209
    :cond_1
    :goto_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->removeParameter(Ljava/lang/String;)V

    .line 213
    :goto_1
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 216
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
