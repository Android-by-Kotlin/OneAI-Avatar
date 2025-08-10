.class public Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;
.super Ljava/lang/Object;
.source "ScheduledExecutorSipTimer.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/timers/SipTimer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$ScheduledSipTimerTask;
    }
.end annotation


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected sipStackImpl:Landroid/gov/nist/javax/sip/SipStackImpl;

.field threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    const-class v0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Landroid/gov/nist/core/NamingThreadFactory;

    const-string/jumbo v2, "jain_sip_timer_executor"

    invoke-direct {v1, v2}, Landroid/gov/nist/core/NamingThreadFactory;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 53
    return-void
.end method

.method static synthetic access$000()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 46
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method private schedulePurgeTaskIfNeeded()V
    .locals 8

    .line 56
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->sipStackImpl:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getConfigurationProperties()Ljava/util/Properties;

    move-result-object v0

    const-string/jumbo v1, "android.gov.nist.javax.sip.timers.SCHEDULED_EXECUTOR_PURGE_DELAY"

    const-string v2, "1"

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 57
    .local v0, "purgePeriod":I
    if-lez v0, :cond_0

    .line 58
    new-instance v2, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$1;

    invoke-direct {v2, p0}, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$1;-><init>(Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;)V

    .line 74
    .local v2, "r":Ljava/lang/Runnable;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    int-to-long v3, v0

    int-to-long v5, v0

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v1 .. v7}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 76
    .end local v2    # "r":Ljava/lang/Runnable;
    :cond_0
    return-void
.end method


# virtual methods
.method public cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z
    .locals 4
    .param p1, "task"    # Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 133
    const/4 v0, 0x0

    .line 134
    .local v0, "cancelled":Z
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->getSipTimerTask()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ScheduledFuture;

    .line 135
    .local v1, "sipTimerTask":Ljava/util/concurrent/ScheduledFuture;, "Ljava/util/concurrent/ScheduledFuture<*>;"
    if-eqz v1, :cond_0

    .line 136
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->cleanUpBeforeCancel()V

    .line 137
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->setSipTimerTask(Ljava/lang/Object;)V

    .line 138
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-object v3, v1

    check-cast v3, Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->remove(Ljava/lang/Runnable;)Z

    .line 139
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    move-result v0

    .line 141
    :cond_0
    return v0
.end method

.method public isStarted()Z
    .locals 1

    .line 169
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->isShutdown()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z
    .locals 3
    .param p1, "task"    # Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    .param p2, "delay"    # J

    .line 93
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$ScheduledSipTimerTask;

    invoke-direct {v1, p0, p1}, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$ScheduledSipTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)V

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, p2, p3, v2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    .line 97
    .local v0, "future":Ljava/util/concurrent/ScheduledFuture;, "Ljava/util/concurrent/ScheduledFuture<*>;"
    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->setSipTimerTask(Ljava/lang/Object;)V

    .line 98
    const/4 v1, 0x1

    return v1

    .line 94
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

    .line 107
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 110
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v2, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$ScheduledSipTimerTask;

    invoke-direct {v2, p0, p1}, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$ScheduledSipTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)V

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide v3, p2

    move-wide v5, p4

    invoke-virtual/range {v1 .. v7}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    .line 111
    .local v0, "future":Ljava/util/concurrent/ScheduledFuture;, "Ljava/util/concurrent/ScheduledFuture<*>;"
    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->setSipTimerTask(Ljava/lang/Object;)V

    .line 112
    const/4 v1, 0x1

    return v1

    .line 108
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

    .line 120
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->sipStackImpl:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 122
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->prestartAllCoreThreads()I

    .line 123
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->schedulePurgeTaskIfNeeded()V

    .line 124
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 127
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 3

    .line 82
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->shutdown()V

    .line 83
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace(I)V

    .line 84
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    sget-object v0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->logger:Landroid/gov/nist/core/StackLogger;

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

    .line 87
    :cond_0
    return-void
.end method
