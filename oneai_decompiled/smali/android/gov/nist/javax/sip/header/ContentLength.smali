.class public Landroid/gov/nist/javax/sip/header/ContentLength;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "ContentLength.java"

# interfaces
.implements Landroid/javax/sip/header/ContentLengthHeader;


# static fields
.field public static final NAME_LOWER:Ljava/lang/String;

.field private static final serialVersionUID:J = 0x1079bf82211cf963L


# instance fields
.field protected contentLength:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 84
    const-string v0, "Content-Length"

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/header/ContentLength;->NAME_LOWER:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 95
    const-string v0, "Content-Length"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 89
    const/4 v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/header/ContentLength;->contentLength:I

    .line 96
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "length"    # I

    .line 102
    const-string v0, "Content-Length"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 89
    const/4 v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/header/ContentLength;->contentLength:I

    .line 103
    iput p1, p0, Landroid/gov/nist/javax/sip/header/ContentLength;->contentLength:I

    .line 104
    return-void
.end method


# virtual methods
.method public encodeBody()Ljava/lang/String;
    .locals 1

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ContentLength;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 136
    iget v0, p0, Landroid/gov/nist/javax/sip/header/ContentLength;->contentLength:I

    if-gez v0, :cond_0

    .line 137
    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 139
    :cond_0
    iget v0, p0, Landroid/gov/nist/javax/sip/header/ContentLength;->contentLength:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    :goto_0
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 154
    instance-of v0, p1, Landroid/javax/sip/header/ContentLengthHeader;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 155
    move-object v0, p1

    check-cast v0, Landroid/javax/sip/header/ContentLengthHeader;

    .line 156
    .local v0, "o":Landroid/javax/sip/header/ContentLengthHeader;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ContentLength;->getContentLength()I

    move-result v2

    invoke-interface {v0}, Landroid/javax/sip/header/ContentLengthHeader;->getContentLength()I

    move-result v3

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 158
    .end local v0    # "o":Landroid/javax/sip/header/ContentLengthHeader;
    :cond_1
    return v1
.end method

.method public getContentLength()I
    .locals 1

    .line 111
    iget v0, p0, Landroid/gov/nist/javax/sip/header/ContentLength;->contentLength:I

    return v0
.end method

.method public match(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .line 147
    instance-of v0, p1, Landroid/gov/nist/javax/sip/header/ContentLength;

    if-eqz v0, :cond_0

    .line 148
    const/4 v0, 0x1

    return v0

    .line 150
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setContentLength(I)V
    .locals 2
    .param p1, "contentLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 120
    if-ltz p1, :cond_0

    .line 124
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/header/ContentLength;->contentLength:I

    .line 125
    return-void

    .line 121
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, ContentLength, setContentLength(), the contentLength parameter is <0"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
