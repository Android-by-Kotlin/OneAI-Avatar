.class public Landroid/gov/nist/javax/sdp/fields/Email;
.super Landroid/gov/nist/javax/sdp/fields/SDPObject;
.source "Email.java"


# instance fields
.field protected hostName:Ljava/lang/String;

.field protected userName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;-><init>()V

    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 2

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/Email;->userName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/Email;->hostName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHostName()Ljava/lang/String;
    .locals 1

    .line 47
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/Email;->hostName:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .line 44
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/Email;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public setHostName(Ljava/lang/String;)V
    .locals 1
    .param p1, "h"    # Ljava/lang/String;

    .line 59
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/Email;->hostName:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0
    .param p1, "u"    # Ljava/lang/String;

    .line 53
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/Email;->userName:Ljava/lang/String;

    .line 54
    return-void
.end method
