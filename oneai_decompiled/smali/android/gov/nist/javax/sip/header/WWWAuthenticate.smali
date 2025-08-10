.class public Landroid/gov/nist/javax/sip/header/WWWAuthenticate;
.super Landroid/gov/nist/javax/sip/header/AuthenticationHeader;
.source "WWWAuthenticate.java"

# interfaces
.implements Landroid/javax/sip/header/WWWAuthenticateHeader;
.implements Landroid/gov/nist/javax/sip/header/ims/WWWAuthenticateHeaderIms;


# static fields
.field private static final serialVersionUID:J = 0x199e8450a455c1eL


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    const-string/jumbo v0, "WWW-Authenticate"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;-><init>(Ljava/lang/String;)V

    .line 60
    return-void
.end method


# virtual methods
.method public getURI()Landroid/javax/sip/address/URI;
    .locals 1

    .line 69
    const/4 v0, 0x0

    return-object v0
.end method

.method public setURI(Landroid/javax/sip/address/URI;)V
    .locals 0
    .param p1, "uri"    # Landroid/javax/sip/address/URI;

    .line 80
    return-void
.end method
