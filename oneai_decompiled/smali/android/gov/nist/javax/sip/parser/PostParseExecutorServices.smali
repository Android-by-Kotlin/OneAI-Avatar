.class public Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;
.super Ljava/lang/Object;
.source "PostParseExecutorServices.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices$NamedThreadFactory;
    }
.end annotation


# static fields
.field private static postParseExecutor:Ljava/util/concurrent/ExecutorService;

.field public static staticQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field public static staticQueueAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    const/4 v0, 0x0

    sput-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->postParseExecutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method public static getPostParseExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .line 57
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->postParseExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public static setPostParseExcutorSize(Landroid/gov/nist/javax/sip/SipStackImpl;II)V
    .locals 9
    .param p0, "sipStack"    # Landroid/gov/nist/javax/sip/SipStackImpl;
    .param p1, "threads"    # I
    .param p2, "queueTimeout"    # I

    .line 29
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->postParseExecutor:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    .line 30
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->postParseExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 32
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->staticQueueAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    if-eqz v0, :cond_1

    .line 34
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->staticQueueAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    goto :goto_0

    .line 35
    :catch_0
    move-exception v0

    .line 39
    :cond_1
    :goto_0
    if-gtz p1, :cond_2

    .line 40
    const/4 v0, 0x0

    sput-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->postParseExecutor:Ljava/util/concurrent/ExecutorService;

    goto :goto_1

    .line 42
    :cond_2
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    sput-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->staticQueue:Ljava/util/concurrent/BlockingQueue;

    .line 43
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v7, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->staticQueue:Ljava/util/concurrent/BlockingQueue;

    new-instance v8, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices$NamedThreadFactory;

    invoke-direct {v8}, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices$NamedThreadFactory;-><init>()V

    const-wide/16 v4, 0x0

    move-object v1, v0

    move v2, p1

    move v3, p1

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    sput-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->postParseExecutor:Ljava/util/concurrent/ExecutorService;

    .line 47
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getStackCongestionControlTimeout()I

    move-result v0

    if-lez v0, :cond_3

    .line 48
    new-instance v0, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    sget-object v1, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->staticQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;-><init>(Ljava/util/Queue;)V

    sput-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->staticQueueAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    .line 49
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->staticQueueAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->setTimeout(I)V

    .line 50
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->staticQueueAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    const/16 v1, 0x7d0

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->start(I)V

    .line 54
    :cond_3
    :goto_1
    return-void
.end method

.method public static shutdownThreadpool()V
    .locals 1

    .line 60
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->postParseExecutor:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    .line 61
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->postParseExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 62
    const/4 v0, 0x0

    sput-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->postParseExecutor:Ljava/util/concurrent/ExecutorService;

    .line 64
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->staticQueueAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    if-eqz v0, :cond_1

    .line 66
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->staticQueueAuditor:Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/BlockingQueueDispatchAuditor;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    goto :goto_0

    .line 67
    :catch_0
    move-exception v0

    .line 71
    :cond_1
    :goto_0
    return-void
.end method
