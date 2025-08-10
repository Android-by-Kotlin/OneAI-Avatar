.class public Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;
.super Ljava/lang/Object;
.source "CallAnalyzer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/CallAnalyzer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TImeMetricInfo"
.end annotation


# instance fields
.field public averageTime:Ljava/lang/Long;

.field protected config:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;

.field public lastLoggedEventTime:Ljava/lang/Long;

.field public numberOfEvents:Ljava/lang/Long;

.field protected task:Ljava/util/TimerTask;

.field public totalTime:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v0, Ljava/lang/Long;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->totalTime:Ljava/lang/Long;

    .line 78
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->numberOfEvents:Ljava/lang/Long;

    .line 79
    new-instance v0, Ljava/lang/Long;

    const-wide/16 v3, 0x1

    invoke-direct {v0, v3, v4}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->averageTime:Ljava/lang/Long;

    .line 80
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->lastLoggedEventTime:Ljava/lang/Long;

    .line 82
    new-instance v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;

    const/16 v1, 0x1388

    invoke-direct {v0, v1, v1, v1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;-><init>(III)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->config:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;

    return-void
.end method
