.class Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPDialog.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LingerTimer"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    .locals 0

    .line 531
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 548
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public runTask()V
    .locals 2

    .line 534
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 535
    .local v0, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$000(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    .line 541
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->isReEntrantListener()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 542
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->cleanUp()V

    .line 544
    :cond_0
    return-void
.end method
