.class public Landroid/gov/nist/javax/sip/header/ExtensionHeaderList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "ExtensionHeaderList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x40f769eda9aeca95L


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 58
    const-class v0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "hName"    # Ljava/lang/String;

    .line 54
    const-class v0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;

    invoke-direct {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 55
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 49
    new-instance v0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderList;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderList;->headerName:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderList;-><init>(Ljava/lang/String;)V

    .line 50
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ExtensionHeaderList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 51
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 4

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .local v0, "retval":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 65
    .local v1, "it":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 66
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;

    .line 67
    .local v2, "eh":Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->encode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .end local v2    # "eh":Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;
    goto :goto_0

    .line 69
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
