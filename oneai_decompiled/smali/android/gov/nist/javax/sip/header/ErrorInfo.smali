.class public final Landroid/gov/nist/javax/sip/header/ErrorInfo;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "ErrorInfo.java"

# interfaces
.implements Landroid/javax/sip/header/ErrorInfoHeader;


# static fields
.field private static final serialVersionUID:J = -0x58179228634e738aL


# instance fields
.field protected errorInfo:Landroid/gov/nist/javax/sip/address/GenericURI;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 61
    const-string v0, "Error-Info"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/address/GenericURI;)V
    .locals 0
    .param p1, "errorInfo"    # Landroid/gov/nist/javax/sip/address/GenericURI;

    .line 69
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/ErrorInfo;-><init>()V

    .line 70
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ErrorInfo;->errorInfo:Landroid/gov/nist/javax/sip/address/GenericURI;

    .line 71
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 136
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ErrorInfo;

    .line 137
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ErrorInfo;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ErrorInfo;->errorInfo:Landroid/gov/nist/javax/sip/address/GenericURI;

    if-eqz v1, :cond_0

    .line 138
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ErrorInfo;->errorInfo:Landroid/gov/nist/javax/sip/address/GenericURI;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/GenericURI;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/address/GenericURI;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/ErrorInfo;->errorInfo:Landroid/gov/nist/javax/sip/address/GenericURI;

    .line 139
    :cond_0
    return-object v0
.end method

.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 79
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ErrorInfo;->errorInfo:Landroid/gov/nist/javax/sip/address/GenericURI;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/GenericURI;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 81
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ErrorInfo;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 83
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ErrorInfo;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 86
    :cond_0
    return-object p1
.end method

.method public getErrorInfo()Landroid/javax/sip/address/URI;
    .locals 1

    .line 107
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ErrorInfo;->errorInfo:Landroid/gov/nist/javax/sip/address/GenericURI;

    return-object v0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 1

    .line 132
    const-string/jumbo v0, "message"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ErrorInfo;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setErrorInfo(Landroid/javax/sip/address/URI;)V
    .locals 1
    .param p1, "errorInfo"    # Landroid/javax/sip/address/URI;

    .line 96
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/address/GenericURI;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ErrorInfo;->errorInfo:Landroid/gov/nist/javax/sip/address/GenericURI;

    .line 98
    return-void
.end method

.method public setErrorMessage(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 119
    if-eqz p1, :cond_0

    .line 123
    const-string/jumbo v0, "message"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ErrorInfo;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    return-void

    .line 120
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception , ErrorInfoHeader, setErrorMessage(), the message parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
