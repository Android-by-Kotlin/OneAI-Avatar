.class public Landroid/gov/nist/javax/sip/header/ProxyRequire;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "ProxyRequire.java"

# interfaces
.implements Landroid/javax/sip/header/ProxyRequireHeader;


# static fields
.field private static final serialVersionUID:J = -0x2d5ecb9861a287f5L


# instance fields
.field protected optionTag:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 60
    const-string/jumbo v0, "Proxy-Require"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 67
    const-string/jumbo v0, "Proxy-Require"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 68
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ProxyRequire;->optionTag:Ljava/lang/String;

    .line 69
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ProxyRequire;->optionTag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getOptionTag()Ljava/lang/String;
    .locals 1

    .line 99
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ProxyRequire;->optionTag:Ljava/lang/String;

    return-object v0
.end method

.method public setOptionTag(Ljava/lang/String;)V
    .locals 2
    .param p1, "optionTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 88
    if-eqz p1, :cond_0

    .line 90
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ProxyRequire;->optionTag:Ljava/lang/String;

    .line 91
    return-void

    .line 89
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, ProxyRequire, setOptionTag(), the optionTag parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
