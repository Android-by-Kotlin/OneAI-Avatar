.class public Landroid/gov/nist/javax/sip/stack/CallAnalyzer;
.super Ljava/lang/Object;
.source "CallAnalyzer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/CallAnalyzer$ThreadInfo;,
        Landroid/gov/nist/javax/sip/stack/CallAnalyzer$StackTrace;,
        Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;,
        Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;,
        Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;,
        Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;
    }
.end annotation


# static fields
.field static count:I

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

.field private stack:Landroid/gov/nist/javax/sip/SipStackImpl;

.field private threadMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Thread;",
            "Ljava/util/HashMap<",
            "Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private timer:Ljava/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 56
    const-class v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->logger:Landroid/gov/nist/core/StackLogger;

    .line 480
    const/4 v0, 0x0

    sput v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->count:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    .line 67
    new-instance v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    .line 69
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->timer:Ljava/util/Timer;

    .line 204
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/SipStackImpl;)V
    .locals 1
    .param p1, "stack"    # Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    .line 67
    new-instance v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    .line 69
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->timer:Ljava/util/Timer;

    .line 73
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->stack:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 74
    return-void
.end method

.method static synthetic access$000(Landroid/gov/nist/javax/sip/stack/CallAnalyzer;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    .line 55
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$100()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 55
    sget-object v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 12
    .param p0, "arg"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 418
    const/16 v0, 0x3e8

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 419
    .local v0, "ex":Ljava/util/concurrent/ExecutorService;
    new-instance v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;-><init>()V

    .line 420
    .local v1, "tp":Landroid/gov/nist/javax/sip/stack/CallAnalyzer;
    new-instance v2, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    const-string/jumbo v3, "sec"

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;-><init>(Ljava/lang/String;)V

    .line 421
    .local v2, "sec":Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;
    new-instance v3, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    const-string/jumbo v4, "se111c"

    invoke-direct {v3, v4}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;-><init>(Ljava/lang/String;)V

    .line 422
    .local v3, "se1c":Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;
    new-instance v4, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;

    const/16 v5, 0x1f4

    invoke-direct {v4, v5, v5, v5}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;-><init>(III)V

    invoke-virtual {v1, v2, v4}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->configure(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;)V

    .line 423
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->startAnalysis(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 424
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->startAnalysis(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 425
    new-instance v4, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$2;

    invoke-direct {v4, v1, v2}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$2;-><init>(Landroid/gov/nist/javax/sip/stack/CallAnalyzer;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 444
    .local v4, "r":Ljava/lang/Runnable;
    const/4 v5, 0x0

    .local v5, "q":I
    :goto_0
    const v6, 0x1e8480

    if-ge v5, v6, :cond_0

    .line 445
    invoke-interface {v0, v4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 444
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 448
    .end local v5    # "q":I
    :cond_0
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "size:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->size()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v9, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->size()I

    move-result v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 450
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 451
    const-wide/16 v5, 0xc8

    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v5, v6, v9}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    .line 452
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 453
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 454
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v9, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->size()I

    move-result v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v9, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->size()I

    move-result v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 455
    invoke-static {}, Ljava/lang/System;->gc()V

    const-wide/16 v5, 0x1388

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    .line 456
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 457
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 458
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 459
    const/4 v3, 0x0

    .line 460
    invoke-static {}, Ljava/lang/System;->gc()V

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    .line 461
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 462
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 463
    invoke-static {}, Ljava/lang/System;->gc()V

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    .line 464
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 465
    invoke-static {}, Ljava/lang/System;->gc()V

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    .line 466
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 467
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 468
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 469
    invoke-static {}, Ljava/lang/System;->gc()V

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    .line 470
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 471
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 472
    invoke-static {}, Ljava/lang/System;->gc()V

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    .line 473
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 474
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 475
    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    if-gtz v5, :cond_1

    .line 479
    return-void

    .line 476
    :cond_1
    new-instance v5, Ljava/lang/RuntimeException;

    const-string/jumbo v6, "Should be zero by this point. Leak."

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
.end method


# virtual methods
.method public configure(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;)V
    .locals 1
    .param p1, "ref"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;
    .param p2, "config"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;

    .line 92
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->get(Ljava/lang/Object;)Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    move-result-object v0

    iput-object p2, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->config:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;

    .line 93
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->isAnalysisStarted(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 94
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->startAnalysis(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 96
    :cond_0
    return-void
.end method

.method public enter(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V
    .locals 1
    .param p1, "metricReference"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    .line 333
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 334
    .local v0, "threadId":Ljava/lang/Thread;
    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->enter(Ljava/lang/Thread;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 335
    return-void
.end method

.method public enter(Ljava/lang/Thread;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V
    .locals 3
    .param p1, "threadId"    # Ljava/lang/Thread;
    .param p2, "metricReference"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    .line 357
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->getAttributes(Ljava/lang/Thread;)Ljava/util/HashMap;

    move-result-object v0

    .line 358
    .local v0, "attribs":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    return-void
.end method

.method public declared-synchronized getAttributes(Ljava/lang/Thread;)Ljava/util/HashMap;
    .locals 2
    .param p1, "threadId"    # Ljava/lang/Thread;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Thread;",
            ")",
            "Ljava/util/HashMap<",
            "Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 317
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 318
    .local v0, "threadLocal":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;>;"
    if-nez v0, :cond_0

    .line 319
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    move-object v0, v1

    .line 320
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 322
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/CallAnalyzer;
    :cond_0
    monitor-exit p0

    return-object v0

    .line 316
    .end local v0    # "threadLocal":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;>;"
    .end local p1    # "threadId":Ljava/lang/Thread;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public getCurrentStack(Ljava/lang/Thread;)Ljava/lang/String;
    .locals 10
    .param p1, "thread"    # Ljava/lang/Thread;

    .line 385
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 386
    .local v0, "sb":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread$State;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    invoke-virtual {p1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    .line 388
    .local v1, "ste":[Ljava/lang/StackTraceElement;
    move-object v4, v1

    .local v4, "arr$":[Ljava/lang/StackTraceElement;
    array-length v5, v4

    .local v5, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_0
    if-ge v6, v5, :cond_0

    aget-object v7, v4, v6

    .line 389
    .local v7, "el":Ljava/lang/StackTraceElement;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    .end local v7    # "el":Ljava/lang/StackTraceElement;
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 391
    .end local v4    # "arr$":[Ljava/lang/StackTraceElement;
    .end local v5    # "len$":I
    .end local v6    # "i$":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getMetricStats(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;
    .locals 1
    .param p1, "ref"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    .line 113
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->get(Ljava/lang/Object;)Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    move-result-object v0

    return-object v0
.end method

.method public getNumberOfThreads()I
    .locals 1

    .line 414
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->threadMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getObject(Ljava/lang/Thread;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "threadId"    # Ljava/lang/Thread;
    .param p2, "objectName"    # Ljava/lang/String;

    .line 313
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->getAttributes(Ljava/lang/Thread;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getThreadDump()Ljava/lang/String;
    .locals 5

    .line 399
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 400
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/16 v1, 0x1388

    new-array v1, v1, [Ljava/lang/Thread;

    .line 401
    .local v1, "threads":[Ljava/lang/Thread;
    invoke-static {v1}, Ljava/lang/Thread;->enumerate([Ljava/lang/Thread;)I

    move-result v2

    .line 402
    .local v2, "count":I
    const/4 v3, 0x0

    .local v3, "q":I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 403
    aget-object v4, v1, v3

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->getCurrentStack(Ljava/lang/Thread;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 405
    .end local v3    # "q":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getTime(Ljava/lang/Thread;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)Ljava/lang/Long;
    .locals 2
    .param p1, "threadId"    # Ljava/lang/Thread;
    .param p2, "metricReference"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    .line 290
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->getAttributes(Ljava/lang/Thread;)Ljava/util/HashMap;

    move-result-object v0

    .line 291
    .local v0, "attribs":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;>;"
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    return-object v1
.end method

.method public isAnalysisStarted(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)Z
    .locals 1
    .param p1, "ref"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    .line 104
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->get(Ljava/lang/Object;)Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->task:Ljava/util/TimerTask;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public leave(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V
    .locals 1
    .param p1, "metricReference"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    .line 345
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 346
    .local v0, "threadId":Ljava/lang/Thread;
    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->leave(Ljava/lang/Thread;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 347
    return-void
.end method

.method public leave(Ljava/lang/Thread;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V
    .locals 8
    .param p1, "threadId"    # Ljava/lang/Thread;
    .param p2, "metricReference"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    .line 370
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->get(Ljava/lang/Object;)Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    move-result-object v0

    .line 371
    .local v0, "info":Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->getAttributes(Ljava/lang/Thread;)Ljava/util/HashMap;

    move-result-object v1

    .line 372
    .local v1, "attribs":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long/2addr v2, v4

    .line 373
    .local v2, "delta":J
    iget-object v4, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->totalTime:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    add-long/2addr v4, v2

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->totalTime:Ljava/lang/Long;

    .line 374
    iget-object v4, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->numberOfEvents:Ljava/lang/Long;

    iget-object v4, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->numberOfEvents:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->numberOfEvents:Ljava/lang/Long;

    .line 375
    iget-object v4, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->totalTime:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-object v6, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->numberOfEvents:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    div-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->averageTime:Ljava/lang/Long;

    .line 376
    const-wide/high16 v4, -0x8000000000000000L

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v1, p2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    return-void
.end method

.method public resetStats(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V
    .locals 6
    .param p1, "metricReference"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    .line 196
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->get(Ljava/lang/Object;)Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    move-result-object v0

    .line 197
    .local v0, "info":Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;
    new-instance v1, Ljava/lang/Long;

    const-wide/16 v2, 0x0

    invoke-direct {v1, v2, v3}, Ljava/lang/Long;-><init>(J)V

    iput-object v1, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->totalTime:Ljava/lang/Long;

    .line 198
    new-instance v1, Ljava/lang/Long;

    invoke-direct {v1, v2, v3}, Ljava/lang/Long;-><init>(J)V

    iput-object v1, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->numberOfEvents:Ljava/lang/Long;

    .line 199
    new-instance v1, Ljava/lang/Long;

    const-wide/16 v4, 0x1

    invoke-direct {v1, v4, v5}, Ljava/lang/Long;-><init>(J)V

    iput-object v1, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->averageTime:Ljava/lang/Long;

    .line 200
    new-instance v1, Ljava/lang/Long;

    invoke-direct {v1, v2, v3}, Ljava/lang/Long;-><init>(J)V

    iput-object v1, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->lastLoggedEventTime:Ljava/lang/Long;

    .line 201
    return-void
.end method

.method public setObject(Ljava/lang/Thread;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;)V
    .locals 1
    .param p1, "threadId"    # Ljava/lang/Thread;
    .param p2, "objectName"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;
    .param p3, "object"    # Ljava/lang/Object;

    .line 302
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->getAttributes(Ljava/lang/Thread;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    return-void
.end method

.method public startAnalysis(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V
    .locals 8
    .param p1, "metricReference"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    .line 225
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->stopAnalysis(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 226
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->resetStats(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 227
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->get(Ljava/lang/Object;)Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    move-result-object v0

    .line 229
    .local v0, "statInfo":Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;
    new-instance v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;

    invoke-direct {v1, p0, v0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;-><init>(Landroid/gov/nist/javax/sip/stack/CallAnalyzer;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    iput-object v1, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->task:Ljava/util/TimerTask;

    .line 277
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->timer:Ljava/util/Timer;

    iget-object v3, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->task:Ljava/util/TimerTask;

    iget-object v1, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->config:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;->checkingInterval:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-object v1, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->config:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;->checkingInterval:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-virtual/range {v2 .. v7}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 278
    return-void
.end method

.method public stop()V
    .locals 1

    .line 284
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 285
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->timer:Ljava/util/Timer;

    .line 286
    return-void
.end method

.method public stopAnalysis(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V
    .locals 2
    .param p1, "metricReference"    # Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    .line 212
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->metricStatisticsMap:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->get(Ljava/lang/Object;)Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    move-result-object v0

    .line 213
    .local v0, "statInfo":Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;
    iget-object v1, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->task:Ljava/util/TimerTask;

    if-eqz v1, :cond_0

    .line 214
    iget-object v1, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->task:Ljava/util/TimerTask;

    invoke-virtual {v1}, Ljava/util/TimerTask;->cancel()Z

    .line 215
    const/4 v1, 0x0

    iput-object v1, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->task:Ljava/util/TimerTask;

    .line 217
    :cond_0
    return-void
.end method
