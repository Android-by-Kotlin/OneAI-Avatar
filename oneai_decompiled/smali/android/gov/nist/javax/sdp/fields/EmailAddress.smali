.class public Landroid/gov/nist/javax/sdp/fields/EmailAddress;
.super Landroid/gov/nist/javax/sdp/fields/SDPObject;
.source "EmailAddress.java"


# instance fields
.field protected displayName:Ljava/lang/String;

.field protected email:Landroid/gov/nist/javax/sdp/fields/Email;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;-><init>()V

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 83
    invoke-super {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    .line 84
    .local v0, "retval":Landroid/gov/nist/javax/sdp/fields/EmailAddress;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->email:Landroid/gov/nist/javax/sdp/fields/Email;

    if-eqz v1, :cond_0

    .line 85
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->email:Landroid/gov/nist/javax/sdp/fields/Email;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/Email;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/Email;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->email:Landroid/gov/nist/javax/sdp/fields/Email;

    .line 86
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 3

    .line 71
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->displayName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, "encoded_string":Ljava/lang/String;
    goto :goto_0

    .line 74
    .end local v0    # "encoded_string":Ljava/lang/String;
    :cond_0
    const-string v0, ""

    .line 76
    .restart local v0    # "encoded_string":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->email:Landroid/gov/nist/javax/sdp/fields/Email;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/Email;->encode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 77
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->displayName:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 78
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 80
    :cond_1
    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .line 47
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 0
    .param p1, "displayName"    # Ljava/lang/String;

    .line 53
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->displayName:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public setEmail(Landroid/gov/nist/javax/sdp/fields/Email;)V
    .locals 0
    .param p1, "email"    # Landroid/gov/nist/javax/sdp/fields/Email;

    .line 59
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->email:Landroid/gov/nist/javax/sdp/fields/Email;

    .line 60
    return-void
.end method
