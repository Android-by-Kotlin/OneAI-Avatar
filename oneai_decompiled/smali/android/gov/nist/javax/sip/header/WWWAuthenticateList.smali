.class public Landroid/gov/nist/javax/sip/header/WWWAuthenticateList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "WWWAuthenticateList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/WWWAuthenticate;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x60da0aa6d8ffdfa2L


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 56
    const-class v0, Landroid/gov/nist/javax/sip/header/WWWAuthenticate;

    const-string/jumbo v1, "WWW-Authenticate"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 57
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 49
    new-instance v0, Landroid/gov/nist/javax/sip/header/WWWAuthenticateList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/WWWAuthenticateList;-><init>()V

    .line 50
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/WWWAuthenticateList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/WWWAuthenticateList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/WWWAuthenticateList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    move-result-object v1

    return-object v1
.end method
