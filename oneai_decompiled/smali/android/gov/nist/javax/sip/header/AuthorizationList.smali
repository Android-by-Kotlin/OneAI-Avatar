.class public Landroid/gov/nist/javax/sip/header/AuthorizationList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "AuthorizationList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/Authorization;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 60
    const-class v0, Landroid/gov/nist/javax/sip/header/Authorization;

    const-string v1, "Authorization"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 61
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 52
    new-instance v0, Landroid/gov/nist/javax/sip/header/AuthorizationList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AuthorizationList;-><init>()V

    .line 53
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/AuthorizationList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AuthorizationList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/AuthorizationList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 54
    return-object v0
.end method
