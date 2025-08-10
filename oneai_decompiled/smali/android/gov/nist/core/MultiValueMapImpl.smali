.class public Landroid/gov/nist/core/MultiValueMapImpl;
.super Ljava/lang/Object;
.source "MultiValueMapImpl.java"

# interfaces
.implements Landroid/gov/nist/core/MultiValueMap;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/gov/nist/core/MultiValueMap<",
        "Ljava/lang/String;",
        "TV;>;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x3b55a57dcb730ffdL


# instance fields
.field private map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 42
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    .line 43
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 4

    .line 78
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-eqz v0, :cond_1

    .line 79
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 80
    .local v0, "pairs":Ljava/util/Set;
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 81
    .local v1, "pairsIterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 82
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    check-cast v2, Ljava/util/Map$Entry;

    .line 83
    .local v2, "keyValuePair":Ljava/util/Map$Entry;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    check-cast v3, Ljava/util/ArrayList;

    .line 84
    .local v3, "list":Ljava/util/ArrayList;
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 85
    .end local v2    # "keyValuePair":Ljava/util/Map$Entry;
    .end local v3    # "list":Ljava/util/ArrayList;
    goto :goto_0

    .line 86
    :cond_0
    iget-object v2, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 88
    .end local v0    # "pairs":Ljava/util/Set;
    .end local v1    # "pairsIterator":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 111
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    new-instance v0, Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-direct {v0}, Landroid/gov/nist/core/MultiValueMapImpl;-><init>()V

    .line 112
    .local v0, "obj":Landroid/gov/nist/core/MultiValueMapImpl;
    iget-object v1, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-eqz v1, :cond_0

    .line 113
    iget-object v1, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    iput-object v1, v0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    .line 115
    :cond_0
    return-object v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 126
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 127
    const/4 v0, 0x0

    return v0

    .line 129
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "value"    # Ljava/lang/Object;

    .line 60
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    const/4 v0, 0x0

    .line 61
    .local v0, "pairs":Ljava/util/Set;
    iget-object v1, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-eqz v1, :cond_0

    .line 62
    iget-object v1, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 64
    :cond_0
    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 65
    return v1

    .line 67
    :cond_1
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 68
    .local v2, "pairsIterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 69
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    check-cast v3, Ljava/util/Map$Entry;

    .line 70
    .local v3, "keyValuePair":Ljava/util/Map$Entry;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    check-cast v4, Ljava/util/ArrayList;

    .line 71
    .local v4, "list":Ljava/util/ArrayList;
    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 72
    const/4 v1, 0x1

    return v1

    .line 73
    .end local v3    # "keyValuePair":Ljava/util/Map$Entry;
    .end local v4    # "list":Ljava/util/ArrayList;
    :cond_2
    goto :goto_0

    .line 74
    :cond_3
    return v1
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1

    .line 133
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 134
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    return-object v0

    .line 136
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 35
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    invoke-virtual {p0, p1}, Landroid/gov/nist/core/MultiValueMapImpl;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public get(Ljava/lang/Object;)Ljava/util/List;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation

    .line 166
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 167
    const/4 v0, 0x0

    return-object v0

    .line 169
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getMap()Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "TV;>;>;"
        }
    .end annotation

    .line 196
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 197
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    .line 199
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 140
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 141
    const/4 v0, 0x1

    return v0

    .line 143
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    return v0
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

    .line 147
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 148
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    return-object v0

    .line 150
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 35
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/util/List;

    invoke-virtual {p0, p1, p2}, Landroid/gov/nist/core/MultiValueMapImpl;->put(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/util/List;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TV;)",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation

    .line 46
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v0, 0x0

    .line 47
    .local v0, "keyList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TV;>;"
    iget-object v1, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-eqz v1, :cond_0

    .line 48
    iget-object v1, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Ljava/util/ArrayList;

    .line 50
    :cond_0
    if-nez v0, :cond_1

    .line 51
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v1

    .line 52
    invoke-virtual {p0}, Landroid/gov/nist/core/MultiValueMapImpl;->getMap()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    :cond_1
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "TV;>;)",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation

    .line 173
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    .local p2, "value":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-virtual {p0}, Landroid/gov/nist/core/MultiValueMapImpl;->getMap()Ljava/util/HashMap;

    move-result-object v0

    move-object v1, p2

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+",
            "Ljava/lang/String;",
            "+",
            "Ljava/util/List<",
            "TV;>;>;)V"
        }
    .end annotation

    .line 184
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    .local p1, "mapToPut":Ljava/util/Map;, "Ljava/util/Map<+Ljava/lang/String;+Ljava/util/List<TV;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 185
    .local v1, "k":Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 186
    .local v2, "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TV;>;"
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 187
    invoke-virtual {p0}, Landroid/gov/nist/core/MultiValueMapImpl;->getMap()Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    .end local v1    # "k":Ljava/lang/String;
    .end local v2    # "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TV;>;"
    goto :goto_0

    .line 189
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 35
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    invoke-virtual {p0, p1}, Landroid/gov/nist/core/MultiValueMapImpl;->remove(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public remove(Ljava/lang/Object;)Ljava/util/List;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation

    .line 177
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 178
    const/4 v0, 0x0

    return-object v0

    .line 180
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public bridge synthetic removeKV(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 35
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Landroid/gov/nist/core/MultiValueMapImpl;->removeKV(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removeKV(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TV;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 154
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    .local p2, "item":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 155
    return-object v1

    .line 157
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 158
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TV;>;"
    if-nez v0, :cond_1

    .line 159
    return-object v1

    .line 161
    :cond_1
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method public size()I
    .locals 1

    .line 119
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 120
    const/4 v0, 0x0

    return v0

    .line 122
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 8

    .line 91
    .local p0, "this":Landroid/gov/nist/core/MultiValueMapImpl;, "Landroid/gov/nist/core/MultiValueMapImpl<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0

    .line 94
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 96
    .local v0, "returnList":Ljava/util/ArrayList;
    iget-object v1, p0, Landroid/gov/nist/core/MultiValueMapImpl;->map:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 97
    .local v1, "pairs":Ljava/util/Set;
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 98
    .local v2, "pairsIterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 99
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    check-cast v3, Ljava/util/Map$Entry;

    .line 100
    .local v3, "keyValuePair":Ljava/util/Map$Entry;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    check-cast v4, Ljava/util/ArrayList;

    .line 102
    .local v4, "list":Ljava/util/ArrayList;
    invoke-virtual {v4}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v5

    .line 103
    .local v5, "values":[Ljava/lang/Object;
    const/4 v6, 0x0

    .local v6, "ii":I
    :goto_1
    array-length v7, v5

    if-ge v6, v7, :cond_1

    .line 104
    aget-object v7, v5, v6

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 106
    .end local v3    # "keyValuePair":Ljava/util/Map$Entry;
    .end local v4    # "list":Ljava/util/ArrayList;
    .end local v5    # "values":[Ljava/lang/Object;
    .end local v6    # "ii":I
    :cond_1
    goto :goto_0

    .line 107
    :cond_2
    return-object v0
.end method
