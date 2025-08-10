.class public Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;
.super Ljava/lang/Object;
.source "CallAnalyzer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/CallAnalyzer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MetricReference"
.end annotation


# instance fields
.field public name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;->name:Ljava/lang/String;

    .line 149
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "other"    # Ljava/lang/Object;

    .line 151
    instance-of v0, p1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    if-eqz v0, :cond_0

    .line 152
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    .line 153
    .local v0, "stat":Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;
    iget-object v1, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;->name:Ljava/lang/String;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 155
    .end local v0    # "stat":Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 158
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
