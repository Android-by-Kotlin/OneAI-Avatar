.class public Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "PMediaAuthorization.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationHeader;
.implements Landroid/gov/nist/javax/sip/header/ims/SIPHeaderNamesIms;
.implements Landroid/javax/sip/header/ExtensionHeader;


# static fields
.field private static final serialVersionUID:J = -0x59b36d79798089bdL


# instance fields
.field private token:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 80
    const-string/jumbo v0, "P-Media-Authorization"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 81
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 137
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;

    .line 138
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;->token:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 139
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;->token:Ljava/lang/String;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;->token:Ljava/lang/String;

    .line 140
    :cond_0
    return-object v0
.end method

.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "encoding"    # Ljava/lang/StringBuilder;

    .line 114
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;->token:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "other"    # Ljava/lang/Object;

    .line 126
    instance-of v0, p1, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationHeader;

    if-eqz v0, :cond_0

    .line 128
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationHeader;

    .line 129
    .local v0, "o":Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationHeader;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationHeader;->getToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 131
    .end local v0    # "o":Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationHeader;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    .line 91
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;->token:Ljava/lang/String;

    return-object v0
.end method

.method public setMediaAuthorizationToken(Ljava/lang/String;)V
    .locals 2
    .param p1, "token"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 103
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;->token:Ljava/lang/String;

    .line 107
    return-void

    .line 104
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, " the Media-Authorization-Token parameter is null or empty"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

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

    .line 119
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
