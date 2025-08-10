.class public Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;
.super Ljava/lang/Object;
.source "AffinitityExecutorSipTimer.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/timers/SipTimer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer$ScheduledSipTimerTask;
    }
.end annotation


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected sipStackImpl:Landroid/gov/nist/javax/sip/SipStackImpl;

.field threadPoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    const-class v0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method


# virtual methods
.method public cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z
    .locals 3
    .param p1, "task"    # Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 106
    const/4 v0, 0x0

    .line 107
    .local v0, "cancelled":Z
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->getSipTimerTask()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ScheduledFuture;

    .line 108
    .local v1, "sipTimerTask":Ljava/util/concurrent/ScheduledFuture;, "Ljava/util/concurrent/ScheduledFuture<*>;"
    if-eqz v1, :cond_0

    .line 109
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->cleanUpBeforeCancel()V

    .line 110
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->setSipTimerTask(Ljava/lang/Object;)V

    .line 112
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    move-result v0

    .line 114
    :cond_0
    return v0
.end method

.method public isStarted()Z
    .locals 1

    .line 142
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z
    .locals 3
    .param p1, "task"    # Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    .param p2, "delay"    # J

    .line 67
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer$ScheduledSipTimerTask;

    invoke-direct {v1, p0, p1}, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer$ScheduledSipTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)V

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, p2, p3, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    .line 71
    .local v0, "future":Ljava/util/concurrent/ScheduledFuture;, "Ljava/util/concurrent/ScheduledFuture<*>;"
    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->setSipTimerTask(Ljava/lang/Object;)V

    .line 72
    const/4 v1, 0x1

    return v1

    .line 68
    .end local v0    # "future":Ljava/util/concurrent/ScheduledFuture;, "Ljava/util/concurrent/ScheduledFuture<*>;"
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "The SIP Stack Timer has been stopped, no new tasks can be scheduled !"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public scheduleWithFixedDelay(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;JJ)Z
    .locals 8
    .param p1, "task"    # Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    .param p2, "delay"    # J
    .param p4, "period"    # J

    .line 81
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 84
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v2, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer$ScheduledSipTimerTask;

    invoke-direct {v2, p0, p1}, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer$ScheduledSipTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)V

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide v3, p2

    move-wide v5, p4

    invoke-interface/range {v1 .. v7}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    .line 85
    .local v0, "future":Ljava/util/concurrent/ScheduledFuture;, "Ljava/util/concurrent/ScheduledFuture<*>;"
    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->setSipTimerTask(Ljava/lang/Object;)V

    .line 86
    const/4 v1, 0x1

    return v1

    .line 82
    .end local v0    # "future":Ljava/util/concurrent/ScheduledFuture;, "Ljava/util/concurrent/ScheduledFuture<*>;"
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

    .line 94
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->sipStackImpl:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 95
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->sipStackImpl:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 97
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 100
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 3

    .line 56
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 57
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace(I)V

    .line 58
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 61
    :cond_0
    return-void
.end method
