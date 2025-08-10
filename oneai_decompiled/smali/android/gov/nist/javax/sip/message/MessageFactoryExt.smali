.class public interface abstract Landroid/gov/nist/javax/sip/message/MessageFactoryExt;
.super Ljava/lang/Object;
.source "MessageFactoryExt.java"

# interfaces
.implements Landroid/javax/sip/message/MessageFactory;


# virtual methods
.method public abstract createMultipartMimeContent(Landroid/javax/sip/header/ContentTypeHeader;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/gov/nist/javax/sip/message/MultipartMimeContent;
.end method

.method public abstract setDefaultContentEncodingCharset(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract setDefaultServerHeader(Landroid/javax/sip/header/ServerHeader;)V
.end method

.method public abstract setDefaultUserAgentHeader(Landroid/javax/sip/header/UserAgentHeader;)V
.end method
