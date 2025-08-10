.class public Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;
.super Ljava/lang/Object;
.source "MultipartMimeContentImpl.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/message/MultipartMimeContent;


# static fields
.field public static final BOUNDARY:Ljava/lang/String; = "boundary"


# instance fields
.field private boundary:Ljava/lang/String;

.field private contentList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/gov/nist/javax/sip/message/Content;",
            ">;"
        }
    .end annotation
.end field

.field private headerFactory:Landroid/gov/nist/javax/sip/header/HeaderFactoryExt;

.field private multipartMimeContentTypeHeader:Landroid/javax/sip/header/ContentTypeHeader;


# direct methods
.method public constructor <init>(Landroid/javax/sip/header/ContentTypeHeader;)V
    .locals 1
    .param p1, "contentTypeHeader"    # Landroid/javax/sip/header/ContentTypeHeader;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->contentList:Ljava/util/List;

    .line 59
    new-instance v0, Landroid/gov/nist/javax/sip/header/HeaderFactoryImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/HeaderFactoryImpl;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->headerFactory:Landroid/gov/nist/javax/sip/header/HeaderFactoryExt;

    .line 68
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->multipartMimeContentTypeHeader:Landroid/javax/sip/header/ContentTypeHeader;

    .line 69
    const-string/jumbo v0, "boundary"

    invoke-interface {p1, v0}, Landroid/javax/sip/header/ContentTypeHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->boundary:Ljava/lang/String;

    .line 71
    return-void
.end method

.method private parseBodyPart(Ljava/lang/String;)Landroid/gov/nist/javax/sip/message/ContentImpl;
    .locals 9
    .param p1, "bodyPart"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 145
    const/4 v0, 0x0

    .line 149
    .local v0, "headers":[Ljava/lang/String;
    const-string v1, "\n"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "\r\n"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 154
    :cond_0
    const-string v1, "\r?\n\r?\n"

    const/4 v2, 0x2

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "nextPartSplit":[Ljava/lang/String;
    move-object v3, p1

    .line 158
    .local v3, "bodyContent":Ljava/lang/String;
    array-length v4, v1

    if-ne v4, v2, :cond_2

    .line 160
    const/4 v2, 0x0

    aget-object v4, v1, v2

    const-string v5, "\r?\n"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 161
    .local v4, "potentialHeaders":[Ljava/lang/String;
    aget-object v2, v4, v2

    const-string v5, ":"

    invoke-virtual {v2, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_2

    .line 162
    move-object v0, v4

    .line 163
    const/4 v2, 0x1

    aget-object v3, v1, v2

    goto :goto_1

    .line 150
    .end local v1    # "nextPartSplit":[Ljava/lang/String;
    .end local v3    # "bodyContent":Ljava/lang/String;
    .end local v4    # "potentialHeaders":[Ljava/lang/String;
    :cond_1
    :goto_0
    move-object v3, p1

    .line 168
    .restart local v3    # "bodyContent":Ljava/lang/String;
    :cond_2
    :goto_1
    new-instance v1, Landroid/gov/nist/javax/sip/message/ContentImpl;

    invoke-direct {v1, v3}, Landroid/gov/nist/javax/sip/message/ContentImpl;-><init>(Ljava/lang/String;)V

    .line 169
    .local v1, "content":Landroid/gov/nist/javax/sip/message/ContentImpl;
    if-eqz v0, :cond_5

    .line 170
    move-object v2, v0

    .local v2, "arr$":[Ljava/lang/String;
    array-length v4, v2

    .local v4, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_2
    if-ge v5, v4, :cond_5

    aget-object v6, v2, v5

    .line 171
    .local v6, "partHeader":Ljava/lang/String;
    iget-object v7, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->headerFactory:Landroid/gov/nist/javax/sip/header/HeaderFactoryExt;

    invoke-interface {v7, v6}, Landroid/gov/nist/javax/sip/header/HeaderFactoryExt;->createHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v7

    .line 172
    .local v7, "header":Landroid/javax/sip/header/Header;
    instance-of v8, v7, Landroid/javax/sip/header/ContentTypeHeader;

    if-eqz v8, :cond_3

    .line 173
    move-object v8, v7

    check-cast v8, Landroid/javax/sip/header/ContentTypeHeader;

    invoke-virtual {v1, v8}, Landroid/gov/nist/javax/sip/message/ContentImpl;->setContentTypeHeader(Landroid/javax/sip/header/ContentTypeHeader;)V

    goto :goto_3

    .line 174
    :cond_3
    instance-of v8, v7, Landroid/javax/sip/header/ContentDispositionHeader;

    if-eqz v8, :cond_4

    .line 175
    move-object v8, v7

    check-cast v8, Landroid/javax/sip/header/ContentDispositionHeader;

    invoke-virtual {v1, v8}, Landroid/gov/nist/javax/sip/message/ContentImpl;->setContentDispositionHeader(Landroid/javax/sip/header/ContentDispositionHeader;)V

    goto :goto_3

    .line 177
    :cond_4
    invoke-virtual {v1, v7}, Landroid/gov/nist/javax/sip/message/ContentImpl;->addExtensionHeader(Landroid/javax/sip/header/Header;)V

    .line 170
    .end local v6    # "partHeader":Ljava/lang/String;
    .end local v7    # "header":Landroid/javax/sip/header/Header;
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 181
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v4    # "len$":I
    .end local v5    # "i$":I
    :cond_5
    return-object v1
.end method


# virtual methods
.method public add(Landroid/gov/nist/javax/sip/message/Content;)Z
    .locals 2
    .param p1, "content"    # Landroid/gov/nist/javax/sip/message/Content;

    .line 79
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->contentList:Ljava/util/List;

    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/message/ContentImpl;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addContent(Landroid/gov/nist/javax/sip/message/Content;)V
    .locals 0
    .param p1, "content"    # Landroid/gov/nist/javax/sip/message/Content;

    .line 191
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->add(Landroid/gov/nist/javax/sip/message/Content;)Z

    .line 192
    return-void
.end method

.method public createContentList(Ljava/lang/String;)V
    .locals 4
    .param p1, "body"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 121
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->boundary:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 122
    new-instance v0, Ljava/util/Scanner;

    invoke-direct {v0, p1}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 124
    .local v0, "scanner":Ljava/util/Scanner;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\r?\n?--"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->boundary:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "(--)?\r?\n?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    .line 125
    :goto_0
    invoke-virtual {v0}, Ljava/util/Scanner;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 127
    :try_start_0
    invoke-virtual {v0}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v1

    .line 128
    .local v1, "bodyPart":Ljava/lang/String;
    invoke-direct {p0, v1}, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->parseBodyPart(Ljava/lang/String;)Landroid/gov/nist/javax/sip/message/ContentImpl;

    move-result-object v2

    .line 129
    .local v2, "partContent":Landroid/gov/nist/javax/sip/message/Content;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->contentList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    nop

    .end local v1    # "bodyPart":Ljava/lang/String;
    .end local v2    # "partContent":Landroid/gov/nist/javax/sip/message/Content;
    goto :goto_0

    .line 130
    :catch_0
    move-exception v1

    .line 134
    goto :goto_0

    .line 136
    .end local v0    # "scanner":Ljava/util/Scanner;
    :cond_0
    goto :goto_1

    .line 138
    :cond_1
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->parseBodyPart(Ljava/lang/String;)Landroid/gov/nist/javax/sip/message/ContentImpl;

    move-result-object v0

    .line 139
    .local v0, "content":Landroid/gov/nist/javax/sip/message/ContentImpl;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->getContentTypeHeader()Landroid/javax/sip/header/ContentTypeHeader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/ContentImpl;->setContentTypeHeader(Landroid/javax/sip/header/ContentTypeHeader;)V

    .line 140
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->contentList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    .end local v0    # "content":Landroid/gov/nist/javax/sip/message/ContentImpl;
    :goto_1
    return-void
.end method

.method public getContentCount()I
    .locals 1

    .line 199
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->contentList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getContentTypeHeader()Landroid/javax/sip/header/ContentTypeHeader;
    .locals 1

    .line 88
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->multipartMimeContentTypeHeader:Landroid/javax/sip/header/ContentTypeHeader;

    return-object v0
.end method

.method public getContents()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Landroid/gov/nist/javax/sip/message/Content;",
            ">;"
        }
    .end annotation

    .line 195
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->contentList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .local v0, "result":Ljava/lang/StringBuilder;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->contentList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "--"

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/message/Content;

    .line 101
    .local v2, "content":Landroid/gov/nist/javax/sip/message/Content;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->boundary:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    invoke-interface {v2}, Landroid/gov/nist/javax/sip/message/Content;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .end local v2    # "content":Landroid/gov/nist/javax/sip/message/Content;
    goto :goto_0

    .line 106
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->contentList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 107
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/MultipartMimeContentImpl;->boundary:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
