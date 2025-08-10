.class public Landroid/gov/nist/javax/sip/header/UserAgent;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "UserAgent.java"

# interfaces
.implements Landroid/javax/sip/header/UserAgentHeader;


# static fields
.field private static final serialVersionUID:J = 0x3f4cc6de175b3c07L


# instance fields
.field protected productTokens:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 81
    const-string/jumbo v0, "User-Agent"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 82
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/UserAgent;->productTokens:Ljava/util/List;

    .line 83
    return-void
.end method

.method private encodeProduct(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "tokens"    # Ljava/lang/StringBuilder;

    .line 61
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/UserAgent;->productTokens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 63
    .local v0, "it":Ljava/util/ListIterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 64
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 67
    :cond_0
    return-object p1
.end method


# virtual methods
.method public addProductToken(Ljava/lang/String;)V
    .locals 1
    .param p1, "pt"    # Ljava/lang/String;

    .line 74
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/UserAgent;->productTokens:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 3

    .line 121
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/UserAgent;

    .line 122
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/UserAgent;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/UserAgent;->productTokens:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 123
    new-instance v1, Ljava/util/LinkedList;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/UserAgent;->productTokens:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/UserAgent;->productTokens:Ljava/util/List;

    .line 124
    :cond_0
    return-object v0
.end method

.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 89
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/header/UserAgent;->encodeProduct(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getProduct()Ljava/util/ListIterator;
    .locals 1

    .line 98
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/UserAgent;->productTokens:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/UserAgent;->productTokens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 101
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/UserAgent;->productTokens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    return-object v0

    .line 99
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

    .line 112
    if-eqz p1, :cond_0

    .line 117
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/UserAgent;->productTokens:Ljava/util/List;

    .line 118
    return-void

    .line 113
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, UserAgent, setProduct(), the  product parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
