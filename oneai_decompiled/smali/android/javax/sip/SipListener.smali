.class public interface abstract Landroid/javax/sip/SipListener;
.super Ljava/lang/Object;
.source "SipListener.java"

# interfaces
.implements Ljava/util/EventListener;


# virtual methods
.method public abstract processDialogTerminated(Landroid/javax/sip/DialogTerminatedEvent;)V
.end method

.method public abstract processIOException(Landroid/javax/sip/IOExceptionEvent;)V
.end method

.method public abstract processRequest(Landroid/javax/sip/RequestEvent;)V
.end method

.method public abstract processResponse(Landroid/javax/sip/ResponseEvent;)V
.end method

.method public abstract processTimeout(Landroid/javax/sip/TimeoutEvent;)V
.end method

.method public abstract processTransactionTerminated(Landroid/javax/sip/TransactionTerminatedEvent;)V
.end method
