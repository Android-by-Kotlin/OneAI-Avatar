.class public Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;
.super Ljava/util/WeakHashMap;
.source "CallAnalyzer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/CallAnalyzer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MetricReferenceMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/WeakHashMap<",
        "Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;",
        "Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x5750a10b481789cL


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 163
    invoke-direct {p0}, Ljava/util/WeakHashMap;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 170
    invoke-super {p0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 171
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    new-instance v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;-><init>()V

    invoke-super {p0, v0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    :cond_0
    invoke-super {p0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 163
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReferenceMap;->get(Ljava/lang/Object;)Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    move-result-object p1

    return-object p1
.end method
