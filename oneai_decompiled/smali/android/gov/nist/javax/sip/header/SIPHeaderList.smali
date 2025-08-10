.class public abstract Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "SIPHeaderList.java"

# interfaces
.implements Ljava/util/List;
.implements Landroid/javax/sip/header/Header;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<HDR:",
        "Landroid/gov/nist/javax/sip/header/SIPHeader;",
        ">",
        "Landroid/gov/nist/javax/sip/header/SIPHeader;",
        "Ljava/util/List<",
        "THDR;>;",
        "Landroid/javax/sip/header/Header;"
    }
.end annotation


# static fields
.field private static prettyEncode:Z


# instance fields
.field protected hlist:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "THDR;>;"
        }
    .end annotation
.end field

.field private myClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "THDR;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 51
    const/4 v0, 0x0

    sput-boolean v0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->prettyEncode:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 64
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>()V

    .line 65
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    .line 66
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .param p2, "hname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "THDR;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 77
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "objclass":Ljava/lang/Class;, "Ljava/lang/Class<THDR;>;"
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>()V

    .line 78
    iput-object p2, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    .line 79
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->myClass:Ljava/lang/Class;

    .line 80
    return-void
.end method

.method public static setPrettyEncode(Z)V
    .locals 0
    .param p0, "flag"    # Z

    .line 660
    sput-boolean p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->prettyEncode:Z

    .line 661
    return-void
.end method


# virtual methods
.method public add(ILandroid/gov/nist/javax/sip/header/SIPHeader;)V
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITHDR;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IndexOutOfBoundsException;
        }
    .end annotation

    .line 381
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p2, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;, "THDR;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 382
    return-void
.end method

.method public bridge synthetic add(ILjava/lang/Object;)V
    .locals 0

    .line 49
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    check-cast p2, Landroid/gov/nist/javax/sip/header/SIPHeader;

    invoke-virtual {p0, p1, p2}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->add(ILandroid/gov/nist/javax/sip/header/SIPHeader;)V

    return-void
.end method

.method public add(Landroid/gov/nist/javax/sip/header/SIPHeader;Z)V
    .locals 0
    .param p2, "top"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THDR;Z)V"
        }
    .end annotation

    .line 113
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "sipheader":Landroid/gov/nist/javax/sip/header/SIPHeader;, "THDR;"
    if-eqz p2, :cond_0

    .line 114
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->addFirst(Landroid/gov/nist/javax/sip/header/SIPHeader;)V

    goto :goto_0

    .line 116
    :cond_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 117
    :goto_0
    return-void
.end method

.method public add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THDR;)Z"
        }
    .end annotation

    .line 89
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "objectToAdd":Landroid/gov/nist/javax/sip/header/SIPHeader;, "THDR;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 0

    .line 49
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    check-cast p1, Landroid/gov/nist/javax/sip/header/SIPHeader;

    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    move-result p1

    return p1
.end method

.method public addAll(ILjava/util/Collection;)Z
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection<",
            "+THDR;>;)Z"
        }
    .end annotation

    .line 524
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p2, "collection":Ljava/util/Collection;, "Ljava/util/Collection<+THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+THDR;>;)Z"
        }
    .end annotation

    .line 520
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<+THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public addFirst(Landroid/gov/nist/javax/sip/header/SIPHeader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THDR;)V"
        }
    .end annotation

    .line 101
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "obj":Landroid/gov/nist/javax/sip/header/SIPHeader;, "THDR;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 102
    return-void
.end method

.method public clear()V
    .locals 1

    .line 536
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 537
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 4

    .line 450
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 452
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    move-object v2, v1

    check-cast v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 453
    .local v2, "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    move-object v3, v1

    check-cast v3, [Ljava/lang/Object;

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 454
    .local v1, "retval":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    iput-object v3, v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    .line 455
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->myClass:Ljava/lang/Class;

    iput-object v3, v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->myClass:Ljava/lang/Class;

    .line 456
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 457
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "retval":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .end local v2    # "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :catch_0
    move-exception v0

    .line 458
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Could not clone!"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected final clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "THDR;>;)",
            "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
            "THDR;>;"
        }
    .end annotation

    .line 463
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "hlistToClone":Ljava/util/List;, "Ljava/util/List<THDR;>;"
    if-eqz p1, :cond_0

    .line 464
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<THDR;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 465
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/header/Header;

    .line 466
    .local v1, "h":Landroid/javax/sip/header/Header;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v1}, Landroid/javax/sip/header/Header;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/SIPHeader;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 467
    .end local v1    # "h":Landroid/javax/sip/header/Header;
    goto :goto_0

    .line 469
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<THDR;>;"
    :cond_0
    return-object p0
.end method

.method public concatenate(Landroid/gov/nist/javax/sip/header/SIPHeaderList;Z)V
    .locals 1
    .param p2, "topFlag"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
            "THDR;>;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 133
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "other":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    if-nez p2, :cond_0

    .line 134
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 137
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->addAll(ILjava/util/Collection;)Z

    .line 140
    :goto_0
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "header"    # Ljava/lang/Object;

    .line 540
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 529
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public debugDump()Ljava/lang/String;
    .locals 1

    .line 348
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->debugDump(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public debugDump(I)Ljava/lang/String;
    .locals 6
    .param p1, "indentation"    # I

    .line 327
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->stringRepresentation:Ljava/lang/String;

    .line 328
    new-instance v0, Landroid/gov/nist/javax/sip/header/Indentation;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/header/Indentation;-><init>(I)V

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Indentation;->getIndentation()Ljava/lang/String;

    move-result-object v0

    .line 330
    .local v0, "indent":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 331
    .local v1, "className":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->sprint(Ljava/lang/String;)V

    .line 332
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "{"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->sprint(Ljava/lang/String;)V

    .line 334
    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<THDR;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 335
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 336
    .local v3, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;, "THDR;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/SIPHeader;->debugDump()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->sprint(Ljava/lang/String;)V

    .line 337
    .end local v3    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;, "THDR;"
    goto :goto_0

    .line 338
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<THDR;>;"
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->sprint(Ljava/lang/String;)V

    .line 339
    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->stringRepresentation:Ljava/lang/String;

    return-object v2
.end method

.method public encode()Ljava/lang/String;
    .locals 1

    .line 151
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 3
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 155
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const-string v1, "\r\n"

    if-eqz v0, :cond_0

    .line 156
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v2, 0x3a

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 161
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    const-string/jumbo v2, "WWW-Authenticate"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    const-string/jumbo v2, "Proxy-Authenticate"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    const-string v2, "Authorization"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    const-string/jumbo v2, "Proxy-Authorization"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    sget-boolean v0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->prettyEncode:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    const-string/jumbo v2, "Via"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    const-string/jumbo v2, "Route"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    const-string/jumbo v2, "Record-Route"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v2, Landroid/gov/nist/javax/sip/header/ExtensionHeaderList;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 176
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 178
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 168
    :cond_3
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 169
    .local v0, "li":Ljava/util/ListIterator;, "Ljava/util/ListIterator<THDR;>;"
    :goto_1
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 170
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 171
    .local v1, "sipheader":Landroid/gov/nist/javax/sip/header/SIPHeader;, "THDR;"
    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/header/SIPHeader;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 172
    .end local v1    # "sipheader":Landroid/gov/nist/javax/sip/header/SIPHeader;, "THDR;"
    goto :goto_1

    .line 173
    .end local v0    # "li":Ljava/util/ListIterator;, "Ljava/util/ListIterator<THDR;>;"
    :cond_4
    nop

    .line 181
    :goto_2
    return-object p1
.end method

.method protected encodeBody()Ljava/lang/String;
    .locals 1

    .line 496
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 4
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 500
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 502
    .local v0, "iterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<THDR;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 503
    .local v1, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    if-eq v1, p0, :cond_2

    .line 504
    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/header/SIPHeader;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 506
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 507
    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    const-string/jumbo v3, "Privacy"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 508
    const-string v2, ","

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 510
    :cond_0
    const-string v2, ";"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 511
    goto :goto_0

    .line 516
    .end local v1    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_1
    return-object p1

    .line 503
    .restart local v1    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_2
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "Unexpected circularity in SipHeaderList"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "other"    # Ljava/lang/Object;

    .line 396
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 397
    return v0

    .line 399
    :cond_0
    instance-of v1, p1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    const/4 v2, 0x0

    if-eqz v1, :cond_5

    .line 400
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 401
    .local v1, "that":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    iget-object v4, v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    if-ne v3, v4, :cond_1

    .line 402
    return v0

    .line 403
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    if-nez v3, :cond_4

    .line 404
    iget-object v3, v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    if-eqz v3, :cond_3

    iget-object v3, v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :cond_3
    :goto_0
    return v0

    .line 405
    :cond_4
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    iget-object v2, v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 407
    .end local v1    # "that":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_5
    return v2
.end method

.method public get(I)Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)THDR;"
        }
    .end annotation

    .line 552
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeader;

    return-object v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 49
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->get(I)Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object p1

    return-object p1
.end method

.method public getFirst()Landroid/javax/sip/header/Header;
    .locals 2

    .line 212
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 215
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/Header;

    return-object v0

    .line 213
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHeaderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "THDR;>;"
        }
    .end annotation

    .line 263
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    return-object v0
.end method

.method public getHeadersAsEncodedStrings()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 193
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 195
    .local v0, "retval":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 196
    .local v1, "li":Ljava/util/ListIterator;, "Ljava/util/ListIterator<THDR;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 197
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/Header;

    .line 198
    .local v2, "sipheader":Landroid/javax/sip/header/Header;
    invoke-interface {v2}, Landroid/javax/sip/header/Header;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    .end local v2    # "sipheader":Landroid/javax/sip/header/Header;
    goto :goto_0

    .line 202
    :cond_0
    return-object v0
.end method

.method public getLast()Landroid/javax/sip/header/Header;
    .locals 2

    .line 224
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 226
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/Header;

    return-object v0

    .line 225
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMyClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "THDR;>;"
        }
    .end annotation

    .line 235
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->myClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 60
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 644
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->headerName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public indexOf(Landroid/gov/nist/core/GenericObject;)I
    .locals 1
    .param p1, "gobj"    # Landroid/gov/nist/core/GenericObject;

    .line 367
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .line 562
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 244
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isHeaderList()Z
    .locals 1

    .line 486
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "THDR;>;"
        }
    .end annotation

    .line 573
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .line 584
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public listIterator()Ljava/util/ListIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator<",
            "THDR;>;"
        }
    .end annotation

    .line 254
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ListIterator<",
            "THDR;>;"
        }
    .end annotation

    .line 274
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public match(Landroid/gov/nist/javax/sip/header/SIPHeaderList;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
            "*>;)Z"
        }
    .end annotation

    .line 415
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "template":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<*>;"
    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 416
    return v0

    .line 417
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 418
    return v2

    .line 419
    :cond_1
    move-object v1, p1

    .line 420
    .local v1, "that":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    iget-object v4, v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    if-ne v3, v4, :cond_2

    .line 421
    return v0

    .line 422
    :cond_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    if-nez v3, :cond_3

    .line 423
    return v2

    .line 426
    :cond_3
    iget-object v3, v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 427
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 429
    .local v4, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    const/4 v5, 0x0

    .line 430
    .local v5, "found":Z
    iget-object v6, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 431
    .local v6, "it1":Ljava/util/Iterator;, "Ljava/util/Iterator<THDR;>;"
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    if-nez v5, :cond_4

    .line 432
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 433
    .local v7, "sipHeader1":Landroid/gov/nist/javax/sip/header/SIPHeader;
    invoke-virtual {v7, v4}, Landroid/gov/nist/javax/sip/header/SIPHeader;->match(Ljava/lang/Object;)Z

    move-result v5

    .line 434
    .end local v7    # "sipHeader1":Landroid/gov/nist/javax/sip/header/SIPHeader;
    goto :goto_1

    .line 435
    .end local v6    # "it1":Ljava/util/Iterator;, "Ljava/util/Iterator<THDR;>;"
    :cond_4
    if-nez v5, :cond_5

    .line 436
    return v2

    .line 437
    .end local v4    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .end local v5    # "found":Z
    :cond_5
    goto :goto_0

    .line 438
    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_6
    return v0
.end method

.method public remove(I)Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)THDR;"
        }
    .end annotation

    .line 608
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeader;

    return-object v0
.end method

.method public bridge synthetic remove(I)Ljava/lang/Object;
    .locals 0

    .line 49
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->remove(I)Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object p1

    return-object p1
.end method

.method public remove(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THDR;)Z"
        }
    .end annotation

    .line 302
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "obj":Landroid/gov/nist/javax/sip/header/SIPHeader;, "THDR;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 303
    const/4 v0, 0x0

    return v0

    .line 305
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .line 597
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 616
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public removeFirst()V
    .locals 2

    .line 281
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 284
    :cond_0
    return-void
.end method

.method public removeLast()V
    .locals 2

    .line 290
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 291
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 292
    :cond_0
    return-void
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 625
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public set(ILandroid/gov/nist/javax/sip/header/SIPHeader;)Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITHDR;)THDR;"
        }
    .end annotation

    .line 654
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p2, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;, "THDR;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/SIPHeader;

    return-object v0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 49
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    check-cast p2, Landroid/gov/nist/javax/sip/header/SIPHeader;

    invoke-virtual {p0, p1, p2}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->set(ILandroid/gov/nist/javax/sip/header/SIPHeader;)Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object p1

    return-object p1
.end method

.method protected setMyClass(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "THDR;>;)V"
        }
    .end annotation

    .line 316
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<THDR;>;"
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->myClass:Ljava/lang/Class;

    .line 317
    return-void
.end method

.method public size()I
    .locals 1

    .line 476
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public subList(II)Ljava/util/List;
    .locals 1
    .param p1, "index1"    # I
    .param p2, "index2"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "THDR;>;"
        }
    .end annotation

    .line 634
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 1

    .line 357
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .line 665
    .local p0, "this":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<THDR;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->hlist:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
