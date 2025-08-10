.class public Landroid/gov/nist/javax/sip/message/ContentImpl;
.super Ljava/lang/Object;
.source "ContentImpl.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/message/Content;


# instance fields
.field private content:Ljava/lang/Object;

.field private contentDispositionHeader:Landroid/javax/sip/header/ContentDispositionHeader;

.field private contentTypeHeader:Landroid/javax/sip/header/ContentTypeHeader;

.field private extensionHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/javax/sip/header/Header;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "content"    # Ljava/lang/String;

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->extensionHeaders:Ljava/util/List;

    .line 65
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->content:Ljava/lang/Object;

    .line 66
    return-void
.end method


# virtual methods
.method public addExtensionHeader(Landroid/javax/sip/header/Header;)V
    .locals 1
    .param p1, "header"    # Landroid/javax/sip/header/Header;

    .line 137
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->extensionHeaders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    return-void
.end method

.method public getContent()Ljava/lang/Object;
    .locals 1

    .line 92
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->content:Ljava/lang/Object;

    return-object v0
.end method

.method public getContentDispositionHeader()Landroid/javax/sip/header/ContentDispositionHeader;
    .locals 1

    .line 126
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->contentDispositionHeader:Landroid/javax/sip/header/ContentDispositionHeader;

    return-object v0
.end method

.method public getContentTypeHeader()Landroid/javax/sip/header/ContentTypeHeader;
    .locals 1

    .line 83
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->contentTypeHeader:Landroid/javax/sip/header/ContentTypeHeader;

    return-object v0
.end method

.method public getExtensionHeaders()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Landroid/javax/sip/header/Header;",
            ">;"
        }
    .end annotation

    .line 141
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->extensionHeaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public setContent(Ljava/lang/Object;)V
    .locals 0
    .param p1, "content"    # Ljava/lang/Object;

    .line 74
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->content:Ljava/lang/Object;

    .line 75
    return-void
.end method

.method public setContentDispositionHeader(Landroid/javax/sip/header/ContentDispositionHeader;)V
    .locals 0
    .param p1, "contentDispositionHeader"    # Landroid/javax/sip/header/ContentDispositionHeader;

    .line 119
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->contentDispositionHeader:Landroid/javax/sip/header/ContentDispositionHeader;

    .line 120
    return-void
.end method

.method public setContentTypeHeader(Landroid/javax/sip/header/ContentTypeHeader;)V
    .locals 0
    .param p1, "contentTypeHeader"    # Landroid/javax/sip/header/ContentTypeHeader;

    .line 133
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->contentTypeHeader:Landroid/javax/sip/header/ContentTypeHeader;

    .line 134
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .local v0, "result":Ljava/lang/StringBuilder;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->contentTypeHeader:Landroid/javax/sip/header/ContentTypeHeader;

    if-eqz v1, :cond_0

    .line 101
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->contentTypeHeader:Landroid/javax/sip/header/ContentTypeHeader;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->contentDispositionHeader:Landroid/javax/sip/header/ContentDispositionHeader;

    if-eqz v1, :cond_1

    .line 105
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->contentDispositionHeader:Landroid/javax/sip/header/ContentDispositionHeader;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->extensionHeaders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/Header;

    .line 108
    .local v2, "header":Landroid/javax/sip/header/Header;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 109
    .end local v2    # "header":Landroid/javax/sip/header/Header;
    goto :goto_0

    .line 110
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/ContentImpl;->content:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
