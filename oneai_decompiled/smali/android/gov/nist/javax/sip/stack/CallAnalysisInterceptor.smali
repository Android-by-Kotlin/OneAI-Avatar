.class public Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;
.super Ljava/lang/Object;
.source "CallAnalysisInterceptor.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;


# static fields
.field private static final interceptorCheckpoint:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;


# instance fields
.field private callAnalyzer:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 46
    new-instance v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    const-string/jumbo v1, "ick"

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;->interceptorCheckpoint:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterMessage(Landroid/javax/sip/message/Message;)V
    .locals 2
    .param p1, "message"    # Landroid/javax/sip/message/Message;

    .line 49
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;->callAnalyzer:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    sget-object v1, Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;->interceptorCheckpoint:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->leave(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 51
    return-void
.end method

.method public beforeMessage(Landroid/javax/sip/message/Message;)V
    .locals 2
    .param p1, "message"    # Landroid/javax/sip/message/Message;

    .line 54
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;->callAnalyzer:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    sget-object v1, Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;->interceptorCheckpoint:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->enter(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V

    .line 55
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 58
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;->callAnalyzer:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->stop()V

    .line 59
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;->callAnalyzer:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    .line 61
    return-void
.end method

.method public init(Landroid/javax/sip/SipStack;)V
    .locals 7
    .param p1, "stack"    # Landroid/javax/sip/SipStack;

    .line 63
    new-instance v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;-><init>(Landroid/gov/nist/javax/sip/SipStackImpl;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;->callAnalyzer:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    .line 64
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getConfigurationProperties()Ljava/util/Properties;

    move-result-object v0

    .line 65
    .local v0, "props":Ljava/util/Properties;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ".checkingInterval"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "1000"

    invoke-virtual {v0, v1, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 67
    .local v1, "checkingInterval":Ljava/lang/Long;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".minStuckTIme"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "4000"

    invoke-virtual {v0, v3, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 69
    .local v3, "minStuckTime":Ljava/lang/Long;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ".minTimeBetweenDumps"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "2000"

    invoke-virtual {v0, v2, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 71
    .local v2, "minTimeBetweenDumps":Ljava/lang/Long;
    new-instance v4, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;

    invoke-direct {v4, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;-><init>(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V

    .line 73
    .local v4, "config":Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;->callAnalyzer:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    sget-object v6, Landroid/gov/nist/javax/sip/stack/CallAnalysisInterceptor;->interceptorCheckpoint:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    invoke-virtual {v5, v6, v4}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->configure(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;)V

    .line 74
    return-void
.end method
