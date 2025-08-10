.class Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$1;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPServerTransactionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->startTransactionTimerJ(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;)V
    .locals 0

    .line 1650
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 2

    .line 1665
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 1666
    .local v0, "request":Landroid/javax/sip/message/Request;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_0

    .line 1667
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1669
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public runTask()V
    .locals 3

    .line 1653
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1654
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "executing TransactionTimerJ() : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1656
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->fireTimeoutTimer()V

    .line 1657
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->cleanUp()V

    .line 1658
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v0, :cond_1

    .line 1659
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->cleanUp()V

    .line 1661
    :cond_1
    return-void
.end method
