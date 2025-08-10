.class public Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;
.super Ljava/lang/Object;
.source "CallAnalyzer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/CallAnalyzer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MetricAnalysisConfiguration"
.end annotation


# instance fields
.field protected checkingInterval:Ljava/lang/Long;

.field protected minimumDumpInterval:Ljava/lang/Long;

.field protected stuckTimeBeforeDump:Ljava/lang/Long;


# direct methods
.method public constructor <init>(III)V
    .locals 3
    .param p1, "checkingInterval"    # I
    .param p2, "minDumpInterval"    # I
    .param p3, "stuckTimerBeforeDump"    # I

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    new-instance v0, Ljava/lang/Long;

    int-to-long v1, p1

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;->checkingInterval:Ljava/lang/Long;

    .line 133
    new-instance v0, Ljava/lang/Long;

    int-to-long v1, p2

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;->minimumDumpInterval:Ljava/lang/Long;

    .line 134
    new-instance v0, Ljava/lang/Long;

    int-to-long v1, p3

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;->stuckTimeBeforeDump:Ljava/lang/Long;

    .line 135
    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 0
    .param p1, "checkingInterval"    # Ljava/lang/Long;
    .param p2, "minDumpInterval"    # Ljava/lang/Long;
    .param p3, "stuckTimerBeforeDump"    # Ljava/lang/Long;

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;->checkingInterval:Ljava/lang/Long;

    .line 128
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;->minimumDumpInterval:Ljava/lang/Long;

    .line 129
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;->stuckTimeBeforeDump:Ljava/lang/Long;

    .line 130
    return-void
.end method
