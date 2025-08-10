.class public Landroid/gov/nist/javax/sip/header/AcceptLanguageList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "AcceptLanguageList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/AcceptLanguage;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2da707f5d2dc9048L


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 53
    const-class v0, Landroid/gov/nist/javax/sip/header/AcceptLanguage;

    const-string v1, "Accept-Language"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 54
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 47
    new-instance v0, Landroid/gov/nist/javax/sip/header/AcceptLanguageList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AcceptLanguageList;-><init>()V

    .line 48
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/AcceptLanguageList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/AcceptLanguageList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/AcceptLanguageList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 49
    return-object v0
.end method
