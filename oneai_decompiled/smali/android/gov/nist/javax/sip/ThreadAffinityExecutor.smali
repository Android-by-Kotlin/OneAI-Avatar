.class public Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;
.super Ljava/lang/Object;
.source "ThreadAffinityExecutor.java"

# interfaces
.implements Ljava/util/concurrent/ScheduledExecutorService;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private final executors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;",
            ">;"
        }
    .end annotation
.end field

.field private final nextThread:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    const-class v0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 5
    .param p1, "corePoolSize"    # I

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->nextThread:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    .line 27
    new-instance v0, Landroid/gov/nist/core/NamingThreadFactory;

    const-string v1, "AffinityJAIN"

    invoke-direct {v0, v1}, Landroid/gov/nist/core/NamingThreadFactory;-><init>(Ljava/lang/String;)V

    .line 28
    .local v0, "namingThreadFactory":Landroid/gov/nist/core/NamingThreadFactory;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p1, :cond_0

    .line 29
    iget-object v2, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    new-instance v3, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    const/4 v4, 0x1

    invoke-direct {v3, v4, v0}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 31
    .end local v1    # "i":I
    :cond_0
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->schedulePurgeTaskIfNeeded()V

    .line 32
    return-void
.end method

.method private calculateAffinityThread(Ljava/lang/Runnable;)I
    .locals 6
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .line 48
    const/4 v0, 0x0

    .line 49
    .local v0, "affThreadIndex":I
    instance-of v1, p1, Landroid/gov/nist/javax/sip/ThreadAffinityIdentifier;

    if-eqz v1, :cond_2

    .line 50
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/ThreadAffinityIdentifier;

    .line 51
    .local v1, "tTask":Landroid/gov/nist/javax/sip/ThreadAffinityIdentifier;
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/ThreadAffinityIdentifier;->getThreadHash()Ljava/lang/Object;

    move-result-object v2

    .line 52
    .local v2, "tHash":Ljava/lang/Object;
    if-eqz v2, :cond_0

    .line 53
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    rem-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 54
    sget-object v3, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 55
    sget-object v3, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Runnable assigned to thread ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_0

    .line 58
    :cond_0
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->retrieveNextThread()I

    move-result v0

    .line 60
    .end local v1    # "tTask":Landroid/gov/nist/javax/sip/ThreadAffinityIdentifier;
    .end local v2    # "tHash":Ljava/lang/Object;
    :cond_1
    :goto_0
    goto :goto_1

    .line 61
    :cond_2
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->retrieveNextThread()I

    move-result v0

    .line 63
    :goto_1
    return v0
.end method

.method private declared-synchronized retrieveNextThread()I
    .locals 4

    monitor-enter p0

    .line 36
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->nextThread:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    .line 37
    .local v0, "nThread":I
    iget-object v1, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 38
    const/4 v0, 0x0

    .line 39
    iget-object v1, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->nextThread:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 41
    .end local p0    # "this":Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;
    :cond_0
    sget-object v1, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 42
    sget-object v1, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Next thread id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    :cond_1
    monitor-exit p0

    return v0

    .line 35
    .end local v0    # "nThread":I
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private schedulePurgeTaskIfNeeded()V
    .locals 0

    .line 182
    return-void
.end method


# virtual methods
.method public awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    .locals 2
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 113
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    invoke-virtual {v0, p1, p2, p3}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    return v0
.end method

.method public execute(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "command"    # Ljava/lang/Runnable;

    .line 155
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->calculateAffinityThread(Ljava/lang/Runnable;)I

    move-result v0

    .line 156
    .local v0, "affThread":I
    iget-object v1, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->execute(Ljava/lang/Runnable;)V

    .line 157
    return-void
.end method

.method public invokeAll(Ljava/util/Collection;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/util/concurrent/Callable<",
            "TT;>;>;)",
            "Ljava/util/List<",
            "Ljava/util/concurrent/Future<",
            "TT;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 135
    .local p1, "tasks":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/util/concurrent/Callable<TT;>;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public invokeAll(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/util/List;
    .locals 2
    .param p2, "timeout"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/util/concurrent/Callable<",
            "TT;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/concurrent/Future<",
            "TT;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 140
    .local p1, "tasks":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/util/concurrent/Callable<TT;>;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public invokeAny(Ljava/util/Collection;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/util/concurrent/Callable<",
            "TT;>;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 145
    .local p1, "tasks":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/util/concurrent/Callable<TT;>;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public invokeAny(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 2
    .param p2, "timeout"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/util/concurrent/Callable<",
            "TT;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .line 150
    .local p1, "tasks":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/util/concurrent/Callable<TT;>;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isShutdown()Z
    .locals 2

    .line 103
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->isShutdown()Z

    move-result v0

    return v0
.end method

.method public isTerminated()Z
    .locals 2

    .line 108
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->isTerminated()Z

    move-result v0

    return v0
.end method

.method public schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 2
    .param p1, "command"    # Ljava/lang/Runnable;
    .param p2, "delay"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation

    .line 68
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->calculateAffinityThread(Ljava/lang/Runnable;)I

    move-result v0

    .line 69
    .local v0, "affThread":I
    iget-object v1, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    invoke-virtual {v1, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    return-object v1
.end method

.method public schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 2
    .param p2, "delay"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TV;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/concurrent/ScheduledFuture<",
            "TV;>;"
        }
    .end annotation

    .line 74
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 9
    .param p1, "command"    # Ljava/lang/Runnable;
    .param p2, "initialDelay"    # J
    .param p4, "period"    # J
    .param p6, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation

    .line 79
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->calculateAffinityThread(Ljava/lang/Runnable;)I

    move-result v0

    .line 80
    .local v0, "affThread":I
    iget-object v1, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    move-object v3, p1

    move-wide v4, p2

    move-wide v6, p4

    move-object v8, p6

    invoke-virtual/range {v2 .. v8}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    return-object v1
.end method

.method public scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 9
    .param p1, "command"    # Ljava/lang/Runnable;
    .param p2, "initialDelay"    # J
    .param p4, "delay"    # J
    .param p6, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation

    .line 85
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->calculateAffinityThread(Ljava/lang/Runnable;)I

    move-result v0

    .line 86
    .local v0, "affThread":I
    iget-object v1, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    move-object v3, p1

    move-wide v4, p2

    move-wide v6, p4

    move-object v8, p6

    invoke-virtual/range {v2 .. v8}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    return-object v1
.end method

.method public shutdown()V
    .locals 2

    .line 91
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ScheduledExecutorService;

    .line 92
    .local v1, "serv":Ljava/util/concurrent/ScheduledExecutorService;
    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 93
    .end local v1    # "serv":Ljava/util/concurrent/ScheduledExecutorService;
    goto :goto_0

    .line 94
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public shutdownNow()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .line 98
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "task"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            ")",
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation

    .line 129
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->calculateAffinityThread(Ljava/lang/Runnable;)I

    move-result v0

    .line 130
    .local v0, "affThread":I
    iget-object v1, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public submit(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "task"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Runnable;",
            "TT;)",
            "Ljava/util/concurrent/Future<",
            "TT;>;"
        }
    .end annotation

    .line 123
    .local p2, "result":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->calculateAffinityThread(Ljava/lang/Runnable;)I

    move-result v0

    .line 124
    .local v0, "affThread":I
    iget-object v1, p0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;->executors:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    invoke-virtual {v1, p1, p2}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->submit(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TT;>;)",
            "Ljava/util/concurrent/Future<",
            "TT;>;"
        }
    .end annotation

    .line 118
    .local p1, "task":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
