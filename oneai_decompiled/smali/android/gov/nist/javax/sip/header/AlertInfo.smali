.class public final Landroid/gov/nist/javax/sip/header/AlertInfo;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "AlertInfo.java"

# interfaces
.implements Landroid/javax/sip/header/AlertInfoHeader;


# static fields
.field private static final serialVersionUID:J = 0x39ba1254fc6b29efL


# instance fields
.field protected string:Ljava/lang/String;

.field protected uri:Landroid/gov/nist/javax/sip/address/GenericURI;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 63
    const-string v0, "Alert-Info"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 64
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 121
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/AlertInfo;

    .line 122
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/AlertInfo;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    if-eqz v1, :cond_0

    .line 123
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/GenericURI;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/address/GenericURI;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/AlertInfo;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    goto :goto_0

    .line 124
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->string:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 125
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->string:Ljava/lang/String;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/AlertInfo;->string:Ljava/lang/String;

    .line 127
    :cond_1
    :goto_0
    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "encoding"    # Ljava/lang/StringBuilder;

    .line 73
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    if-eqz v0, :cond_0

    .line 74
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/GenericURI;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 75
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->string:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->string:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    :cond_1
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 79
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1}, Landroid/gov/nist/core/NameValueList;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    :cond_2
    return-object p1
.end method

.method public getAlertInfo()Landroid/javax/sip/address/URI;
    .locals 3

    .line 105
    const/4 v0, 0x0

    .line 107
    .local v0, "alertInfoUri":Landroid/javax/sip/address/URI;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    if-eqz v1, :cond_0

    .line 108
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    goto :goto_0

    .line 111
    :cond_0
    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sip/address/GenericURI;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->string:Ljava/lang/String;

    invoke-direct {v1, v2}, Landroid/gov/nist/javax/sip/address/GenericURI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 114
    goto :goto_0

    .line 112
    :catch_0
    move-exception v1

    .line 117
    :goto_0
    return-object v0
.end method

.method public setAlertInfo(Landroid/javax/sip/address/URI;)V
    .locals 1
    .param p1, "uri"    # Landroid/javax/sip/address/URI;

    .line 89
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/address/GenericURI;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    .line 90
    return-void
.end method

.method public setAlertInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "string"    # Ljava/lang/String;

    .line 97
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/AlertInfo;->string:Ljava/lang/String;

    .line 98
    return-void
.end method
