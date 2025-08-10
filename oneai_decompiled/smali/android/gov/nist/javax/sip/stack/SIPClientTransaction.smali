.class public interface abstract Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
.super Ljava/lang/Object;
.source "SIPClientTransaction.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/ClientTransactionExt;
.implements Landroid/gov/nist/javax/sip/stack/SIPTransaction;
.implements Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;


# virtual methods
.method public abstract alertIfStillInCallingStateBy(I)V
.end method

.method public abstract checkFromTag(Landroid/gov/nist/javax/sip/message/SIPResponse;)Z
.end method

.method public abstract cleanUp()V
.end method

.method public abstract clearState()V
.end method

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

.method public abstract getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;
.end method

.method public abstract getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;
.end method

.method public abstract getDialog()Landroid/javax/sip/Dialog;
.end method

.method public abstract getNextHop()Landroid/javax/sip/address/Hop;
.end method

.method public abstract getOriginalRequestCallId()Ljava/lang/String;
.end method

.method public abstract getOriginalRequestContact()Landroid/gov/nist/javax/sip/header/Contact;
.end method

.method public abstract getOriginalRequestEvent()Landroid/gov/nist/javax/sip/header/Event;
.end method

.method public abstract getOriginalRequestFromTag()Ljava/lang/String;
.end method

.method public abstract getOriginalRequestScheme()Ljava/lang/String;
.end method

.method public abstract getOutgoingViaHeader()Landroid/gov/nist/javax/sip/header/Via;
.end method

.method public abstract getRequestChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;
.end method

.method public abstract getViaHost()Ljava/lang/String;
.end method

.method public abstract getViaPort()I
.end method

.method public abstract isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z
.end method

.method public abstract isNotifyOnRetransmit()Z
.end method

.method public abstract processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
.end method

.method public abstract processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
.end method

.method public abstract sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
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

.method public abstract setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
.end method

.method public abstract setNextHop(Landroid/javax/sip/address/Hop;)V
.end method

.method public abstract setNotifyOnRetransmit(Z)V
.end method

.method public abstract setResponseInterface(Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;)V
.end method

.method public abstract setState(I)V
.end method

.method public abstract setTerminateDialogOnCleanUp(Z)V
.end method

.method public abstract setViaHost(Ljava/lang/String;)V
.end method

.method public abstract setViaPort(I)V
.end method

.method public abstract stopExpiresTimer()V
.end method

.method public abstract terminate()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ObjectInUseException;
        }
    .end annotation
.end method
