.class public Landroid/gov/nist/javax/sdp/fields/SDPObjectList;
.super Landroid/gov/nist/core/GenericObjectList;
.source "SDPObjectList.java"


# static fields
.field protected static final SDPFIELDS_PACKAGE:Ljava/lang/String; = "android.gov.nist.javax.sdp.fields"


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 82
    const/4 v0, 0x0

    const-class v1, Landroid/gov/nist/javax/sdp/fields/SDPObject;

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/core/GenericObjectList;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "lname"    # Ljava/lang/String;

    .line 86
    const-string/jumbo v0, "android.gov.nist.javax.sdp.fields.SDPObject"

    invoke-direct {p0, p1, v0}, Landroid/gov/nist/core/GenericObjectList;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "lname"    # Ljava/lang/String;
    .param p2, "classname"    # Ljava/lang/String;

    .line 78
    invoke-direct {p0, p1, p2}, Landroid/gov/nist/core/GenericObjectList;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    return-void
.end method


# virtual methods
.method public add(Landroid/gov/nist/javax/sdp/fields/SDPObject;)V
    .locals 0
    .param p1, "s"    # Landroid/gov/nist/javax/sdp/fields/SDPObject;

    .line 69
    invoke-super {p0, p1}, Landroid/gov/nist/core/GenericObjectList;->add(Ljava/lang/Object;)Z

    .line 70
    return-void
.end method

.method public encode()Ljava/lang/String;
    .locals 3

    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .local v0, "retval":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->first()Landroid/gov/nist/core/GenericObject;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/SDPObject;

    .line 103
    .local v1, "sdpObject":Landroid/gov/nist/javax/sdp/fields/SDPObject;
    :goto_0
    if-eqz v1, :cond_0

    .line 105
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->encode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->next()Landroid/gov/nist/core/GenericObject;

    move-result-object v2

    move-object v1, v2

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/SDPObject;

    goto :goto_0

    .line 107
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public first()Landroid/gov/nist/core/GenericObject;
    .locals 1

    .line 90
    invoke-super {p0}, Landroid/gov/nist/core/GenericObjectList;->first()Landroid/gov/nist/core/GenericObject;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/SDPObject;

    return-object v0
.end method

.method public mergeObjects(Landroid/gov/nist/core/GenericObjectList;)V
    .locals 4
    .param p1, "mergeList"    # Landroid/gov/nist/core/GenericObjectList;

    .line 54
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 55
    .local v0, "it1":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/GenericObject;>;"
    invoke-virtual {p1}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 56
    .local v1, "it2":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/GenericObject;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 57
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/GenericObject;

    .line 58
    .local v2, "outerObj":Landroid/gov/nist/core/GenericObject;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 59
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 60
    .local v3, "innerObj":Ljava/lang/Object;
    invoke-virtual {v2, v3}, Landroid/gov/nist/core/GenericObject;->merge(Ljava/lang/Object;)V

    .line 61
    .end local v3    # "innerObj":Ljava/lang/Object;
    goto :goto_1

    .line 62
    .end local v2    # "outerObj":Landroid/gov/nist/core/GenericObject;
    :cond_0
    goto :goto_0

    .line 63
    :cond_1
    return-void
.end method

.method public next()Landroid/gov/nist/core/GenericObject;
    .locals 1

    .line 94
    invoke-super {p0}, Landroid/gov/nist/core/GenericObjectList;->next()Landroid/gov/nist/core/GenericObject;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/SDPObject;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 111
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
