.class public interface abstract Landroid/gov/nist/javax/sip/message/MessageExt;
.super Ljava/lang/Object;
.source "MessageExt.java"

# interfaces
.implements Landroid/javax/sip/message/Message;


# virtual methods
.method public abstract getApplicationData()Ljava/lang/Object;
.end method

.method public abstract getCSeqHeader()Landroid/javax/sip/header/CSeqHeader;
.end method

.method public abstract getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;
.end method

.method public abstract getContentLengthHeader()Landroid/javax/sip/header/ContentLengthHeader;
.end method

.method public abstract getContentTypeHeader()Landroid/javax/sip/header/ContentTypeHeader;
.end method

.method public abstract getFirstLine()Ljava/lang/String;
.end method

.method public abstract getFromHeader()Landroid/javax/sip/header/FromHeader;
.end method

.method public abstract getMultipartMimeContent()Landroid/gov/nist/javax/sip/message/MultipartMimeContent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract getToHeader()Landroid/javax/sip/header/ToHeader;
.end method

.method public abstract getTopmostViaHeader()Landroid/javax/sip/header/ViaHeader;
.end method

.method public abstract setApplicationData(Ljava/lang/Object;)V
.end method
