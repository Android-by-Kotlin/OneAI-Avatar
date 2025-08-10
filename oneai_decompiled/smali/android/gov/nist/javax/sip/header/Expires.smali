.class public Landroid/gov/nist/javax/sip/header/Expires;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "Expires.java"

# interfaces
.implements Landroid/javax/sip/header/ExpiresHeader;


# static fields
.field private static final serialVersionUID:J = 0x2b7f6e1819e3cbcbL


# instance fields
.field protected expires:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    const-string v0, "Expires"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 60
    return-void
.end method


# virtual methods
.method public encodeBody()Ljava/lang/String;
    .locals 1

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Expires;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 71
    iget v0, p0, Landroid/gov/nist/javax/sip/header/Expires;->expires:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getExpires()I
    .locals 1

    .line 86
    iget v0, p0, Landroid/gov/nist/javax/sip/header/Expires;->expires:I

    return v0
.end method

.method public setExpires(I)V
    .locals 3
    .param p1, "expires"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 101
    if-ltz p1, :cond_0

    .line 103
    iput p1, p0, Landroid/gov/nist/javax/sip/header/Expires;->expires:I

    .line 104
    return-void

    .line 102
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad argument "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
