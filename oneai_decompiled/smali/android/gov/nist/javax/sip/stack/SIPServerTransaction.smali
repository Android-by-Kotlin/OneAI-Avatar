.class public interface abstract Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
.super Ljava/lang/Object;
.source "SIPServerTransaction.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SIPTransaction;
.implements Landroid/javax/sip/ServerTransaction;
.implements Landroid/gov/nist/javax/sip/ServerTransactionExt;
.implements Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;


# static fields
.field public static final CONTENT_SUBTYPE_SDP:Ljava/lang/String; = "sdp"

.field public static final CONTENT_TYPE_APPLICATION:Ljava/lang/String; = "application"


# virtual methods
.method public abstract ackSeen()Z
.end method

.method public abstract cleanUp()V
.end method

.method public abstract disableRetransmissionAlerts()V
.end method

.method public abstract enableRetransmissionAlerts()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract equals(Ljava/lang/Object;)Z
.end method

.method public abstract getCanceledInviteTransaction()Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
.end method

.method public abstract getDialog()Landroid/javax/sip/Dialog;
.end method

.method public abstract getLastResponseStatusCode()I
.end method

.method public abstract getPendingReliableCSeqNumber()J
.end method

.method public abstract getPendingReliableRSeqNumber()J
.end method

.method public abstract getPendingReliableResponseMethod()Ljava/lang/String;
.end method

.method public abstract getReliableProvisionalResponse()[B
.end method

.method public abstract getResponseChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;
.end method

.method public abstract getState()Landroid/javax/sip/TransactionState;
.end method

.method public abstract getViaHost()Ljava/lang/String;
.end method

.method public abstract getViaPort()I
.end method

.method public abstract isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z
.end method

.method public abstract isRetransmissionAlertEnabled()Z
.end method

.method public abstract isTransactionMapped()Z
.end method

.method public abstract map()V
.end method

.method public abstract prackRecieved()Z
.end method

.method public abstract processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
.end method

.method public abstract releaseSem()V
.end method

.method public abstract resendLastResponseAsBytes()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract scheduleAckRemoval()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public abstract sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
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

.method public abstract sendResponse(Landroid/javax/sip/message/Response;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation
.end method

.method public abstract setAckSeen()V
.end method

.method public abstract setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
.end method

.method public abstract setInviteTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
.end method

.method public abstract setMapped(Z)V
.end method

.method public abstract setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
.end method

.method public abstract setPendingSubscribe(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V
.end method

.method public abstract setRequestInterface(Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;)V
.end method

.method public abstract setState(I)V
.end method

.method public abstract setTransactionMapped(Z)V
.end method

.method public abstract terminate()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ObjectInUseException;
        }
    .end annotation
.end method

.method public abstract waitForTermination()V
.end method
