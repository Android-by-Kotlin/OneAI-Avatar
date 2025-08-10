.class public interface abstract Landroid/javax/sip/Dialog;
.super Ljava/lang/Object;
.source "Dialog.java"

# interfaces
.implements Ljava/io/Serializable;


# virtual methods
.method public abstract createAck(J)Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract createPrack(Landroid/javax/sip/message/Response;)Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/DialogDoesNotExistException;,
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract createReliableProvisionalResponse(I)Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract createRequest(Ljava/lang/String;)Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract delete()V
.end method

.method public abstract getApplicationData()Ljava/lang/Object;
.end method

.method public abstract getCallId()Landroid/javax/sip/header/CallIdHeader;
.end method

.method public abstract getDialogId()Ljava/lang/String;
.end method

.method public abstract getFirstTransaction()Landroid/javax/sip/Transaction;
.end method

.method public abstract getLocalParty()Landroid/javax/sip/address/Address;
.end method

.method public abstract getLocalSeqNumber()J
.end method

.method public abstract getLocalSequenceNumber()I
.end method

.method public abstract getLocalTag()Ljava/lang/String;
.end method

.method public abstract getRemoteParty()Landroid/javax/sip/address/Address;
.end method

.method public abstract getRemoteSeqNumber()J
.end method

.method public abstract getRemoteSequenceNumber()I
.end method

.method public abstract getRemoteTag()Ljava/lang/String;
.end method

.method public abstract getRemoteTarget()Landroid/javax/sip/address/Address;
.end method

.method public abstract getRouteSet()Ljava/util/Iterator;
.end method

.method public abstract getState()Landroid/javax/sip/DialogState;
.end method

.method public abstract incrementLocalSequenceNumber()V
.end method

.method public abstract isSecure()Z
.end method

.method public abstract isServer()Z
.end method

.method public abstract sendAck(Landroid/javax/sip/message/Request;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract sendReliableProvisionalResponse(Landroid/javax/sip/message/Response;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract sendRequest(Landroid/javax/sip/ClientTransaction;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/TransactionDoesNotExistException;,
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract setApplicationData(Ljava/lang/Object;)V
.end method

.method public abstract terminateOnBye(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method
