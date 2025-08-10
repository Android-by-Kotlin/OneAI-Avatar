.class public Landroid/gov/nist/javax/sip/header/ims/Privacy;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "Privacy.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/ims/PrivacyHeader;
.implements Landroid/gov/nist/javax/sip/header/ims/SIPHeaderNamesIms;
.implements Landroid/javax/sip/header/ExtensionHeader;


# instance fields
.field private privacy:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 65
    const-string/jumbo v0, "Privacy"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "privacy"    # Ljava/lang/String;

    .line 74
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/ims/Privacy;-><init>()V

    .line 75
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ims/Privacy;->privacy:Ljava/lang/String;

    .line 77
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 140
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/Privacy;

    .line 141
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ims/Privacy;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/Privacy;->privacy:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 142
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/Privacy;->privacy:Ljava/lang/String;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/ims/Privacy;->privacy:Ljava/lang/String;

    .line 143
    :cond_0
    return-object v0
.end method

.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 85
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/Privacy;->privacy:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "other"    # Ljava/lang/Object;

    .line 129
    instance-of v0, p1, Landroid/gov/nist/javax/sip/header/ims/PrivacyHeader;

    if-eqz v0, :cond_0

    .line 131
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/PrivacyHeader;

    .line 132
    .local v0, "o":Landroid/gov/nist/javax/sip/header/ims/PrivacyHeader;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/Privacy;->getPrivacy()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/header/ims/PrivacyHeader;->getPrivacy()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 134
    .end local v0    # "o":Landroid/gov/nist/javax/sip/header/ims/PrivacyHeader;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getPrivacy()Ljava/lang/String;
    .locals 1

    .line 96
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/Privacy;->privacy:Ljava/lang/String;

    return-object v0
.end method

.method public setPrivacy(Ljava/lang/String;)V
    .locals 2
    .param p1, "privacy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 109
    if-eqz p1, :cond_0

    const-string v0, ""

    if-eq p1, v0, :cond_0

    .line 113
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ims/Privacy;->privacy:Ljava/lang/String;

    .line 115
    return-void

    .line 110
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception,  Privacy, setPrivacy(), privacy value is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 122
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
