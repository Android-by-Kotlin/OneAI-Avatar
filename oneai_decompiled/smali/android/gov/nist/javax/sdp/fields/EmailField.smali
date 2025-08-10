.class public Landroid/gov/nist/javax/sdp/fields/EmailField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "EmailField.java"

# interfaces
.implements Landroid/javax/sdp/EMail;


# instance fields
.field protected emailAddress:Landroid/gov/nist/javax/sdp/fields/EmailAddress;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 47
    const-string/jumbo v0, "e="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 48
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/EmailAddress;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/EmailField;->emailAddress:Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    .line 49
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 99
    invoke-super {p0}, Landroid/gov/nist/javax/sdp/fields/SDPField;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/EmailField;

    .line 100
    .local v0, "retval":Landroid/gov/nist/javax/sdp/fields/EmailField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/EmailField;->emailAddress:Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    if-eqz v1, :cond_0

    .line 101
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/EmailField;->emailAddress:Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/EmailField;->emailAddress:Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    .line 102
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 2

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "e="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/EmailField;->emailAddress:Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEmailAddress()Landroid/gov/nist/javax/sdp/fields/EmailAddress;
    .locals 1

    .line 52
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/EmailField;->emailAddress:Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/EmailField;->emailAddress:Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    if-nez v0, :cond_0

    .line 79
    const/4 v0, 0x0

    return-object v0

    .line 81
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/EmailField;->emailAddress:Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setEmailAddress(Landroid/gov/nist/javax/sdp/fields/EmailAddress;)V
    .locals 0
    .param p1, "emailAddress"    # Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    .line 58
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/EmailField;->emailAddress:Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    .line 59
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

    .line 90
    if-eqz p1, :cond_0

    .line 94
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/EmailField;->emailAddress:Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->setDisplayName(Ljava/lang/String;)V

    .line 96
    return-void

    .line 91
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The value is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 70
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/EmailField;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
