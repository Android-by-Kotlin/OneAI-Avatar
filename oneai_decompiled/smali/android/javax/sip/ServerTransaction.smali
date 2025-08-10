.class public interface abstract Landroid/javax/sip/ServerTransaction;
.super Ljava/lang/Object;
.source "ServerTransaction.java"

# interfaces
.implements Landroid/javax/sip/Transaction;


# virtual methods
.method public abstract enableRetransmissionAlerts()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract sendResponse(Landroid/javax/sip/message/Response;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;,
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method
