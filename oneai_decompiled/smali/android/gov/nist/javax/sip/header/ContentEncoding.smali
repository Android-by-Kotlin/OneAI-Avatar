.class public Landroid/gov/nist/javax/sip/header/ContentEncoding;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "ContentEncoding.java"

# interfaces
.implements Landroid/javax/sip/header/ContentEncodingHeader;


# static fields
.field private static final serialVersionUID:J = 0x1c3b09a8a2de85c9L


# instance fields
.field protected contentEncoding:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 97
    const-string v0, "Content-Encoding"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 98
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "enc"    # Ljava/lang/String;

    .line 105
    const-string v0, "Content-Encoding"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 106
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ContentEncoding;->contentEncoding:Ljava/lang/String;

    .line 107
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 114
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentEncoding;->contentEncoding:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .line 122
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentEncoding;->contentEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 2
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 130
    if-eqz p1, :cond_0

    .line 133
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ContentEncoding;->contentEncoding:Ljava/lang/String;

    .line 134
    return-void

    .line 131
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception,  encoding is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
