.class public interface abstract Landroid/javax/sip/SipProvider;
.super Ljava/lang/Object;
.source "SipProvider.java"


# virtual methods
.method public abstract addListeningPoint(Landroid/javax/sip/ListeningPoint;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ObjectInUseException;,
            Landroid/javax/sip/TransportAlreadySupportedException;
        }
    .end annotation
.end method

.method public abstract addSipListener(Landroid/javax/sip/SipListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/TooManyListenersException;
        }
    .end annotation
.end method

.method public abstract getListeningPoint()Landroid/javax/sip/ListeningPoint;
.end method

.method public abstract getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;
.end method

.method public abstract getListeningPoints()[Landroid/javax/sip/ListeningPoint;
.end method

.method public abstract getNewCallId()Landroid/javax/sip/header/CallIdHeader;
.end method

.method public abstract getNewClientTransaction(Landroid/javax/sip/message/Request;)Landroid/javax/sip/ClientTransaction;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/TransactionUnavailableException;
        }
    .end annotation
.end method

.method public abstract getNewDialog(Landroid/javax/sip/Transaction;)Landroid/javax/sip/Dialog;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract getNewServerTransaction(Landroid/javax/sip/message/Request;)Landroid/javax/sip/ServerTransaction;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/TransactionAlreadyExistsException;,
            Landroid/javax/sip/TransactionUnavailableException;
        }
    .end annotation
.end method

.method public abstract getSipStack()Landroid/javax/sip/SipStack;
.end method

.method public abstract removeListeningPoint(Landroid/javax/sip/ListeningPoint;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ObjectInUseException;
        }
    .end annotation
.end method

.method public abstract removeSipListener(Landroid/javax/sip/SipListener;)V
.end method

.method public abstract sendRequest(Landroid/javax/sip/message/Request;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract sendResponse(Landroid/javax/sip/message/Response;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract setAutomaticDialogSupportEnabled(Z)V
.end method

.method public abstract setListeningPoint(Landroid/javax/sip/ListeningPoint;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ObjectInUseException;
        }
    .end annotation
.end method
