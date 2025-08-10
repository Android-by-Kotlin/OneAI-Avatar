.class public interface abstract Landroid/gov/nist/javax/sip/message/MultipartMimeContent;
.super Ljava/lang/Object;
.source "MultipartMimeContent.java"


# virtual methods
.method public abstract add(Landroid/gov/nist/javax/sip/message/Content;)Z
.end method

.method public abstract addContent(Landroid/gov/nist/javax/sip/message/Content;)V
.end method

.method public abstract getContentCount()I
.end method

.method public abstract getContentTypeHeader()Landroid/javax/sip/header/ContentTypeHeader;
.end method

.method public abstract getContents()Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Landroid/gov/nist/javax/sip/message/Content;",
            ">;"
        }
    .end annotation
.end method

.method public abstract toString()Ljava/lang/String;
.end method
