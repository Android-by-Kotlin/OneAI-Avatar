.class public Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;
.super Ljava/util/EventObject;
.source "SIPDialogErrorEvent.java"


# static fields
.field public static final DIALOG_ACK_NOT_RECEIVED_TIMEOUT:I = 0x1

.field public static final DIALOG_ACK_NOT_SENT_TIMEOUT:I = 0x2

.field public static final DIALOG_ERROR_INTERNAL_COULD_NOT_TAKE_ACK_SEM:I = 0x5

.field public static final DIALOG_REINVITE_TIMEOUT:I = 0x3

.field public static final EARLY_STATE_TIMEOUT:I = 0x4


# instance fields
.field private clientTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

.field private errorID:I


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;I)V
    .locals 0
    .param p1, "sourceDialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .param p2, "dialogErrorID"    # I

    .line 75
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 76
    iput p2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->errorID:I

    .line 78
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;)V
    .locals 1
    .param p1, "sourceDialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .param p2, "reason"    # Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    .line 81
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 82
    sget-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->AckNotReceived:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    if-ne p2, v0, :cond_0

    .line 83
    const/4 v0, 0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->errorID:I

    goto :goto_0

    .line 84
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->AckNotSent:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    if-ne p2, v0, :cond_1

    .line 85
    const/4 v0, 0x2

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->errorID:I

    goto :goto_0

    .line 86
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->ReInviteTimeout:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    if-ne p2, v0, :cond_2

    .line 87
    const/4 v0, 0x3

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->errorID:I

    goto :goto_0

    .line 88
    :cond_2
    sget-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->CannotAcquireAckSemaphoreForOk:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    if-ne p2, v0, :cond_3

    .line 89
    const/4 v0, 0x5

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->errorID:I

    goto :goto_0

    .line 90
    :cond_3
    sget-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->EarlyStateTimeout:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    if-ne p2, v0, :cond_4

    .line 91
    const/4 v0, 0x4

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->errorID:I

    .line 93
    :cond_4
    :goto_0
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;)V
    .locals 0
    .param p1, "sourceDialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .param p2, "clientTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .param p3, "reason"    # Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    .line 96
    invoke-direct {p0, p1, p3}, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;)V

    .line 97
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->clientTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 98
    return-void
.end method


# virtual methods
.method public getClientTransaction()Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .locals 1

    .line 110
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->clientTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    return-object v0
.end method

.method public getErrorID()I
    .locals 1

    .line 105
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->errorID:I

    return v0
.end method

.method public setClientTransaction(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V
    .locals 0
    .param p1, "clientTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 114
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->clientTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 115
    return-void
.end method
