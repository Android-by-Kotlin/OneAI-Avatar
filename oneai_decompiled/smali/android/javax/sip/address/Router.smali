.class public interface abstract Landroid/javax/sip/address/Router;
.super Ljava/lang/Object;
.source "Router.java"


# virtual methods
.method public abstract getNextHop(Landroid/javax/sip/message/Request;)Landroid/javax/sip/address/Hop;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract getNextHops(Landroid/javax/sip/message/Request;)Ljava/util/ListIterator;
.end method

.method public abstract getOutboundProxy()Landroid/javax/sip/address/Hop;
.end method
