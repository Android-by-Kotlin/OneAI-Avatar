.class public abstract Landroid/gov/nist/javax/sip/header/SIPHeader;
.super Landroid/gov/nist/javax/sip/header/SIPObject;
.source "SIPHeader.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/SIPHeaderNames;
.implements Landroid/javax/sip/header/Header;
.implements Landroid/gov/nist/javax/sip/header/HeaderExt;


# instance fields
.field protected headerName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;-><init>()V

    .line 60
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "hname"    # Ljava/lang/String;

    .line 53
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;-><init>()V

    .line 54
    invoke-virtual {p1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeader;->headerName:Ljava/lang/String;

    .line 55
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 1

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 110
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeader;->headerName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeader;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 112
    const-string v0, "\r\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    return-object p1
.end method

.method protected abstract encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
.end method

.method public getHeaderName()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeader;->headerName:Ljava/lang/String;

    return-object v0
.end method

.method public getHeaderValue()Ljava/lang/String;
    .locals 1

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeader;->headerName:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 132
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getHeaderValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 140
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeader;->headerName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isHeaderList()Z
    .locals 1

    .line 100
    const/4 v0, 0x0

    return v0
.end method

.method public setHeaderName(Ljava/lang/String;)V
    .locals 0
    .param p1, "hdrname"    # Ljava/lang/String;

    .line 84
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/SIPHeader;->headerName:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 144
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
