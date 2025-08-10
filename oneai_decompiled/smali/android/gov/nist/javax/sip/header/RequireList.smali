.class public final Landroid/gov/nist/javax/sip/header/RequireList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "RequireList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/Require;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x186f02d4bcad820dL


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 59
    const-class v0, Landroid/gov/nist/javax/sip/header/Require;

    const-string/jumbo v1, "Require"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 60
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 51
    new-instance v0, Landroid/gov/nist/javax/sip/header/RequireList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RequireList;-><init>()V

    .line 52
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/RequireList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/RequireList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/RequireList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 53
    return-object v0
.end method
