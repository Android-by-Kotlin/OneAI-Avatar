.class public final Landroid/gov/nist/javax/sip/header/ContentDisposition;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "ContentDisposition.java"

# interfaces
.implements Landroid/javax/sip/header/ContentDispositionHeader;


# static fields
.field private static final serialVersionUID:J = 0xb98a29610197d1bL


# instance fields
.field protected dispositionType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 58
    const-string v0, "Content-Disposition"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 59
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "encoding"    # Ljava/lang/StringBuilder;

    .line 68
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentDisposition;->dispositionType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentDisposition;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ContentDisposition;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1}, Landroid/gov/nist/core/NameValueList;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    :cond_0
    return-object p1
.end method

.method public getContentDisposition()Ljava/lang/String;
    .locals 1

    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ContentDisposition;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDispositionType()Ljava/lang/String;
    .locals 1

    .line 93
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentDisposition;->dispositionType:Ljava/lang/String;

    return-object v0
.end method

.method public getHandling()Ljava/lang/String;
    .locals 1

    .line 101
    const-string/jumbo v0, "handling"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ContentDisposition;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setDispositionType(Ljava/lang/String;)V
    .locals 2
    .param p1, "dispositionType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 81
    if-eqz p1, :cond_0

    .line 85
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ContentDisposition;->dispositionType:Ljava/lang/String;

    .line 86
    return-void

    .line 82
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, ContentDisposition, setDispositionType(), the dispositionType parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setHandling(Ljava/lang/String;)V
    .locals 2
    .param p1, "handling"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 108
    if-eqz p1, :cond_0

    .line 112
    const-string/jumbo v0, "handling"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ContentDisposition;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    return-void

    .line 109
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, ContentDisposition, setHandling(), the handling parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
