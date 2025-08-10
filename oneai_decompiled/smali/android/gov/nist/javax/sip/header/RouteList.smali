.class public Landroid/gov/nist/javax/sip/header/RouteList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "RouteList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/Route;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x2f4a3d58ba83ad94L


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 52
    const-class v0, Landroid/gov/nist/javax/sip/header/Route;

    const-string/jumbo v1, "Route"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 54
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 57
    new-instance v0, Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RouteList;-><init>()V

    .line 58
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/RouteList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/RouteList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/RouteList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 59
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 1

    .line 63
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    return-object v0

    .line 64
    :cond_0
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "other"    # Ljava/lang/Object;

    .line 72
    instance-of v0, p1, Landroid/gov/nist/javax/sip/header/RouteList;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 73
    return v1

    .line 74
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/header/RouteList;

    .line 75
    .local v0, "that":Landroid/gov/nist/javax/sip/header/RouteList;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/RouteList;->size()I

    move-result v2

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RouteList;->size()I

    move-result v3

    if-eq v2, v3, :cond_1

    .line 76
    return v1

    .line 77
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/RouteList;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    .line 78
    .local v2, "it":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/Route;>;"
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RouteList;->listIterator()Ljava/util/ListIterator;

    move-result-object v3

    .line 79
    .local v3, "it1":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/Route;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 80
    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/Route;

    .line 81
    .local v4, "route":Landroid/gov/nist/javax/sip/header/Route;
    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/header/Route;

    .line 82
    .local v5, "route1":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/header/Route;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 83
    return v1

    .line 84
    .end local v4    # "route":Landroid/gov/nist/javax/sip/header/Route;
    .end local v5    # "route1":Landroid/gov/nist/javax/sip/header/Route;
    :cond_2
    goto :goto_0

    .line 85
    :cond_3
    const/4 v1, 0x1

    return v1
.end method
