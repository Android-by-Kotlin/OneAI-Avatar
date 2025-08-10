.class Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPServerTransactionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RetransmissionAlertTimerTask"
.end annotation


# instance fields
.field dialogId:Ljava/lang/String;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

.field ticks:I

.field ticksLeft:I


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;Ljava/lang/String;)V
    .locals 0
    .param p2, "dialogId"    # Ljava/lang/String;

    .line 246
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 248
    const/4 p1, 0x1

    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->ticks:I

    .line 249
    iget p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->ticks:I

    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->ticksLeft:I

    .line 252
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->dialogId:Ljava/lang/String;

    .line 253
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 2

    .line 267
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 268
    .local v0, "request":Landroid/javax/sip/message/Request;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_0

    .line 269
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 271
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public runTask()V
    .locals 3

    .line 256
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    .line 257
    .local v0, "serverTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->ticksLeft:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->ticksLeft:I

    .line 258
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->ticksLeft:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 259
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->fireRetransmissionTimer()V

    .line 260
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->ticks:I

    mul-int/lit8 v1, v1, 0x2

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->ticksLeft:I

    .line 263
    :cond_0
    return-void
.end method
