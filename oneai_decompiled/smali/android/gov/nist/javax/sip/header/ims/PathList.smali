.class public Landroid/gov/nist/javax/sip/header/ims/PathList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "PathList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/ims/Path;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 42
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/Path;

    const-string/jumbo v1, "Path"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 43
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 47
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PathList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PathList;-><init>()V

    .line 48
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ims/PathList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PathList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ims/PathList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    move-result-object v1

    return-object v1
.end method
