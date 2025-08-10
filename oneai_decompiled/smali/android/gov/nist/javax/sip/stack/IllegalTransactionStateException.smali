.class public Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;
.super Landroid/javax/sip/SipException;
.source "IllegalTransactionStateException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;
    }
.end annotation


# instance fields
.field reason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;)V
    .locals 1
    .param p1, "reason"    # Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    .line 46
    invoke-direct {p0}, Landroid/javax/sip/SipException;-><init>()V

    .line 36
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->GenericReason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;->reason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    .line 47
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;->reason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "reason"    # Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    .line 59
    invoke-direct {p0, p1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .line 36
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->GenericReason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;->reason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    .line 60
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;->reason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .param p3, "reason"    # Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    .line 71
    invoke-direct {p0, p1, p2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->GenericReason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;->reason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    .line 72
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;->reason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    .line 73
    return-void
.end method


# virtual methods
.method public getReason()Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;
    .locals 1

    .line 82
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;->reason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    return-object v0
.end method
