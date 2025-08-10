.class final Landroid/gov/nist/javax/sip/stack/CallAnalyzer$2;
.super Ljava/lang/Object;
.source "CallAnalyzer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->main([Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$sec:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

.field final synthetic val$tp:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/CallAnalyzer;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V
    .locals 0

    .line 425
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$2;->val$tp:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$2;->val$sec:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 428
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$2;->val$tp:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$2;->val$sec:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->enter(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 430
    :try_start_0
    sget v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->count:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->count:I

    rem-int/lit16 v0, v0, 0x2710

    if-nez v0, :cond_0

    .line 431
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Avg "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$2;->val$tp:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$2;->val$sec:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->getMetricStats(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->averageTime:Ljava/lang/Long;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 432
    const-wide/16 v0, 0x3e8

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 435
    :cond_0
    const-wide/16 v0, 0x64

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 440
    goto :goto_0

    .line 437
    :catch_0
    move-exception v0

    .line 439
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 441
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$2;->val$tp:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$2;->val$sec:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->leave(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 442
    return-void
.end method
