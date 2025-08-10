.class public Landroid/gov/nist/javax/sdp/fields/SessionNameField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "SessionNameField.java"

# interfaces
.implements Landroid/javax/sdp/SessionName;


# instance fields
.field protected sessionName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    const-string/jumbo v0, "s="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 2

    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "s="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/SessionNameField;->sessionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSessionName()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SessionNameField;->sessionName:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/SessionNameField;->getSessionName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setSessionName(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .line 46
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/SessionNameField;->sessionName:Ljava/lang/String;

    .line 47
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

    .line 62
    if-eqz p1, :cond_0

    .line 65
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/SessionNameField;->setSessionName(Ljava/lang/String;)V

    .line 67
    return-void

    .line 63
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The value is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
