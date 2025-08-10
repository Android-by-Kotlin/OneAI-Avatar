.class Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$LingerTimer;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPTransactionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LingerTimer"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;)V
    .locals 3

    .line 280
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$LingerTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 281
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 282
    nop

    .line 283
    .local p1, "sipTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LingerTimer : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 287
    .end local p1    # "sipTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    :cond_0
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 2

    .line 295
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$LingerTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 296
    .local v0, "request":Landroid/javax/sip/message/Request;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_0

    .line 297
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 299
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public runTask()V
    .locals 1

    .line 290
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$LingerTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->cleanUp()V

    .line 291
    return-void
.end method
