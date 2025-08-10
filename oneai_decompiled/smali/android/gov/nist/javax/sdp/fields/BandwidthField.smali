.class public Landroid/gov/nist/javax/sdp/fields/BandwidthField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "BandwidthField.java"

# interfaces
.implements Landroid/javax/sdp/BandWidth;


# instance fields
.field protected bandwidth:I

.field protected bwtype:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    const-string/jumbo v0, "b="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 49
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 3

    .line 74
    const-string/jumbo v0, "b="

    .line 76
    .local v0, "encoded_string":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->bwtype:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 77
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->bwtype:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 78
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->bandwidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getBandwidth()I
    .locals 1

    .line 54
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->bandwidth:I

    return v0
.end method

.method public getBwtype()Ljava/lang/String;
    .locals 1

    .line 51
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->bwtype:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 86
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->getBwtype()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 105
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->getBandwidth()I

    move-result v0

    return v0
.end method

.method public setBandwidth(I)V
    .locals 0
    .param p1, "b"    # I

    .line 66
    iput p1, p0, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->bandwidth:I

    .line 67
    return-void
.end method

.method public setBwtype(Ljava/lang/String;)V
    .locals 0
    .param p1, "b"    # Ljava/lang/String;

    .line 60
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->bwtype:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 94
    if-eqz p1, :cond_0

    .line 97
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->setBwtype(Ljava/lang/String;)V

    .line 98
    return-void

    .line 95
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The type is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setValue(I)V
    .locals 0
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 113
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->setBandwidth(I)V

    .line 114
    return-void
.end method
