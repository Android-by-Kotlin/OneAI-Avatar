.class public Landroid/gov/nist/javax/sip/header/Server;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "Server.java"

# interfaces
.implements Landroid/javax/sip/header/ServerHeader;


# static fields
.field private static final serialVersionUID:J = -0x31ca4c7c2de02b7dL


# instance fields
.field protected productTokens:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 86
    const-string/jumbo v0, "Server"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 87
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Server;->productTokens:Ljava/util/List;

    .line 88
    return-void
.end method

.method private encodeProduct(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "tokens"    # Ljava/lang/StringBuilder;

    .line 63
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Server;->productTokens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 65
    .local v0, "it":Ljava/util/ListIterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 66
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 68
    const/16 v1, 0x2f

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 72
    :cond_0
    return-object p1
.end method


# virtual methods
.method public addProductToken(Ljava/lang/String;)V
    .locals 1
    .param p1, "pt"    # Ljava/lang/String;

    .line 79
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Server;->productTokens:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    return-void
.end method

.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 94
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/header/Server;->encodeProduct(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getProduct()Ljava/util/ListIterator;
    .locals 1

    .line 103
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Server;->productTokens:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Server;->productTokens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 106
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Server;->productTokens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    return-object v0

    .line 104
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public setProduct(Ljava/util/List;)V
    .locals 2
    .param p1, "product"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 117
    if-eqz p1, :cond_0

    .line 122
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Server;->productTokens:Ljava/util/List;

    .line 123
    return-void

    .line 118
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, UserAgent, setProduct(), the  product parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
