.class public Landroid/gov/nist/javax/sip/header/AlertInfoList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "AlertInfoList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/AlertInfo;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 55
    const-class v0, Landroid/gov/nist/javax/sip/header/AlertInfo;

    const-string v1, "Alert-Info"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 56
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 46
    new-instance v0, Landroid/gov/nist/javax/sip/header/AlertInfoList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AlertInfoList;-><init>()V

    .line 47
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/AlertInfoList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AlertInfoList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/AlertInfoList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 48
    return-object v0
.end method
