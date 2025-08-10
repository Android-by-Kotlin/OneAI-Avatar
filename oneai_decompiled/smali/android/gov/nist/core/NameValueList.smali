.class public Landroid/gov/nist/core/NameValueList;
.super Ljava/lang/Object;
.source "NameValueList.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Cloneable;",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "Landroid/gov/nist/core/NameValue;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x611edb317cd0ac13L


# instance fields
.field private hmap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/core/NameValue;",
            ">;"
        }
    .end annotation
.end field

.field private separator:Ljava/lang/String;

.field private sync:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/core/NameValueList;->sync:Z

    .line 68
    const-string v0, ";"

    iput-object v0, p0, Landroid/gov/nist/core/NameValueList;->separator:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "sync"    # Z

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/core/NameValueList;->sync:Z

    .line 74
    const-string v0, ";"

    iput-object v0, p0, Landroid/gov/nist/core/NameValueList;->separator:Ljava/lang/String;

    .line 75
    iput-boolean p1, p0, Landroid/gov/nist/core/NameValueList;->sync:Z

    .line 81
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 310
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 311
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 313
    :cond_0
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 3

    .line 230
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    .line 231
    .local v0, "retval":Landroid/gov/nist/core/NameValueList;
    iget-object v1, p0, Landroid/gov/nist/core/NameValueList;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->setSeparator(Ljava/lang/String;)V

    .line 232
    iget-object v1, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-eqz v1, :cond_0

    .line 233
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 234
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/NameValue;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 235
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/NameValue;

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/NameValue;

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    goto :goto_0

    .line 238
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/NameValue;>;"
    :cond_0
    return-object v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 320
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 321
    const/4 v0, 0x0

    return v0

    .line 323
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .line 331
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 332
    const/4 v0, 0x0

    return v0

    .line 334
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public delete(Ljava/lang/String;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 219
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 220
    .local v0, "lcName":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/gov/nist/core/NameValueList;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 221
    invoke-virtual {p0, v0}, Landroid/gov/nist/core/NameValueList;->remove(Ljava/lang/Object;)Landroid/gov/nist/core/NameValue;

    .line 222
    const/4 v1, 0x1

    return v1

    .line 224
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public encode()Ljava/lang/String;
    .locals 1

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 3
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 98
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 99
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 100
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/NameValue;>;"
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 102
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 103
    .local v1, "obj":Ljava/lang/Object;
    instance-of v2, v1, Landroid/gov/nist/core/GenericObject;

    if-eqz v2, :cond_0

    .line 104
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/core/GenericObject;

    .line 105
    .local v2, "gobj":Landroid/gov/nist/core/GenericObject;
    invoke-virtual {v2, p1}, Landroid/gov/nist/core/GenericObject;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 106
    .end local v2    # "gobj":Landroid/gov/nist/core/GenericObject;
    goto :goto_1

    .line 107
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 110
    iget-object v2, p0, Landroid/gov/nist/core/NameValueList;->separator:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .end local v1    # "obj":Ljava/lang/Object;
    goto :goto_0

    .line 116
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/NameValue;>;"
    :cond_1
    return-object p1
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/core/NameValue;",
            ">;>;"
        }
    .end annotation

    .line 342
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 343
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    return-object v0

    .line 345
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "otherObject"    # Ljava/lang/Object;

    .line 148
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 149
    return v0

    .line 151
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 152
    return v0

    .line 154
    :cond_1
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/core/NameValueList;

    .line 156
    .local v1, "other":Landroid/gov/nist/core/NameValueList;
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->size()I

    move-result v2

    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->size()I

    move-result v3

    if-eq v2, v3, :cond_2

    .line 157
    return v0

    .line 159
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->getNames()Ljava/util/Iterator;

    move-result-object v2

    .line 161
    .local v2, "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 162
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 163
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p0, v3}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v4

    .line 164
    .local v4, "nv1":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v1, v3}, Landroid/gov/nist/core/NameValueList;->get(Ljava/lang/Object;)Landroid/gov/nist/core/NameValue;

    move-result-object v5

    .line 165
    .local v5, "nv2":Landroid/gov/nist/core/NameValue;
    if-nez v5, :cond_3

    .line 166
    return v0

    .line 167
    :cond_3
    invoke-virtual {v5, v4}, Landroid/gov/nist/core/NameValue;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 168
    return v0

    .line 169
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "nv1":Landroid/gov/nist/core/NameValue;
    .end local v5    # "nv2":Landroid/gov/nist/core/NameValue;
    :cond_4
    goto :goto_0

    .line 170
    :cond_5
    const/4 v0, 0x1

    return v0
.end method

.method public get(Ljava/lang/Object;)Landroid/gov/nist/core/NameValue;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 353
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 354
    const/4 v0, 0x0

    return-object v0

    .line 356
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/NameValue;

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 53
    invoke-virtual {p0, p1}, Landroid/gov/nist/core/NameValueList;->get(Ljava/lang/Object;)Landroid/gov/nist/core/NameValue;

    move-result-object p1

    return-object p1
.end method

.method protected getMap()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/core/NameValue;",
            ">;"
        }
    .end annotation

    .line 410
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-nez v0, :cond_1

    .line 411
    iget-boolean v0, p0, Landroid/gov/nist/core/NameValueList;->sync:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 412
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    goto :goto_0

    .line 414
    :cond_0
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    .line 417
    :cond_1
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    return-object v0
.end method

.method public getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 197
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 198
    const/4 v0, 0x0

    return-object v0

    .line 200
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/NameValue;

    return-object v0
.end method

.method public getNames()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 276
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->getMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 286
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/gov/nist/core/NameValueList;->getParameter(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "stripQuotes"    # Z

    .line 295
    invoke-virtual {p0, p1, p2}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    .line 296
    .local v0, "val":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 297
    const/4 v1, 0x0

    return-object v1

    .line 298
    :cond_0
    instance-of v1, v0, Landroid/gov/nist/core/GenericObject;

    if-eqz v1, :cond_1

    .line 299
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v1}, Landroid/gov/nist/core/GenericObject;->encode()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 301
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 177
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getValue(Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "stripQuotes"    # Z

    .line 184
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 185
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {v0, p2}, Landroid/gov/nist/core/NameValue;->getValueAsObject(Z)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 188
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public hasNameValue(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 210
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/NameValueList;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 403
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->getMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 255
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 256
    const/4 v0, 0x1

    return v0

    .line 258
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Landroid/gov/nist/core/NameValue;",
            ">;"
        }
    .end annotation

    .line 267
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->getMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 364
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 365
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    return-object v0

    .line 367
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Landroid/gov/nist/core/NameValue;)Landroid/gov/nist/core/NameValue;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "nameValue"    # Landroid/gov/nist/core/NameValue;

    .line 375
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->getMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/NameValue;

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 53
    check-cast p1, Ljava/lang/String;

    check-cast p2, Landroid/gov/nist/core/NameValue;

    invoke-virtual {p0, p1, p2}, Landroid/gov/nist/core/NameValueList;->put(Ljava/lang/String;Landroid/gov/nist/core/NameValue;)Landroid/gov/nist/core/NameValue;

    move-result-object p1

    return-object p1
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+",
            "Ljava/lang/String;",
            "+",
            "Landroid/gov/nist/core/NameValue;",
            ">;)V"
        }
    .end annotation

    .line 379
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+Ljava/lang/String;+Landroid/gov/nist/core/NameValue;>;"
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->getMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 380
    return-void
.end method

.method public remove(Ljava/lang/Object;)Landroid/gov/nist/core/NameValue;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 387
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 388
    const/4 v0, 0x0

    return-object v0

    .line 390
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->getMap()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/NameValue;

    return-object v0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 53
    invoke-virtual {p0, p1}, Landroid/gov/nist/core/NameValueList;->remove(Ljava/lang/Object;)Landroid/gov/nist/core/NameValue;

    move-result-object p1

    return-object p1
.end method

.method public set(Landroid/gov/nist/core/NameValue;)V
    .locals 1
    .param p1, "nv"    # Landroid/gov/nist/core/NameValue;

    .line 128
    invoke-virtual {p1}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/core/NameValueList;->put(Ljava/lang/String;Landroid/gov/nist/core/NameValue;)Landroid/gov/nist/core/NameValue;

    .line 129
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 135
    new-instance v0, Landroid/gov/nist/core/NameValue;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 136
    .local v0, "nameValue":Landroid/gov/nist/core/NameValue;
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Landroid/gov/nist/core/NameValueList;->put(Ljava/lang/String;Landroid/gov/nist/core/NameValue;)Landroid/gov/nist/core/NameValue;

    .line 138
    return-void
.end method

.method public setSeparator(Ljava/lang/String;)V
    .locals 0
    .param p1, "separator"    # Ljava/lang/String;

    .line 84
    iput-object p1, p0, Landroid/gov/nist/core/NameValueList;->separator:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public size()I
    .locals 1

    .line 245
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 246
    const/4 v0, 0x0

    return v0

    .line 248
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/NameValueList;->hmap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 120
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Landroid/gov/nist/core/NameValue;",
            ">;"
        }
    .end annotation

    .line 398
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValueList;->getMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
