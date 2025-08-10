.class public Landroid/gov/nist/javax/sip/DialogTimeoutEvent;
.super Ljava/util/EventObject;
.source "DialogTimeoutEvent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x22e385bc1cf941b5L


# instance fields
.field private m_dialog:Landroid/javax/sip/Dialog;

.field private m_reInviteTransaction:Landroid/javax/sip/ClientTransaction;

.field private m_reason:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/javax/sip/Dialog;Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;)V
    .locals 1
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "dialog"    # Landroid/javax/sip/Dialog;
    .param p3, "reason"    # Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    .line 44
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 92
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;->m_dialog:Landroid/javax/sip/Dialog;

    .line 93
    iput-object v0, p0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;->m_reason:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    .line 94
    iput-object v0, p0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;->m_reInviteTransaction:Landroid/javax/sip/ClientTransaction;

    .line 45
    iput-object p2, p0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;->m_dialog:Landroid/javax/sip/Dialog;

    .line 46
    iput-object p3, p0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;->m_reason:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    .line 48
    return-void
.end method


# virtual methods
.method public getClientTransaction()Landroid/javax/sip/ClientTransaction;
    .locals 1

    .line 88
    iget-object v0, p0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;->m_reInviteTransaction:Landroid/javax/sip/ClientTransaction;

    return-object v0
.end method

.method public getDialog()Landroid/javax/sip/Dialog;
    .locals 1

    .line 69
    iget-object v0, p0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;->m_dialog:Landroid/javax/sip/Dialog;

    return-object v0
.end method

.method public getReason()Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;
    .locals 1

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;->m_reason:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    return-object v0
.end method

.method public setClientTransaction(Landroid/javax/sip/ClientTransaction;)V
    .locals 0
    .param p1, "clientTransaction"    # Landroid/javax/sip/ClientTransaction;

    .line 57
    iput-object p1, p0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;->m_reInviteTransaction:Landroid/javax/sip/ClientTransaction;

    .line 58
    return-void
.end method
