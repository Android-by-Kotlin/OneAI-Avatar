.class public Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPTransactionStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "PingTimer"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

.field threadHandle:Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;)V
    .locals 0
    .param p2, "a_oThreadHandle"    # Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    .line 462
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 463
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->threadHandle:Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    .line 464
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 468
    const/4 v0, 0x0

    return-object v0
.end method

.method public runTask()V
    .locals 4

    .line 473
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 476
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->threadHandle:Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 479
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/core/ThreadAuditor;->addCurrentThread()Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->threadHandle:Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    .line 483
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->threadHandle:Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    invoke-virtual {v0}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;->ping()V

    .line 486
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    new-instance v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->threadHandle:Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    invoke-direct {v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;)V

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;->threadHandle:Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    invoke-virtual {v2}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;->getPingIntervalInMillisecs()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    .line 489
    :cond_1
    return-void
.end method
