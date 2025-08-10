.class public Landroid/gov/nist/javax/sip/header/ims/PAssociatedURIList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "PAssociatedURIList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x3dd0dfc13f8dd6a3L


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 57
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;

    const-string/jumbo v1, "P-Associated-URI"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 58
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 62
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURIList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURIList;-><init>()V

    .line 63
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ims/PAssociatedURIList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURIList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURIList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    move-result-object v1

    return-object v1
.end method
