.class public interface abstract Landroid/gov/nist/javax/sip/ClientTransactionExt;
.super Ljava/lang/Object;
.source "ClientTransactionExt.java"

# interfaces
.implements Landroid/javax/sip/ClientTransaction;
.implements Landroid/gov/nist/javax/sip/TransactionExt;


# virtual methods
.method public abstract alertIfStillInCallingStateBy(I)V
.end method

.method public abstract getDefaultDialog()Landroid/javax/sip/Dialog;
.end method

.method public abstract getNextHop()Landroid/javax/sip/address/Hop;
.end method

.method public abstract isSecure()Z
.end method

.method public abstract setNotifyOnRetransmit(Z)V
.end method
