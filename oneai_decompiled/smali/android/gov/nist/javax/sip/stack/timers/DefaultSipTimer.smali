.class public Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;
.super Ljava/util/Timer;
.source "DefaultSipTimer.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/timers/SipTimer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;
    }
.end annotation


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected sipStackImpl:Landroid/gov/nist/javax/sip/SipStackImpl;

.field protected started:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    const-class v0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 52
    const-string v0, "DefaultSipTimerThread"

    invoke-direct {p0, v0}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->started:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 53
    return-void
.end method


# virtual methods
.method public cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z
    .locals 1
    .param p1, "task"    # Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 114
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->getSipTimerTask()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    move-result v0

    return v0
.end method

.method public isStarted()Z
    .locals 1

    .line 148
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->started:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z
    .locals 2
    .param p1, "task"    # Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    .param p2, "delay"    # J

    .line 89
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->started:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    new-instance v0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;

    invoke-direct {v0, p0, p1}, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)V

    invoke-super {p0, v0, p2, p3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 93
    const/4 v0, 0x1

    return v0

    .line 90
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "The SIP Stack Timer has been stopped, no new tasks can be scheduled !"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public scheduleWithFixedDelay(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;JJ)Z
    .locals 7
    .param p1, "task"    # Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    .param p2, "delay"    # J
    .param p4, "period"    # J

    .line 102
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->started:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    new-instance v2, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;

    invoke-direct {v2, p0, p1}, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)V

    move-object v1, p0

    move-wide v3, p2

    move-wide v5, p4

    invoke-super/range {v1 .. v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 106
    const/4 v0, 0x1

    return v0

    .line 103
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "The SIP Stack Timer has been stopped, no new tasks can be scheduled !"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public start(Landroid/gov/nist/javax/sip/SipStackImpl;Ljava/util/Properties;)V
    .locals 3
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/SipStackImpl;
    .param p2, "configurationProperties"    # Ljava/util/Properties;

    .line 122
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->sipStackImpl:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 124
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->started:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 125
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "the sip stack timer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " has been started"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 128
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 3

    .line 135
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->started:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 136
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->cancel()V

    .line 137
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace(I)V

    .line 138
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "the sip stack timer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " has been stopped"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 141
    :cond_0
    return-void
.end method
