.class public Landroid/gov/nist/javax/sdp/fields/PhoneField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "PhoneField.java"

# interfaces
.implements Landroid/javax/sdp/Phone;


# instance fields
.field protected name:Ljava/lang/String;

.field protected phoneNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    const-string/jumbo v0, "p="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 49
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 3

    .line 100
    const-string/jumbo v0, "p="

    .line 101
    .local v0, "encoded_string":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/PhoneField;->name:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/PhoneField;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 104
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/PhoneField;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 105
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/PhoneField;->name:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 108
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 109
    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 52
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PhoneField;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneNumber()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PhoneField;->phoneNumber:Ljava/lang/String;

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
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/PhoneField;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 63
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/PhoneField;->name:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setPhoneNumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "phoneNumber"    # Ljava/lang/String;

    .line 70
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/PhoneField;->phoneNumber:Ljava/lang/String;

    .line 71
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

    .line 86
    if-eqz p1, :cond_0

    .line 89
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sdp/fields/PhoneField;->setName(Ljava/lang/String;)V

    .line 90
    return-void

    .line 87
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The value parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
