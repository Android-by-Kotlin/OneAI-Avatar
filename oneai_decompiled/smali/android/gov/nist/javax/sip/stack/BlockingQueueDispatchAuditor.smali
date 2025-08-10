.class public Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;
.super Ljava/util/TimerTask;
.source "BlockingQueueDispatchAuditor.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;

.field private static timerThreadCount:I


# instance fields
.field private queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "+",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private started:Z

.field private timeout:I

.field private timer:Ljava/util/Timer;

.field private totalReject:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    const/4 v0, 0x0

    sput v0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timerThreadCount:I

    .line 39
    const-class v0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Ljava/util/Queue;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "+",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .line 44
    .local p1, "queue":Ljava/util/Queue;, "Ljava/util/Queue<+Ljava/lang/Runnable;>;"
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timer:Ljava/util/Timer;

    .line 40
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->totalReject:J

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->started:Z

    .line 43
    const/16 v0, 0x1f40

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timeout:I

    .line 45
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->queue:Ljava/util/Queue;

    .line 46
    return-void
.end method


# virtual methods
.method public getTimeout()I
    .locals 1

    .line 56
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timeout:I

    return v0
.end method

.method public run()V
    .locals 9

    .line 76
    const/4 v0, 0x0

    .line 77
    .local v0, "removed":I
    const/16 v1, 0x8

    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->queue:Ljava/util/Queue;

    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    :try_start_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->queue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/stack/QueuedMessageDispatchBase;

    .line 79
    .local v3, "runnable":Landroid/gov/nist/javax/sip/stack/QueuedMessageDispatchBase;
    :goto_0
    if-eqz v3, :cond_1

    .line 80
    move-object v4, v3

    .line 81
    .local v4, "d":Landroid/gov/nist/javax/sip/stack/QueuedMessageDispatchBase;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/QueuedMessageDispatchBase;->getReceptionTime()J

    move-result-wide v7

    sub-long/2addr v5, v7

    iget v7, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timeout:I

    int-to-long v7, v7

    cmp-long v5, v5, v7

    if-lez v5, :cond_0

    .line 82
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->queue:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 83
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->queue:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/stack/QueuedMessageDispatchBase;

    move-object v3, v5

    .line 84
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 86
    :cond_0
    const/4 v3, 0x0

    .line 88
    .end local v4    # "d":Landroid/gov/nist/javax/sip/stack/QueuedMessageDispatchBase;
    :goto_1
    goto :goto_0

    .line 89
    .end local v3    # "runnable":Landroid/gov/nist/javax/sip/stack/QueuedMessageDispatchBase;
    :cond_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 90
    if-lez v0, :cond_2

    .line 91
    :try_start_2
    iget-wide v2, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->totalReject:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->totalReject:J

    .line 92
    sget-object v2, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    if-eqz v2, :cond_2

    sget-object v2, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 93
    sget-object v2, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Removed stuck messages="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " total rejected="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->totalReject:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " stil in queue="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->queue:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 101
    .end local v0    # "removed":I
    :cond_2
    goto :goto_2

    .line 89
    .restart local v0    # "removed":I
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v3
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 97
    .end local v0    # "removed":I
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    if-eqz v2, :cond_3

    sget-object v2, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 99
    sget-object v1, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Problem reaping old requests. This is not a fatal error."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 102
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    :goto_2
    return-void
.end method

.method public setTimeout(I)V
    .locals 0
    .param p1, "timeout"    # I

    .line 60
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timeout:I

    .line 61
    return-void
.end method

.method public start(I)V
    .locals 9
    .param p1, "interval"    # I

    .line 49
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->started:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->stop()V

    .line 50
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->started:Z

    .line 51
    new-instance v1, Ljava/util/Timer;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BlockingQueueDispatchAuditor-Timer-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timerThreadCount:I

    add-int/lit8 v4, v3, 0x1

    sput v4, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timerThreadCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/util/Timer;-><init>(Ljava/lang/String;Z)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timer:Ljava/util/Timer;

    .line 52
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timer:Ljava/util/Timer;

    int-to-long v5, p1

    int-to-long v7, p1

    move-object v4, p0

    invoke-virtual/range {v3 .. v8}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 53
    return-void
.end method

.method public stop()V
    .locals 2

    .line 65
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 66
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->timer:Ljava/util/Timer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 70
    :catchall_0
    move-exception v1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->started:Z

    throw v1

    .line 67
    :catch_0
    move-exception v1

    .line 70
    :goto_0
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->started:Z

    .line 71
    nop

    .line 72
    return-void
.end method
