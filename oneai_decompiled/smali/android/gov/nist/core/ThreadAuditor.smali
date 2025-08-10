.class public Landroid/gov/nist/core/ThreadAuditor;
.super Ljava/lang/Object;
.source "ThreadAuditor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;
    }
.end annotation


# instance fields
.field private pingIntervalInMillisecs:J

.field private threadHandles:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Thread;",
            "Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/core/ThreadAuditor;->threadHandles:Ljava/util/Map;

    .line 30
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroid/gov/nist/core/ThreadAuditor;->pingIntervalInMillisecs:J

    .line 33
    return-void
.end method


# virtual methods
.method public addCurrentThread()Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;
    .locals 3

    .line 107
    new-instance v0, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    invoke-direct {v0, p0, p0}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;-><init>(Landroid/gov/nist/core/ThreadAuditor;Landroid/gov/nist/core/ThreadAuditor;)V

    .line 108
    .local v0, "threadHandle":Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;
    invoke-virtual {p0}, Landroid/gov/nist/core/ThreadAuditor;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 109
    iget-object v1, p0, Landroid/gov/nist/core/ThreadAuditor;->threadHandles:Ljava/util/Map;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    :cond_0
    return-object v0
.end method

.method public auditThreads()Ljava/lang/String;
    .locals 6

    .line 135
    const/4 v0, 0x0

    .line 139
    .local v0, "auditReport":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/core/ThreadAuditor;->threadHandles:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 140
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 141
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    .line 142
    .local v2, "threadHandle":Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;
    invoke-virtual {v2}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;->isThreadActive()Z

    move-result v3

    if-nez v3, :cond_1

    .line 144
    invoke-virtual {v2}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;->getThread()Ljava/lang/Thread;

    move-result-object v3

    .line 147
    .local v3, "thread":Ljava/lang/Thread;
    if-nez v0, :cond_0

    .line 148
    const-string/jumbo v0, "Thread Auditor Report:\n"

    .line 150
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "   Thread ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "] has failed to respond to an audit request.\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 176
    .end local v3    # "thread":Ljava/lang/Thread;
    :cond_1
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;->setThreadActive(Z)V

    .line 177
    .end local v2    # "threadHandle":Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;
    goto :goto_0

    .line 178
    :cond_2
    return-object v0
.end method

.method public getPingIntervalInMillisecs()J
    .locals 2

    .line 90
    iget-wide v0, p0, Landroid/gov/nist/core/ThreadAuditor;->pingIntervalInMillisecs:J

    return-wide v0
.end method

.method public isEnabled()Z
    .locals 4

    .line 100
    iget-wide v0, p0, Landroid/gov/nist/core/ThreadAuditor;->pingIntervalInMillisecs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public ping(Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;)V
    .locals 1
    .param p1, "threadHandle"    # Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    .line 121
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;->setThreadActive(Z)V

    .line 122
    return-void
.end method

.method public removeThread(Ljava/lang/Thread;)V
    .locals 1
    .param p1, "thread"    # Ljava/lang/Thread;

    .line 116
    iget-object v0, p0, Landroid/gov/nist/core/ThreadAuditor;->threadHandles:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    return-void
.end method

.method public reset()V
    .locals 1

    .line 126
    iget-object v0, p0, Landroid/gov/nist/core/ThreadAuditor;->threadHandles:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 127
    return-void
.end method

.method public setPingIntervalInMillisecs(J)V
    .locals 0
    .param p1, "value"    # J

    .line 95
    iput-wide p1, p0, Landroid/gov/nist/core/ThreadAuditor;->pingIntervalInMillisecs:J

    .line 96
    return-void
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .locals 5

    monitor-enter p0

    .line 187
    :try_start_0
    const-string/jumbo v0, "Thread Auditor - List of monitored threads:\n"

    .line 188
    .local v0, "toString":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/core/ThreadAuditor;->threadHandles:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 189
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 190
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    .line 191
    .local v2, "threadHandle":Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "   "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v3

    .line 192
    .end local v2    # "threadHandle":Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;
    goto :goto_0

    .line 193
    .end local p0    # "this":Landroid/gov/nist/core/ThreadAuditor;
    :cond_0
    monitor-exit p0

    return-object v0

    .line 186
    .end local v0    # "toString":Ljava/lang/String;
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;>;"
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
