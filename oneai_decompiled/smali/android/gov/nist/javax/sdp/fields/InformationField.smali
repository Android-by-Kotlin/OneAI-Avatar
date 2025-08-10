.class public Landroid/gov/nist/javax/sdp/fields/InformationField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "InformationField.java"

# interfaces
.implements Landroid/javax/sdp/Info;


# instance fields
.field protected information:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 44
    const-string/jumbo v0, "i="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 45
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 2

    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "i="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/InformationField;->information:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInformation()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/InformationField;->information:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 68
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/InformationField;->information:Ljava/lang/String;

    return-object v0
.end method

.method public setInformation(Ljava/lang/String;)V
    .locals 0
    .param p1, "info"    # Ljava/lang/String;

    .line 52
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/InformationField;->information:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 76
    if-eqz p1, :cond_0

    .line 79
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/InformationField;->setInformation(Ljava/lang/String;)V

    .line 81
    return-void

    .line 77
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The value is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
