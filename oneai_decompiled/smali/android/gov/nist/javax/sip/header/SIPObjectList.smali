.class public Landroid/gov/nist/javax/sip/header/SIPObjectList;
.super Landroid/gov/nist/core/GenericObjectList;
.source "SIPObjectList.java"


# static fields
.field private static final serialVersionUID:J = -0x29d7fb4297970e29L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 68
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObjectList;-><init>()V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "lname"    # Ljava/lang/String;

    .line 58
    invoke-direct {p0, p1}, Landroid/gov/nist/core/GenericObjectList;-><init>(Ljava/lang/String;)V

    .line 59
    return-void
.end method


# virtual methods
.method public concatenate(Landroid/gov/nist/javax/sip/header/SIPObjectList;)V
    .locals 0
    .param p1, "otherList"    # Landroid/gov/nist/javax/sip/header/SIPObjectList;

    .line 103
    invoke-super {p0, p1}, Landroid/gov/nist/core/GenericObjectList;->concatenate(Landroid/gov/nist/core/GenericObjectList;)V

    .line 104
    return-void
.end method

.method public concatenate(Landroid/gov/nist/javax/sip/header/SIPObjectList;Z)V
    .locals 0
    .param p1, "otherList"    # Landroid/gov/nist/javax/sip/header/SIPObjectList;
    .param p2, "topFlag"    # Z

    .line 112
    invoke-super {p0, p1, p2}, Landroid/gov/nist/core/GenericObjectList;->concatenate(Landroid/gov/nist/core/GenericObjectList;Z)V

    .line 113
    return-void
.end method

.method public debugDump(I)Ljava/lang/String;
    .locals 1
    .param p1, "indent"    # I

    .line 145
    invoke-super {p0, p1}, Landroid/gov/nist/core/GenericObjectList;->debugDump(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public first()Landroid/gov/nist/core/GenericObject;
    .locals 1

    .line 120
    invoke-super {p0}, Landroid/gov/nist/core/GenericObjectList;->first()Landroid/gov/nist/core/GenericObject;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPObject;

    return-object v0
.end method

.method public mergeObjects(Landroid/gov/nist/core/GenericObjectList;)V
    .locals 4
    .param p1, "mergeList"    # Landroid/gov/nist/core/GenericObjectList;

    .line 87
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/SIPObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 88
    .local v0, "it1":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/GenericObject;>;"
    invoke-virtual {p1}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 89
    .local v1, "it2":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/GenericObject;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 90
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/GenericObject;

    .line 91
    .local v2, "outerObj":Landroid/gov/nist/core/GenericObject;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 92
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 93
    .local v3, "innerObj":Ljava/lang/Object;
    invoke-virtual {v2, v3}, Landroid/gov/nist/core/GenericObject;->merge(Ljava/lang/Object;)V

    .line 94
    .end local v3    # "innerObj":Ljava/lang/Object;
    goto :goto_1

    .line 95
    .end local v2    # "outerObj":Landroid/gov/nist/core/GenericObject;
    :cond_0
    goto :goto_0

    .line 96
    :cond_1
    return-void
.end method

.method public next()Landroid/gov/nist/core/GenericObject;
    .locals 1

    .line 130
    invoke-super {p0}, Landroid/gov/nist/core/GenericObjectList;->next()Landroid/gov/nist/core/GenericObject;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPObject;

    return-object v0
.end method
