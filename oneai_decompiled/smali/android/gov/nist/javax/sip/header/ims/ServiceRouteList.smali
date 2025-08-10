.class public Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "ServiceRouteList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3b2fa7686c711c17L


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 45
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;

    const-string/jumbo v1, "Service-Route"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 46
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 49
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;-><init>()V

    .line 50
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    move-result-object v1

    return-object v1
.end method
