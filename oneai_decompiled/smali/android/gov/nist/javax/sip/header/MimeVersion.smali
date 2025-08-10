.class public Landroid/gov/nist/javax/sip/header/MimeVersion;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "MimeVersion.java"

# interfaces
.implements Landroid/javax/sip/header/MimeVersionHeader;


# static fields
.field private static final serialVersionUID:J = -0x6e59b8a2cb581754L


# instance fields
.field protected majorVersion:I

.field protected minorVersion:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 66
    const-string v0, "MIME-Version"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 67
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 124
    iget v0, p0, Landroid/gov/nist/javax/sip/header/MimeVersion;->majorVersion:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/header/MimeVersion;->minorVersion:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getMajorVersion()I
    .locals 1

    .line 84
    iget v0, p0, Landroid/gov/nist/javax/sip/header/MimeVersion;->majorVersion:I

    return v0
.end method

.method public getMinorVersion()I
    .locals 1

    .line 75
    iget v0, p0, Landroid/gov/nist/javax/sip/header/MimeVersion;->minorVersion:I

    return v0
.end method

.method public setMajorVersion(I)V
    .locals 2
    .param p1, "majorVersion"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 112
    if-ltz p1, :cond_0

    .line 116
    iput p1, p0, Landroid/gov/nist/javax/sip/header/MimeVersion;->majorVersion:I

    .line 117
    return-void

    .line 113
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, MimeVersion, setMajorVersion(), the majorVersion parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMinorVersion(I)V
    .locals 2
    .param p1, "minorVersion"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 96
    if-ltz p1, :cond_0

    .line 100
    iput p1, p0, Landroid/gov/nist/javax/sip/header/MimeVersion;->minorVersion:I

    .line 101
    return-void

    .line 97
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, MimeVersion, setMinorVersion(), the minorVersion parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
