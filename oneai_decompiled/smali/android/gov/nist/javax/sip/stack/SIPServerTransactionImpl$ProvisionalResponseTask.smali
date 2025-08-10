.class Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPServerTransactionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ProvisionalResponseTask"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

.field ticks:I

.field ticksLeft:I


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;)V
    .locals 0

    .line 283
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 284
    const/4 p1, 0x1

    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->ticks:I

    .line 285
    iget p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->ticks:I

    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->ticksLeft:I

    .line 286
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 2

    .line 328
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 329
    .local v0, "request":Landroid/javax/sip/message/Request;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_0

    .line 330
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 332
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public runTask()V
    .locals 3

    .line 289
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    .line 302
    .local v0, "serverTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isTerminated()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 304
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    invoke-interface {v1, p0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    goto :goto_0

    .line 307
    :cond_0
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->ticksLeft:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->ticksLeft:I

    .line 308
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->ticksLeft:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 309
    invoke-static {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$000(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;)V

    .line 310
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->ticks:I

    mul-int/lit8 v1, v1, 0x2

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->ticksLeft:I

    .line 311
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->ticksLeft:I

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->ticks:I

    .line 315
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->ticksLeft:I

    const/16 v2, 0x40

    if-lt v1, v2, :cond_1

    .line 316
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    invoke-interface {v1, p0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 317
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 318
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->fireTimeoutTimer()V

    .line 324
    :cond_1
    :goto_0
    return-void
.end method
