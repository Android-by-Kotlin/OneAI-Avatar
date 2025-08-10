.class public Landroid/gov/nist/javax/sip/header/ErrorInfoList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "ErrorInfoList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/ErrorInfo;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 71
    const-class v0, Landroid/gov/nist/javax/sip/header/ErrorInfo;

    const-string v1, "Error-Info"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 72
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 63
    new-instance v0, Landroid/gov/nist/javax/sip/header/ErrorInfoList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ErrorInfoList;-><init>()V

    .line 64
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ErrorInfoList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ErrorInfoList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ErrorInfoList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 65
    return-object v0
.end method
