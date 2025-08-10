.class public interface abstract Landroid/javax/sip/message/Message;
.super Ljava/lang/Object;
.source "Message.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# virtual methods
.method public abstract addFirst(Landroid/javax/sip/header/Header;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;,
            Ljava/lang/NullPointerException;
        }
    .end annotation
.end method

.method public abstract addHeader(Landroid/javax/sip/header/Header;)V
.end method

.method public abstract addLast(Landroid/javax/sip/header/Header;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;,
            Ljava/lang/NullPointerException;
        }
    .end annotation
.end method

.method public abstract clone()Ljava/lang/Object;
.end method

.method public abstract equals(Ljava/lang/Object;)Z
.end method

.method public abstract getContent()Ljava/lang/Object;
.end method

.method public abstract getContentDisposition()Landroid/javax/sip/header/ContentDispositionHeader;
.end method

.method public abstract getContentEncoding()Landroid/javax/sip/header/ContentEncodingHeader;
.end method

.method public abstract getContentLanguage()Landroid/javax/sip/header/ContentLanguageHeader;
.end method

.method public abstract getContentLength()Landroid/javax/sip/header/ContentLengthHeader;
.end method

.method public abstract getExpires()Landroid/javax/sip/header/ExpiresHeader;
.end method

.method public abstract getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;
.end method

.method public abstract getHeaderNames()Ljava/util/ListIterator;
.end method

.method public abstract getHeaders(Ljava/lang/String;)Ljava/util/ListIterator;
.end method

.method public abstract getRawContent()[B
.end method

.method public abstract getSIPVersion()Ljava/lang/String;
.end method

.method public abstract getUnrecognizedHeaders()Ljava/util/ListIterator;
.end method

.method public abstract hashCode()I
.end method

.method public abstract removeContent()V
.end method

.method public abstract removeFirst(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation
.end method

.method public abstract removeHeader(Ljava/lang/String;)V
.end method

.method public abstract removeLast(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation
.end method

.method public abstract setContent(Ljava/lang/Object;Landroid/javax/sip/header/ContentTypeHeader;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setContentDisposition(Landroid/javax/sip/header/ContentDispositionHeader;)V
.end method

.method public abstract setContentEncoding(Landroid/javax/sip/header/ContentEncodingHeader;)V
.end method

.method public abstract setContentLanguage(Landroid/javax/sip/header/ContentLanguageHeader;)V
.end method

.method public abstract setContentLength(Landroid/javax/sip/header/ContentLengthHeader;)V
.end method

.method public abstract setExpires(Landroid/javax/sip/header/ExpiresHeader;)V
.end method

.method public abstract setHeader(Landroid/javax/sip/header/Header;)V
.end method

.method public abstract setSIPVersion(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract toString()Ljava/lang/String;
.end method
