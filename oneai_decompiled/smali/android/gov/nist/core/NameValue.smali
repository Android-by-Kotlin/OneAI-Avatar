.class public Landroid/gov/nist/core/NameValue;
.super Landroid/gov/nist/core/GenericObject;
.source "NameValue.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/core/GenericObject;",
        "Ljava/util/Map$Entry<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x19c7fab1bcbf73beL


# instance fields
.field protected final isFlagParameter:Z

.field protected isQuotedString:Z

.field private name:Ljava/lang/String;

.field private quotes:Ljava/lang/String;

.field private separator:Ljava/lang/String;

.field private value:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 63
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObject;-><init>()V

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    .line 65
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    .line 66
    const-string v1, "="

    iput-object v1, p0, Landroid/gov/nist/core/NameValue;->separator:Ljava/lang/String;

    .line 67
    iput-object v0, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/core/NameValue;->isFlagParameter:Z

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "n"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/Object;

    .line 96
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 97
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;Z)V
    .locals 1
    .param p1, "n"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/Object;
    .param p3, "isFlag"    # Z

    .line 78
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObject;-><init>()V

    .line 82
    iput-object p1, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    .line 83
    iput-object p2, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    .line 84
    const-string v0, "="

    iput-object v0, p0, Landroid/gov/nist/core/NameValue;->separator:Ljava/lang/String;

    .line 85
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    .line 86
    iput-boolean p3, p0, Landroid/gov/nist/core/NameValue;->isFlagParameter:Z

    .line 87
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 224
    invoke-super {p0}, Landroid/gov/nist/core/GenericObject;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/NameValue;

    .line 225
    .local v0, "retval":Landroid/gov/nist/core/NameValue;
    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    if-eqz v1, :cond_0

    .line 226
    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-static {v1}, Landroid/gov/nist/core/NameValue;->makeClone(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    .line 227
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 1

    .line 170
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/NameValue;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 3
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 174
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Landroid/gov/nist/core/NameValue;->isFlagParameter:Z

    if-nez v0, :cond_4

    .line 175
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 176
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    check-cast v0, Landroid/gov/nist/core/GenericObject;

    .line 177
    .local v0, "gv":Landroid/gov/nist/core/GenericObject;
    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/core/NameValue;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    invoke-virtual {v0, p1}, Landroid/gov/nist/core/GenericObject;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 179
    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    return-object p1

    .line 181
    .end local v0    # "gv":Landroid/gov/nist/core/GenericObject;
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/core/GenericObjectList;->isMySubclass(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 182
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    check-cast v0, Landroid/gov/nist/core/GenericObjectList;

    .line 183
    .local v0, "gvlist":Landroid/gov/nist/core/GenericObjectList;
    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/core/NameValue;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/gov/nist/core/GenericObjectList;->encode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    return-object p1

    .line 185
    .end local v0    # "gvlist":Landroid/gov/nist/core/GenericObjectList;
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_3

    .line 191
    iget-boolean v0, p0, Landroid/gov/nist/core/NameValue;->isQuotedString:Z

    if-eqz v0, :cond_2

    .line 192
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    return-object p1

    .line 195
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    return-object p1

    .line 199
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    return-object p1

    .line 202
    :cond_4
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    if-nez v0, :cond_7

    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    if-eqz v0, :cond_7

    .line 203
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 204
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    check-cast v0, Landroid/gov/nist/core/GenericObject;

    .line 205
    .local v0, "gv":Landroid/gov/nist/core/GenericObject;
    invoke-virtual {v0, p1}, Landroid/gov/nist/core/GenericObject;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 206
    return-object p1

    .line 207
    .end local v0    # "gv":Landroid/gov/nist/core/GenericObject;
    :cond_5
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/core/GenericObjectList;->isMySubclass(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 208
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    check-cast v0, Landroid/gov/nist/core/GenericObjectList;

    .line 209
    .local v0, "gvlist":Landroid/gov/nist/core/GenericObjectList;
    invoke-virtual {v0}, Landroid/gov/nist/core/GenericObjectList;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    return-object p1

    .line 212
    .end local v0    # "gvlist":Landroid/gov/nist/core/GenericObjectList;
    :cond_6
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    return-object p1

    .line 215
    :cond_7
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    if-eqz v0, :cond_8

    iget-boolean v0, p0, Landroid/gov/nist/core/NameValue;->isFlagParameter:Z

    if-eqz v0, :cond_9

    .line 216
    :cond_8
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    return-object p1

    .line 219
    :cond_9
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "other"    # Ljava/lang/Object;

    .line 234
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 235
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 236
    return v0

    .line 237
    :cond_1
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/core/NameValue;

    .line 238
    .local v1, "that":Landroid/gov/nist/core/NameValue;
    const/4 v2, 0x1

    if-ne p0, v1, :cond_2

    .line 239
    return v2

    .line 240
    :cond_2
    iget-object v3, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    if-nez v3, :cond_3

    iget-object v3, v1, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    if-nez v3, :cond_4

    :cond_3
    iget-object v3, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, v1, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    if-nez v3, :cond_5

    .line 242
    :cond_4
    return v0

    .line 243
    :cond_5
    iget-object v3, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    if-eqz v3, :cond_6

    iget-object v3, v1, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    if-eqz v3, :cond_6

    iget-object v3, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    iget-object v4, v1, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_6

    .line 245
    return v0

    .line 246
    :cond_6
    iget-object v3, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    if-eqz v3, :cond_7

    iget-object v3, v1, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    if-eqz v3, :cond_8

    :cond_7
    iget-object v3, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    if-nez v3, :cond_9

    iget-object v3, v1, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    if-eqz v3, :cond_9

    .line 248
    :cond_8
    return v0

    .line 249
    :cond_9
    iget-object v3, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    iget-object v4, v1, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    if-ne v3, v4, :cond_a

    .line 250
    return v2

    .line 251
    :cond_a
    iget-object v3, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    instance-of v3, v3, Ljava/lang/String;

    if-eqz v3, :cond_d

    .line 253
    iget-boolean v3, p0, Landroid/gov/nist/core/NameValue;->isQuotedString:Z

    if-eqz v3, :cond_b

    .line 254
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    iget-object v2, v1, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 255
    :cond_b
    iget-object v3, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    .line 256
    .local v3, "val":Ljava/lang/String;
    iget-object v4, v1, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    .line 257
    .local v4, "val1":Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_c

    move v0, v2

    :cond_c
    return v0

    .line 259
    .end local v3    # "val":Ljava/lang/String;
    .end local v4    # "val1":Ljava/lang/String;
    :cond_d
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    iget-object v2, v1, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .locals 1

    .line 47
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValue;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 268
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 123
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .locals 1

    .line 47
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValue;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 277
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 278
    const/4 v0, 0x0

    return-object v0

    .line 280
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValueAsObject()Ljava/lang/Object;
    .locals 1

    .line 127
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/NameValue;->getValueAsObject(Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getValueAsObject(Z)Ljava/lang/Object;
    .locals 2
    .param p1, "stripQuotes"    # Z

    .line 131
    iget-boolean v0, p0, Landroid/gov/nist/core/NameValue;->isFlagParameter:Z

    if-eqz v0, :cond_0

    .line 132
    const-string v0, ""

    return-object v0

    .line 136
    :cond_0
    if-nez p1, :cond_1

    iget-boolean v0, p0, Landroid/gov/nist/core/NameValue;->isQuotedString:Z

    if-eqz v0, :cond_1

    .line 137
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 139
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 296
    invoke-virtual {p0}, Landroid/gov/nist/core/NameValue;->encode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isValueQuoted()Z
    .locals 1

    .line 119
    iget-boolean v0, p0, Landroid/gov/nist/core/NameValue;->isQuotedString:Z

    return v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "n"    # Ljava/lang/String;

    .line 146
    iput-object p1, p0, Landroid/gov/nist/core/NameValue;->name:Ljava/lang/String;

    .line 147
    return-void
.end method

.method public setQuotedValue()V
    .locals 1

    .line 111
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/core/NameValue;->isQuotedString:Z

    .line 112
    const-string v0, "\""

    iput-object v0, p0, Landroid/gov/nist/core/NameValue;->quotes:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public setSeparator(Ljava/lang/String;)V
    .locals 0
    .param p1, "sep"    # Ljava/lang/String;

    .line 103
    iput-object p1, p0, Landroid/gov/nist/core/NameValue;->separator:Ljava/lang/String;

    .line 104
    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 47
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/gov/nist/core/NameValue;->setValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public setValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 288
    iget-object v0, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    move-object v0, p1

    .line 289
    .local v0, "retval":Ljava/lang/String;
    :goto_0
    iput-object p1, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    .line 290
    return-object v0
.end method

.method public setValueAsObject(Ljava/lang/Object;)V
    .locals 0
    .param p1, "v"    # Ljava/lang/Object;

    .line 153
    iput-object p1, p0, Landroid/gov/nist/core/NameValue;->value:Ljava/lang/Object;

    .line 154
    return-void
.end method
