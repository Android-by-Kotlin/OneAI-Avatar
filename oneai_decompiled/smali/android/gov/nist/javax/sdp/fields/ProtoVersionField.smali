.class public Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "ProtoVersionField.java"

# interfaces
.implements Landroid/javax/sdp/Version;


# instance fields
.field protected protoVersion:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    const-string/jumbo v0, "v="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 49
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 2

    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "v="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;->protoVersion:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProtoVersion()I
    .locals 1

    .line 52
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;->protoVersion:I

    return v0
.end method

.method public getVersion()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 67
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;->getProtoVersion()I

    move-result v0

    return v0
.end method

.method public setProtoVersion(I)V
    .locals 0
    .param p1, "pv"    # I

    .line 59
    iput p1, p0, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;->protoVersion:I

    .line 60
    return-void
.end method

.method public setVersion(I)V
    .locals 2
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 75
    if-ltz p1, :cond_0

    .line 78
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;->setProtoVersion(I)V

    .line 79
    return-void

    .line 76
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The value is <0"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
