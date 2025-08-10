.class Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$1;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPClientTransactionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->scheduleTimerK(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;)V
    .locals 0

    .line 706
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 2

    .line 718
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 719
    .local v0, "request":Landroid/javax/sip/message/Request;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_0

    .line 720
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 722
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public runTask()V
    .locals 3

    .line 709
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 710
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "executing TransactionTimerJ() : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 712
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->fireTimeoutTimer()V

    .line 713
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUpOnTerminated()V

    .line 714
    return-void
.end method
