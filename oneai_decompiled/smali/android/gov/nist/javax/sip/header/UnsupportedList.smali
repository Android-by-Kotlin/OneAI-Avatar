.class public Landroid/gov/nist/javax/sip/header/UnsupportedList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "UnsupportedList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/Unsupported;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x383dc391811b9ae5L


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 48
    const-class v0, Landroid/gov/nist/javax/sip/header/Unsupported;

    const-string/jumbo v1, "Unsupported"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 49
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 53
    new-instance v0, Landroid/gov/nist/javax/sip/header/UnsupportedList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/UnsupportedList;-><init>()V

    .line 54
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/UnsupportedList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/UnsupportedList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/UnsupportedList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    move-result-object v1

    return-object v1
.end method
