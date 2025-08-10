.class public Landroid/gov/nist/core/DuplicateNameValueList;
.super Ljava/lang/Object;
.source "DuplicateNameValueList.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# static fields
.field private static final serialVersionUID:J = -0x4ddf7598584c3ad8L


# instance fields
.field private nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/gov/nist/core/MultiValueMapImpl<",
            "Landroid/gov/nist/core/NameValue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-direct {v0}, Landroid/gov/nist/core/MultiValueMapImpl;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    .line 53
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 226
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v0}, Landroid/gov/nist/core/MultiValueMapImpl;->clear()V

    .line 228
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 3

    .line 183
    new-instance v0, Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/DuplicateNameValueList;-><init>()V

    .line 184
    .local v0, "retval":Landroid/gov/nist/core/DuplicateNameValueList;
    iget-object v1, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v1}, Landroid/gov/nist/core/MultiValueMapImpl;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 185
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/NameValue;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 186
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/NameValue;

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/NameValue;

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/DuplicateNameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    goto :goto_0

    .line 188
    :cond_0
    return-object v0
.end method

.method public delete(Ljava/lang/String;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 172
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 173
    .local v0, "lcName":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/MultiValueMapImpl;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 174
    iget-object v1, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/MultiValueMapImpl;->remove(Ljava/lang/Object;)Ljava/util/List;

    .line 175
    const/4 v1, 0x1

    return v1

    .line 177
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public encode()Ljava/lang/String;
    .locals 1

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/DuplicateNameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 3
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 68
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v0}, Landroid/gov/nist/core/MultiValueMapImpl;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 69
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v0}, Landroid/gov/nist/core/MultiValueMapImpl;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 70
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/NameValue;>;"
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 72
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 73
    .local v1, "obj":Ljava/lang/Object;
    instance-of v2, v1, Landroid/gov/nist/core/GenericObject;

    if-eqz v2, :cond_0

    .line 74
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/core/GenericObject;

    .line 75
    .local v2, "gobj":Landroid/gov/nist/core/GenericObject;
    invoke-virtual {v2, p1}, Landroid/gov/nist/core/GenericObject;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 76
    .end local v2    # "gobj":Landroid/gov/nist/core/GenericObject;
    goto :goto_1

    .line 77
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 80
    const-string v2, ";"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .end local v1    # "obj":Ljava/lang/Object;
    goto :goto_0

    .line 86
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/NameValue;>;"
    :cond_1
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "otherObject"    # Ljava/lang/Object;

    .line 117
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 118
    return v0

    .line 120
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 121
    return v0

    .line 123
    :cond_1
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/core/DuplicateNameValueList;

    .line 125
    .local v1, "other":Landroid/gov/nist/core/DuplicateNameValueList;
    iget-object v2, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v2}, Landroid/gov/nist/core/MultiValueMapImpl;->size()I

    move-result v2

    iget-object v3, v1, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v3}, Landroid/gov/nist/core/MultiValueMapImpl;->size()I

    move-result v3

    if-eq v2, v3, :cond_2

    .line 126
    return v0

    .line 128
    :cond_2
    iget-object v2, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v2}, Landroid/gov/nist/core/MultiValueMapImpl;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 130
    .local v2, "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 131
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 132
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p0, v3}, Landroid/gov/nist/core/DuplicateNameValueList;->getNameValue(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v4

    .line 133
    .local v4, "nv1":Ljava/util/Collection;
    iget-object v5, v1, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v5, v3}, Landroid/gov/nist/core/MultiValueMapImpl;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 134
    .local v5, "nv2":Ljava/util/Collection;
    if-nez v5, :cond_3

    .line 135
    return v0

    .line 136
    :cond_3
    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 137
    return v0

    .line 138
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "nv1":Ljava/util/Collection;
    .end local v5    # "nv2":Ljava/util/Collection;
    :cond_4
    goto :goto_0

    .line 139
    :cond_5
    const/4 v0, 0x1

    return v0
.end method

.method public getNameValue(Ljava/lang/String;)Ljava/util/Collection;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 158
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/MultiValueMapImpl;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

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

    .line 206
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v0}, Landroid/gov/nist/core/MultiValueMapImpl;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 216
    invoke-virtual {p0, p1}, Landroid/gov/nist/core/DuplicateNameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 217
    .local v0, "val":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 218
    const/4 v1, 0x0

    return-object v1

    .line 219
    :cond_0
    instance-of v1, v0, Landroid/gov/nist/core/GenericObject;

    if-eqz v1, :cond_1

    .line 220
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v1}, Landroid/gov/nist/core/GenericObject;->encode()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 222
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 146
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/DuplicateNameValueList;->getNameValue(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    .line 147
    .local v0, "nv":Ljava/util/Collection;
    if-eqz v0, :cond_0

    .line 148
    return-object v0

    .line 150
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public hasNameValue(Ljava/lang/String;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 165
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/MultiValueMapImpl;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 251
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v0}, Landroid/gov/nist/core/MultiValueMapImpl;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 231
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v0}, Landroid/gov/nist/core/MultiValueMapImpl;->isEmpty()Z

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

    .line 197
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v0}, Landroid/gov/nist/core/MultiValueMapImpl;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Landroid/gov/nist/core/NameValue;)Landroid/gov/nist/core/NameValue;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Landroid/gov/nist/core/NameValue;

    .line 235
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v0, p1, p2}, Landroid/gov/nist/core/MultiValueMapImpl;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/NameValue;

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Landroid/gov/nist/core/NameValue;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 239
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/MultiValueMapImpl;->remove(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/NameValue;

    return-object v0
.end method

.method public set(Landroid/gov/nist/core/NameValue;)V
    .locals 2
    .param p1, "nv"    # Landroid/gov/nist/core/NameValue;

    .line 98
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {p1}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/gov/nist/core/MultiValueMapImpl;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/util/List;

    .line 99
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 105
    new-instance v0, Landroid/gov/nist/core/NameValue;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 106
    .local v0, "nameValue":Landroid/gov/nist/core/NameValue;
    iget-object v1, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/gov/nist/core/MultiValueMapImpl;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/util/List;

    .line 108
    return-void
.end method

.method public size()I
    .locals 1

    .line 243
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v0}, Landroid/gov/nist/core/MultiValueMapImpl;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 90
    invoke-virtual {p0}, Landroid/gov/nist/core/DuplicateNameValueList;->encode()Ljava/lang/String;

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

    .line 247
    iget-object v0, p0, Landroid/gov/nist/core/DuplicateNameValueList;->nameValueMap:Landroid/gov/nist/core/MultiValueMapImpl;

    invoke-virtual {v0}, Landroid/gov/nist/core/MultiValueMapImpl;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
