.class public Landroid/gov/nist/javax/sip/header/extensions/References;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "References.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/extensions/ReferencesHeader;
.implements Landroid/javax/sip/header/ExtensionHeader;


# static fields
.field private static final serialVersionUID:J = 0x7679616b0985b236L


# instance fields
.field private callId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 19
    const-string/jumbo v0, "References"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 20
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/References;->callId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0

    .line 79
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/References;->callId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 80
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 81
    return-object p1
.end method

.method public getCallId()Ljava/lang/String;
    .locals 1

    .line 26
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/References;->callId:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 71
    const-string/jumbo v0, "References"

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 51
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParameterNames()Ljava/util/Iterator;
    .locals 1

    .line 56
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterNames()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getRel()Ljava/lang/String;
    .locals 1

    .line 32
    const-string/jumbo v0, "rel"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/extensions/References;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removeParameter(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 61
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->removeParameter(Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method public setCallId(Ljava/lang/String;)V
    .locals 0
    .param p1, "callId"    # Ljava/lang/String;

    .line 39
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/extensions/References;->callId:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 66
    invoke-super {p0, p1, p2}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method public setRel(Ljava/lang/String;)V
    .locals 1
    .param p1, "rel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 44
    if-eqz p1, :cond_0

    .line 45
    const-string/jumbo v0, "rel"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/extensions/References;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    :cond_0
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

    .line 87
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "operation not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
