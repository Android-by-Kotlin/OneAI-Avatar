.class public Landroid/gov/nist/javax/sip/header/ContentType;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "ContentType.java"

# interfaces
.implements Landroid/javax/sip/header/ContentTypeHeader;


# static fields
.field private static final serialVersionUID:J = 0x759fac0f0cc76fd2L


# instance fields
.field protected mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 79
    const-string v0, "Content-Type"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "contentType"    # Ljava/lang/String;
    .param p2, "contentSubtype"    # Ljava/lang/String;

    .line 87
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/ContentType;-><init>()V

    .line 88
    invoke-virtual {p0, p1, p2}, Landroid/gov/nist/javax/sip/header/ContentType;->setContentType(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 206
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ContentType;

    .line 207
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ContentType;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-eqz v1, :cond_0

    .line 208
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/MediaRange;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/MediaRange;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    .line 209
    :cond_0
    return-object v0
.end method

.method public compareMediaRange(Ljava/lang/String;)I
    .locals 2
    .param p1, "media"    # Ljava/lang/String;

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/header/MediaRange;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/header/MediaRange;->subtype:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public encodeBody()Ljava/lang/String;
    .locals 1

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ContentType;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 110
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/MediaRange;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 111
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ContentType;->hasParameters()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 115
    :cond_0
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 213
    instance-of v0, p1, Landroid/javax/sip/header/ContentTypeHeader;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 214
    move-object v0, p1

    check-cast v0, Landroid/javax/sip/header/ContentTypeHeader;

    .line 215
    .local v0, "o":Landroid/javax/sip/header/ContentTypeHeader;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ContentType;->getContentType()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Landroid/javax/sip/header/ContentTypeHeader;->getContentType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ContentType;->getContentSubType()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Landroid/javax/sip/header/ContentTypeHeader;->getContentSubType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ContentType;->equalParameters(Landroid/javax/sip/header/Parameters;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 219
    .end local v0    # "o":Landroid/javax/sip/header/ContentTypeHeader;
    :cond_1
    return v1
.end method

.method public getCharset()Ljava/lang/String;
    .locals 1

    .line 157
    const-string/jumbo v0, "charset"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ContentType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentSubType()Ljava/lang/String;
    .locals 1

    .line 143
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/MediaRange;->getSubtype()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .line 151
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/MediaRange;->getType()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getMediaRange()Landroid/gov/nist/javax/sip/header/MediaRange;
    .locals 1

    .line 122
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    return-object v0
.end method

.method public getMediaSubType()Ljava/lang/String;
    .locals 1

    .line 136
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/header/MediaRange;->subtype:Ljava/lang/String;

    return-object v0
.end method

.method public getMediaType()Ljava/lang/String;
    .locals 1

    .line 129
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/header/MediaRange;->type:Ljava/lang/String;

    return-object v0
.end method

.method public setContentSubType(Ljava/lang/String;)V
    .locals 2
    .param p1, "contentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 198
    if-eqz p1, :cond_1

    .line 200
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-nez v0, :cond_0

    .line 201
    new-instance v0, Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/MediaRange;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    .line 202
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/MediaRange;->setSubtype(Ljava/lang/String;)V

    .line 203
    return-void

    .line 199
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 2
    .param p1, "contentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 186
    if-eqz p1, :cond_1

    .line 188
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-nez v0, :cond_0

    .line 189
    new-instance v0, Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/MediaRange;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    .line 190
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/MediaRange;->setType(Ljava/lang/String;)V

    .line 192
    return-void

    .line 187
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContentType(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "contentType"    # Ljava/lang/String;
    .param p2, "contentSubType"    # Ljava/lang/String;

    .line 174
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-nez v0, :cond_0

    .line 175
    new-instance v0, Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/MediaRange;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    .line 176
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/MediaRange;->setType(Ljava/lang/String;)V

    .line 177
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/MediaRange;->setSubtype(Ljava/lang/String;)V

    .line 178
    return-void
.end method

.method public setMediaRange(Landroid/gov/nist/javax/sip/header/MediaRange;)V
    .locals 0
    .param p1, "m"    # Landroid/gov/nist/javax/sip/header/MediaRange;

    .line 165
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ContentType;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    .line 166
    return-void
.end method
