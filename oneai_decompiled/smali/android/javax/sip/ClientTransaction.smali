.class public interface abstract Landroid/javax/sip/ClientTransaction;
.super Ljava/lang/Object;
.source "ClientTransaction.java"

# interfaces
.implements Landroid/javax/sip/Transaction;


# virtual methods
.method public abstract createAck()Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract createCancel()Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract sendRequest()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method
