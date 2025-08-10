.class public Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices$NamedThreadFactory;
.super Ljava/lang/Object;
.source "PostParseExecutorServices.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NamedThreadFactory"
.end annotation


# static fields
.field static threadNumber:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 17
    const-wide/16 v0, 0x0

    sput-wide v0, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices$NamedThreadFactory;->threadNumber:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 6
    .param p1, "arg0"    # Ljava/lang/Runnable;

    .line 19
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 20
    .local v0, "thread":Ljava/lang/Thread;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "SIP-TCP-Core-PipelineThreadpool-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-wide v2, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices$NamedThreadFactory;->threadNumber:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    sput-wide v4, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices$NamedThreadFactory;->threadNumber:J

    const-wide/32 v4, 0x3b9ac9ff

    rem-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 21
    return-object v0
.end method
