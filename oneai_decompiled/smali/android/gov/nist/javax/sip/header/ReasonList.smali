.class public final Landroid/gov/nist/javax/sip/header/ReasonList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "ReasonList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/Reason;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x67873560c2c2475eL


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 56
    const-class v0, Landroid/gov/nist/javax/sip/header/Reason;

    const-string/jumbo v1, "Reason"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 57
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 48
    new-instance v0, Landroid/gov/nist/javax/sip/header/ReasonList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ReasonList;-><init>()V

    .line 49
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ReasonList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ReasonList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ReasonList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 50
    return-object v0
.end method
