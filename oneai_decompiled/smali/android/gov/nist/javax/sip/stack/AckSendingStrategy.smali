.class public interface abstract Landroid/gov/nist/javax/sip/stack/AckSendingStrategy;
.super Ljava/lang/Object;
.source "AckSendingStrategy.java"


# virtual methods
.method public abstract getLastHop()Landroid/javax/sip/address/Hop;
.end method

.method public abstract send(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
