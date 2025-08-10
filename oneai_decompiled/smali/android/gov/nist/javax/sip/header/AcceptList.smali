.class public Landroid/gov/nist/javax/sip/header/AcceptList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "AcceptList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/Accept;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x18fdc630b7aed5dfL


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 58
    const-class v0, Landroid/gov/nist/javax/sip/header/Accept;

    const-string v1, "Accept"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 59
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 50
    new-instance v0, Landroid/gov/nist/javax/sip/header/AcceptList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AcceptList;-><init>()V

    .line 51
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/AcceptList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AcceptList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/AcceptList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 52
    return-object v0
.end method
