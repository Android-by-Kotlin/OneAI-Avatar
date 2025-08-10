.class public final Landroid/gov/nist/javax/sip/header/InReplyToList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "InReplyToList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/InReplyTo;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x6eee9c88103b0ac5L


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 57
    const-class v0, Landroid/gov/nist/javax/sip/header/InReplyTo;

    const-string v1, "In-Reply-To"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 58
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 49
    new-instance v0, Landroid/gov/nist/javax/sip/header/InReplyToList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/InReplyToList;-><init>()V

    .line 50
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/InReplyToList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/InReplyToList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/InReplyToList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 51
    return-object v0
.end method
