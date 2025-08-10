.class public Landroid/gov/nist/javax/sdp/fields/MediaField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "MediaField.java"

# interfaces
.implements Landroid/javax/sdp/Media;


# instance fields
.field protected formats:Ljava/util/Vector;

.field protected media:Ljava/lang/String;

.field protected nports:I

.field protected port:I

.field protected proto:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 51
    const-string/jumbo v0, "m="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 52
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    .line 53
    return-void
.end method

.method private encodeFormats()Ljava/lang/String;
    .locals 3

    .line 205
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x3

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 206
    .local v0, "retval":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 207
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 208
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_0

    .line 209
    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 211
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 239
    invoke-super {p0}, Landroid/gov/nist/javax/sdp/fields/SDPField;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/MediaField;

    .line 240
    .local v0, "retval":Landroid/gov/nist/javax/sdp/fields/MediaField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    if-eqz v1, :cond_0

    .line 241
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Vector;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    .line 242
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 4

    .line 220
    const-string/jumbo v0, "m="

    .line 221
    .local v0, "encoded_string":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->media:Ljava/lang/String;

    const-string v2, " "

    if-eqz v1, :cond_0

    .line 222
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->media:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->port:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 225
    :cond_0
    iget v1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->nports:I

    const/4 v3, 0x1

    if-le v1, v3, :cond_1

    .line 226
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->nports:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 228
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->proto:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 229
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->proto:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 231
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    if-eqz v1, :cond_3

    .line 232
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/fields/MediaField;->encodeFormats()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 234
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 235
    return-object v0
.end method

.method public getFormats()Ljava/util/Vector;
    .locals 1

    .line 68
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    return-object v0
.end method

.method public getMedia()Ljava/lang/String;
    .locals 1

    .line 56
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->media:Ljava/lang/String;

    return-object v0
.end method

.method public getMediaFormats(Z)Ljava/util/Vector;
    .locals 1
    .param p1, "create"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 186
    if-nez p1, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 187
    const/4 v0, 0x0

    return-object v0

    .line 189
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    return-object v0
.end method

.method public getMediaPort()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 125
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getPort()I

    move-result v0

    return v0
.end method

.method public getMediaType()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 106
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getMedia()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNports()I
    .locals 1

    .line 62
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->nports:I

    return v0
.end method

.method public getPort()I
    .locals 1

    .line 59
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->port:I

    return v0
.end method

.method public getPortCount()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 144
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getNports()I

    move-result v0

    return v0
.end method

.method public getProto()Ljava/lang/String;
    .locals 1

    .line 65
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->proto:Ljava/lang/String;

    return-object v0
.end method

.method public getProtocol()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 163
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getProto()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setFormats(Ljava/util/Vector;)V
    .locals 0
    .param p1, "formats"    # Ljava/util/Vector;

    .line 98
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    .line 99
    return-void
.end method

.method public setMedia(Ljava/lang/String;)V
    .locals 0
    .param p1, "m"    # Ljava/lang/String;

    .line 74
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->media:Ljava/lang/String;

    .line 75
    return-void
.end method

.method public setMediaFormats(Ljava/util/Vector;)V
    .locals 2
    .param p1, "mediaFormats"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 199
    if-eqz p1, :cond_0

    .line 201
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->formats:Ljava/util/Vector;

    .line 202
    return-void

    .line 200
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The mediaFormats is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMediaPort(I)V
    .locals 2
    .param p1, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 133
    if-ltz p1, :cond_0

    .line 136
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setPort(I)V

    .line 137
    return-void

    .line 134
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The port is < 0"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMediaType(Ljava/lang/String;)V
    .locals 2
    .param p1, "mediaType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 114
    if-eqz p1, :cond_0

    .line 117
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMedia(Ljava/lang/String;)V

    .line 118
    return-void

    .line 115
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The mediaType is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setNports(I)V
    .locals 0
    .param p1, "n"    # I

    .line 86
    iput p1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->nports:I

    .line 87
    return-void
.end method

.method public setPort(I)V
    .locals 0
    .param p1, "p"    # I

    .line 80
    iput p1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->port:I

    .line 81
    return-void
.end method

.method public setPortCount(I)V
    .locals 2
    .param p1, "portCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 152
    if-ltz p1, :cond_0

    .line 155
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setNports(I)V

    .line 156
    return-void

    .line 153
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The port count is < 0"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setProto(Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Ljava/lang/String;

    .line 92
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/MediaField;->proto:Ljava/lang/String;

    .line 93
    return-void
.end method

.method public setProtocol(Ljava/lang/String;)V
    .locals 2
    .param p1, "protocol"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 171
    if-eqz p1, :cond_0

    .line 174
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setProto(Ljava/lang/String;)V

    .line 175
    return-void

    .line 172
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The protocol is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
