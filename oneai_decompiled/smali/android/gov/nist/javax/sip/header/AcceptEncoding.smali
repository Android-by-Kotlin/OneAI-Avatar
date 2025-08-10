.class public final Landroid/gov/nist/javax/sip/header/AcceptEncoding;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "AcceptEncoding.java"

# interfaces
.implements Landroid/javax/sip/header/AcceptEncodingHeader;


# static fields
.field private static final serialVersionUID:J = -0x147eaca80a637035L


# instance fields
.field protected contentCoding:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 85
    const-string v0, "Accept-Encoding"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 86
    return-void
.end method


# virtual methods
.method protected encodeBody()Ljava/lang/String;
    .locals 1

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 98
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->contentCoding:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->contentCoding:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->parameters:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 102
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1}, Landroid/gov/nist/core/NameValueList;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    :cond_1
    return-object p1
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .line 122
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->contentCoding:Ljava/lang/String;

    return-object v0
.end method

.method public getQValue()F
    .locals 1

    .line 113
    const-string/jumbo v0, "q"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->getParameterAsFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 2
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 148
    if-eqz p1, :cond_0

    .line 150
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->contentCoding:Ljava/lang/String;

    .line 151
    return-void

    .line 149
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, " encoding parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setQValue(F)V
    .locals 4
    .param p1, "q"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 132
    float-to-double v0, p1

    const-wide/16 v2, 0x0

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_0

    float-to-double v0, p1

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpl-double v0, v0, v2

    if-gtz v0, :cond_0

    .line 134
    const-string/jumbo v0, "q"

    invoke-super {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->setParameter(Ljava/lang/String;F)V

    .line 135
    return-void

    .line 133
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "qvalue out of range!"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
