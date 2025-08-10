.class public abstract Landroid/gov/nist/core/GenericObjectList;
.super Ljava/util/LinkedList;
.source "GenericObjectList.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedList<",
        "Landroid/gov/nist/core/GenericObject;",
        ">;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field protected static final AND:Ljava/lang/String; = "&"

.field protected static final AT:Ljava/lang/String; = "@"

.field protected static final COLON:Ljava/lang/String; = ":"

.field protected static final COMMA:Ljava/lang/String; = ","

.field protected static final DOT:Ljava/lang/String; = "."

.field protected static final DOUBLE_QUOTE:Ljava/lang/String; = "\""

.field protected static final EQUALS:Ljava/lang/String; = "="

.field protected static final GREATER_THAN:Ljava/lang/String; = ">"

.field protected static final HT:Ljava/lang/String; = "\t"

.field protected static final LESS_THAN:Ljava/lang/String; = "<"

.field protected static final LPAREN:Ljava/lang/String; = "("

.field protected static final NEWLINE:Ljava/lang/String; = "\r\n"

.field protected static final PERCENT:Ljava/lang/String; = "%"

.field protected static final POUND:Ljava/lang/String; = "#"

.field protected static final QUESTION:Ljava/lang/String; = "?"

.field protected static final QUOTE:Ljava/lang/String; = "\'"

.field protected static final RETURN:Ljava/lang/String; = "\n"

.field protected static final RPAREN:Ljava/lang/String; = ")"

.field protected static final SEMICOLON:Ljava/lang/String; = ";"

.field protected static final SLASH:Ljava/lang/String; = "/"

.field protected static final SP:Ljava/lang/String; = " "

.field protected static final STAR:Ljava/lang/String; = "*"


# instance fields
.field protected indentation:I

.field protected listName:Ljava/lang/String;

.field protected myClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private myListIterator:Ljava/util/ListIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ListIterator<",
            "+",
            "Landroid/gov/nist/core/GenericObject;",
            ">;"
        }
    .end annotation
.end field

.field private stringRep:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 142
    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    .line 143
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->listName:Ljava/lang/String;

    .line 144
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    .line 145
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "lname"    # Ljava/lang/String;

    .line 148
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObjectList;-><init>()V

    .line 149
    iput-object p1, p0, Landroid/gov/nist/core/GenericObjectList;->listName:Ljava/lang/String;

    .line 150
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 0
    .param p1, "lname"    # Ljava/lang/String;
    .param p2, "objclass"    # Ljava/lang/Class;

    .line 173
    invoke-direct {p0, p1}, Landroid/gov/nist/core/GenericObjectList;-><init>(Ljava/lang/String;)V

    .line 174
    iput-object p2, p0, Landroid/gov/nist/core/GenericObjectList;->myClass:Ljava/lang/Class;

    .line 175
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "lname"    # Ljava/lang/String;
    .param p2, "classname"    # Ljava/lang/String;

    .line 158
    invoke-direct {p0, p1}, Landroid/gov/nist/core/GenericObjectList;-><init>(Ljava/lang/String;)V

    .line 160
    :try_start_0
    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->myClass:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    goto :goto_0

    .line 161
    :catch_0
    move-exception v0

    .line 162
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 165
    .end local v0    # "ex":Ljava/lang/ClassNotFoundException;
    :goto_0
    return-void
.end method

.method protected static isCloneable(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;

    .line 114
    instance-of v0, p0, Ljava/lang/Cloneable;

    return v0
.end method

.method public static isMySubclass(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 118
    .local p0, "other":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method private sprint(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 250
    if-nez p1, :cond_0

    .line 251
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->getIndentation()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    .line 252
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<null>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    .line 253
    return-void

    .line 256
    :cond_0
    const-string/jumbo v0, "}"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "]"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_2

    .line 257
    :cond_1
    iget v0, p0, Landroid/gov/nist/core/GenericObjectList;->indentation:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/gov/nist/core/GenericObjectList;->indentation:I

    .line 259
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->getIndentation()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    .line 260
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    .line 262
    const-string/jumbo v0, "{"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "["

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    .line 263
    :cond_3
    iget v0, p0, Landroid/gov/nist/core/GenericObjectList;->indentation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/gov/nist/core/GenericObjectList;->indentation:I

    .line 265
    :cond_4
    return-void
.end method


# virtual methods
.method public addFirst(Landroid/gov/nist/core/GenericObject;)V
    .locals 1
    .param p1, "objToAdd"    # Landroid/gov/nist/core/GenericObject;

    .line 303
    iget-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->myClass:Ljava/lang/Class;

    if-nez v0, :cond_0

    .line 304
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->myClass:Ljava/lang/Class;

    goto :goto_0

    .line 306
    :cond_0
    invoke-super {p0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 308
    :goto_0
    return-void
.end method

.method public bridge synthetic addFirst(Ljava/lang/Object;)V
    .locals 0

    .line 47
    check-cast p1, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {p0, p1}, Landroid/gov/nist/core/GenericObjectList;->addFirst(Landroid/gov/nist/core/GenericObject;)V

    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 3

    .line 126
    invoke-super {p0}, Ljava/util/LinkedList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/GenericObjectList;

    .line 127
    .local v0, "retval":Landroid/gov/nist/core/GenericObjectList;
    invoke-virtual {v0}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/core/GenericObject;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 128
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v2}, Landroid/gov/nist/core/GenericObject;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/GenericObject;

    .line 130
    .local v2, "obj":Landroid/gov/nist/core/GenericObject;
    invoke-interface {v1, v2}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    .line 131
    .end local v2    # "obj":Landroid/gov/nist/core/GenericObject;
    goto :goto_0

    .line 132
    .end local v1    # "iter":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/core/GenericObject;>;"
    :cond_0
    return-object v0
.end method

.method protected concatenate(Landroid/gov/nist/core/GenericObjectList;)V
    .locals 1
    .param p1, "objList"    # Landroid/gov/nist/core/GenericObjectList;

    .line 224
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/gov/nist/core/GenericObjectList;->concatenate(Landroid/gov/nist/core/GenericObjectList;Z)V

    .line 225
    return-void
.end method

.method protected concatenate(Landroid/gov/nist/core/GenericObjectList;Z)V
    .locals 1
    .param p1, "objList"    # Landroid/gov/nist/core/GenericObjectList;
    .param p2, "topFlag"    # Z

    .line 237
    if-nez p2, :cond_0

    .line 238
    invoke-virtual {p0, p1}, Landroid/gov/nist/core/GenericObjectList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 241
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/core/GenericObjectList;->addAll(ILjava/util/Collection;)Z

    .line 243
    :goto_0
    return-void
.end method

.method public debugDump()Ljava/lang/String;
    .locals 3

    .line 272
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    .line 273
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->first()Landroid/gov/nist/core/GenericObject;

    move-result-object v0

    .line 274
    .local v0, "obj":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 275
    const-string v1, "<null>"

    return-object v1

    .line 276
    :cond_0
    const-string/jumbo v1, "listName:"

    invoke-direct {p0, v1}, Landroid/gov/nist/core/GenericObjectList;->sprint(Ljava/lang/String;)V

    .line 277
    iget-object v1, p0, Landroid/gov/nist/core/GenericObjectList;->listName:Ljava/lang/String;

    invoke-direct {p0, v1}, Landroid/gov/nist/core/GenericObjectList;->sprint(Ljava/lang/String;)V

    .line 278
    const-string/jumbo v1, "{"

    invoke-direct {p0, v1}, Landroid/gov/nist/core/GenericObjectList;->sprint(Ljava/lang/String;)V

    .line 279
    :goto_0
    if-eqz v0, :cond_1

    .line 280
    const-string/jumbo v1, "["

    invoke-direct {p0, v1}, Landroid/gov/nist/core/GenericObjectList;->sprint(Ljava/lang/String;)V

    .line 281
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/core/GenericObject;

    iget v2, p0, Landroid/gov/nist/core/GenericObjectList;->indentation:I

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/GenericObject;->debugDump(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Landroid/gov/nist/core/GenericObjectList;->sprint(Ljava/lang/String;)V

    .line 282
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->next()Landroid/gov/nist/core/GenericObject;

    move-result-object v0

    .line 283
    const-string/jumbo v1, "]"

    invoke-direct {p0, v1}, Landroid/gov/nist/core/GenericObjectList;->sprint(Ljava/lang/String;)V

    goto :goto_0

    .line 285
    :cond_1
    const-string/jumbo v1, "}"

    invoke-direct {p0, v1}, Landroid/gov/nist/core/GenericObjectList;->sprint(Ljava/lang/String;)V

    .line 286
    iget-object v1, p0, Landroid/gov/nist/core/GenericObjectList;->stringRep:Ljava/lang/String;

    return-object v1
.end method

.method public debugDump(I)Ljava/lang/String;
    .locals 2
    .param p1, "indent"    # I

    .line 295
    iget v0, p0, Landroid/gov/nist/core/GenericObjectList;->indentation:I

    .line 296
    .local v0, "save":I
    iput p1, p0, Landroid/gov/nist/core/GenericObjectList;->indentation:I

    .line 297
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->debugDump()Ljava/lang/String;

    move-result-object v1

    .line 298
    .local v1, "retval":Ljava/lang/String;
    iput v0, p0, Landroid/gov/nist/core/GenericObjectList;->indentation:I

    .line 299
    return-object v1
.end method

.method public encode()Ljava/lang/String;
    .locals 5

    .line 345
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 346
    const-string v0, ""

    return-object v0

    .line 347
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 348
    .local v0, "encoding":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 349
    .local v1, "iterator":Ljava/util/ListIterator;
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 351
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 352
    .local v2, "obj":Ljava/lang/Object;
    instance-of v3, v2, Landroid/gov/nist/core/GenericObject;

    if-eqz v3, :cond_1

    .line 353
    move-object v3, v2

    check-cast v3, Landroid/gov/nist/core/GenericObject;

    .line 354
    .local v3, "gobj":Landroid/gov/nist/core/GenericObject;
    invoke-virtual {v3}, Landroid/gov/nist/core/GenericObject;->encode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .end local v3    # "gobj":Landroid/gov/nist/core/GenericObject;
    goto :goto_1

    .line 356
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    :goto_1
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 359
    const-string v3, ";"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .end local v2    # "obj":Ljava/lang/Object;
    goto :goto_0

    .line 364
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "other"    # Ljava/lang/Object;

    .line 387
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 388
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 389
    return v0

    .line 390
    :cond_1
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/core/GenericObjectList;

    .line 391
    .local v1, "that":Landroid/gov/nist/core/GenericObjectList;
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->size()I

    move-result v2

    invoke-virtual {v1}, Landroid/gov/nist/core/GenericObjectList;->size()I

    move-result v3

    if-eq v2, v3, :cond_2

    .line 392
    return v0

    .line 393
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    .line 394
    .local v2, "myIterator":Ljava/util/ListIterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 395
    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 396
    .local v3, "myobj":Ljava/lang/Object;
    invoke-virtual {v1}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v4

    .line 399
    .local v4, "hisIterator":Ljava/util/ListIterator;
    :goto_1
    :try_start_0
    invoke-interface {v4}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 400
    .local v5, "hisobj":Ljava/lang/Object;
    invoke-virtual {v3, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v6, :cond_3

    .line 401
    nop

    .line 405
    .end local v5    # "hisobj":Ljava/lang/Object;
    nop

    .line 406
    .end local v3    # "myobj":Ljava/lang/Object;
    .end local v4    # "hisIterator":Ljava/util/ListIterator;
    goto :goto_0

    .line 402
    .restart local v3    # "myobj":Ljava/lang/Object;
    .restart local v4    # "hisIterator":Ljava/util/ListIterator;
    :cond_3
    goto :goto_1

    .line 403
    :catch_0
    move-exception v5

    .line 404
    .local v5, "ex":Ljava/util/NoSuchElementException;
    return v0

    .line 407
    .end local v3    # "myobj":Ljava/lang/Object;
    .end local v4    # "hisIterator":Ljava/util/ListIterator;
    .end local v5    # "ex":Ljava/util/NoSuchElementException;
    :cond_4
    invoke-virtual {v1}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v3

    .line 408
    .local v3, "hisIterator":Ljava/util/ListIterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/ListIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 409
    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 410
    .local v4, "hisobj":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    .line 413
    :goto_3
    :try_start_1
    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 414
    .local v5, "myobj":Ljava/lang/Object;
    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v6, :cond_5

    .line 415
    nop

    .line 419
    .end local v5    # "myobj":Ljava/lang/Object;
    nop

    .line 420
    .end local v4    # "hisobj":Ljava/lang/Object;
    goto :goto_2

    .line 416
    .restart local v4    # "hisobj":Ljava/lang/Object;
    :cond_5
    goto :goto_3

    .line 417
    :catch_1
    move-exception v5

    .line 418
    .local v5, "ex":Ljava/util/NoSuchElementException;
    return v0

    .line 421
    .end local v4    # "hisobj":Ljava/lang/Object;
    .end local v5    # "ex":Ljava/util/NoSuchElementException;
    :cond_6
    const/4 v0, 0x1

    return v0
.end method

.method protected first()Landroid/gov/nist/core/GenericObject;
    .locals 2

    .line 193
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/GenericObjectList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->myListIterator:Ljava/util/ListIterator;

    .line 195
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->myListIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/GenericObject;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 196
    :catch_0
    move-exception v0

    .line 197
    .local v0, "ex":Ljava/util/NoSuchElementException;
    const/4 v1, 0x0

    return-object v1
.end method

.method protected getIndentation()Ljava/lang/String;
    .locals 2

    .line 105
    iget v0, p0, Landroid/gov/nist/core/GenericObjectList;->indentation:I

    new-array v0, v0, [C

    .line 106
    .local v0, "chars":[C
    const/16 v1, 0x20

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([CC)V

    .line 107
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    return-object v1
.end method

.method public hashCode()I
    .locals 1

    .line 377
    const/16 v0, 0x2a

    return v0
.end method

.method public match(Ljava/lang/Object;)Z
    .locals 9
    .param p1, "other"    # Ljava/lang/Object;

    .line 434
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 435
    return v1

    .line 436
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/core/GenericObjectList;

    .line 437
    .local v0, "that":Landroid/gov/nist/core/GenericObjectList;
    invoke-virtual {v0}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    .line 438
    .local v2, "hisIterator":Ljava/util/ListIterator;
    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 439
    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 440
    .local v3, "hisobj":Ljava/lang/Object;
    const/4 v4, 0x0

    .line 441
    .local v4, "myobj":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v5

    .line 442
    .local v5, "myIterator":Ljava/util/ListIterator;
    :cond_1
    invoke-interface {v5}, Ljava/util/ListIterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 443
    invoke-interface {v5}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 444
    instance-of v6, v4, Landroid/gov/nist/core/GenericObject;

    if-eqz v6, :cond_2

    .line 445
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Trying to match  = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object v8, v4

    check-cast v8, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v8}, Landroid/gov/nist/core/GenericObject;->encode()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 447
    :cond_2
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_3

    move-object v6, v4

    check-cast v6, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/GenericObject;->match(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 449
    goto :goto_0

    .line 450
    :cond_3
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6}, Landroid/gov/nist/core/GenericObjectList;->isMySubclass(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_1

    move-object v6, v4

    check-cast v6, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/GenericObjectList;->match(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 452
    goto :goto_0

    .line 454
    :cond_4
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move-object v7, v3

    check-cast v7, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v7}, Landroid/gov/nist/core/GenericObject;->encode()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 455
    return v1

    .line 457
    .end local v3    # "hisobj":Ljava/lang/Object;
    .end local v4    # "myobj":Ljava/lang/Object;
    .end local v5    # "myIterator":Ljava/util/ListIterator;
    :cond_5
    :goto_0
    const/4 v1, 0x1

    return v1
.end method

.method public mergeObjects(Landroid/gov/nist/core/GenericObjectList;)V
    .locals 4
    .param p1, "mergeList"    # Landroid/gov/nist/core/GenericObjectList;

    .line 325
    if-nez p1, :cond_0

    .line 326
    return-void

    .line 327
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 328
    .local v0, "it1":Ljava/util/Iterator;
    invoke-virtual {p1}, Landroid/gov/nist/core/GenericObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 329
    .local v1, "it2":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 330
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/GenericObject;

    .line 331
    .local v2, "outerObj":Landroid/gov/nist/core/GenericObject;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 332
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 333
    .local v3, "innerObj":Ljava/lang/Object;
    invoke-virtual {v2, v3}, Landroid/gov/nist/core/GenericObject;->merge(Ljava/lang/Object;)V

    .line 334
    .end local v3    # "innerObj":Ljava/lang/Object;
    goto :goto_1

    .line 335
    .end local v2    # "outerObj":Landroid/gov/nist/core/GenericObject;
    :cond_1
    goto :goto_0

    .line 336
    :cond_2
    return-void
.end method

.method protected next()Landroid/gov/nist/core/GenericObject;
    .locals 2

    .line 205
    iget-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->myListIterator:Ljava/util/ListIterator;

    if-nez v0, :cond_0

    .line 206
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/GenericObjectList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->myListIterator:Ljava/util/ListIterator;

    .line 209
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/core/GenericObjectList;->myListIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/GenericObject;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 210
    :catch_0
    move-exception v0

    .line 211
    .local v0, "ex":Ljava/util/NoSuchElementException;
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/gov/nist/core/GenericObjectList;->myListIterator:Ljava/util/ListIterator;

    .line 212
    return-object v1
.end method

.method protected next(Ljava/util/ListIterator;)Landroid/gov/nist/core/GenericObject;
    .locals 2
    .param p1, "iterator"    # Ljava/util/ListIterator;

    .line 182
    :try_start_0
    invoke-interface {p1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/GenericObject;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 183
    :catch_0
    move-exception v0

    .line 184
    .local v0, "ex":Ljava/util/NoSuchElementException;
    const/4 v1, 0x0

    return-object v1
.end method

.method public setMyClass(Ljava/lang/Class;)V
    .locals 0
    .param p1, "cl"    # Ljava/lang/Class;

    .line 138
    iput-object p1, p0, Landroid/gov/nist/core/GenericObjectList;->myClass:Ljava/lang/Class;

    .line 139
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 371
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObjectList;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
