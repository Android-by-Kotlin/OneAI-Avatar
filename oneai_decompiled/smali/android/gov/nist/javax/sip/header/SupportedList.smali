.class public Landroid/gov/nist/javax/sip/header/SupportedList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "SupportedList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/Supported;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3efed4e2c6983ebfL


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 53
    const-class v0, Landroid/gov/nist/javax/sip/header/Supported;

    const-string/jumbo v1, "Supported"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 54
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 45
    new-instance v0, Landroid/gov/nist/javax/sip/header/SupportedList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/SupportedList;-><init>()V

    .line 46
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/SupportedList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/SupportedList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/SupportedList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 47
    return-object v0
.end method
