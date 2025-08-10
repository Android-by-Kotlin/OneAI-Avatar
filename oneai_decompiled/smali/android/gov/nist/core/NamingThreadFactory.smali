.class public Landroid/gov/nist/core/NamingThreadFactory;
.super Ljava/lang/Object;
.source "NamingThreadFactory.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# instance fields
.field private baseName:Ljava/lang/String;

.field private delegate:Ljava/util/concurrent/ThreadFactory;

.field private index:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "baseName"    # Ljava/lang/String;

    .line 21
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/gov/nist/core/NamingThreadFactory;-><init>(Ljava/lang/String;Ljava/util/concurrent/ThreadFactory;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/concurrent/ThreadFactory;)V
    .locals 2
    .param p1, "baseName"    # Ljava/lang/String;
    .param p2, "delegate"    # Ljava/util/concurrent/ThreadFactory;

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Landroid/gov/nist/core/NamingThreadFactory;->baseName:Ljava/lang/String;

    .line 26
    iput-object p2, p0, Landroid/gov/nist/core/NamingThreadFactory;->delegate:Ljava/util/concurrent/ThreadFactory;

    .line 27
    iget-object v0, p0, Landroid/gov/nist/core/NamingThreadFactory;->delegate:Ljava/util/concurrent/ThreadFactory;

    if-nez v0, :cond_0

    .line 28
    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/NamingThreadFactory;->delegate:Ljava/util/concurrent/ThreadFactory;

    .line 30
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/core/NamingThreadFactory;->index:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 31
    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "pool-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NamingThreadFactory;->baseName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-thread-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/NamingThreadFactory;->index:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 36
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/core/NamingThreadFactory;->delegate:Ljava/util/concurrent/ThreadFactory;

    invoke-interface {v1, p1}, Ljava/util/concurrent/ThreadFactory;->newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object v1

    .line 37
    .local v1, "ret":Ljava/lang/Thread;
    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 38
    return-object v1
.end method
