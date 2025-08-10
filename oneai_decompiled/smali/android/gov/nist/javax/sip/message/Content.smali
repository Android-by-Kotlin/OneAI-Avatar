.class public interface abstract Landroid/gov/nist/javax/sip/message/Content;
.super Ljava/lang/Object;
.source "Content.java"


# virtual methods
.method public abstract getContent()Ljava/lang/Object;
.end method

.method public abstract getContentDispositionHeader()Landroid/javax/sip/header/ContentDispositionHeader;
.end method

.method public abstract getContentTypeHeader()Landroid/javax/sip/header/ContentTypeHeader;
.end method

.method public abstract getExtensionHeaders()Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Landroid/javax/sip/header/Header;",
            ">;"
        }
    .end annotation
.end method

.method public abstract setContent(Ljava/lang/Object;)V
.end method

.method public abstract toString()Ljava/lang/String;
.end method
