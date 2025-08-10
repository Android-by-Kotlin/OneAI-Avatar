.class Landroid/gov/nist/javax/sip/parser/Pipeline$MyTimer;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "Pipeline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/parser/Pipeline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyTimer"
.end annotation


# instance fields
.field private isCancelled:Z

.field pipeline:Landroid/gov/nist/javax/sip/parser/Pipeline;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/parser/Pipeline;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Pipeline;Landroid/gov/nist/javax/sip/parser/Pipeline;)V
    .locals 0
    .param p2, "pipeline"    # Landroid/gov/nist/javax/sip/parser/Pipeline;

    .line 66
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$MyTimer;->this$0:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 67
    iput-object p2, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$MyTimer;->pipeline:Landroid/gov/nist/javax/sip/parser/Pipeline;

    .line 68
    return-void
.end method


# virtual methods
.method public cleanUpBeforeCancel()V
    .locals 1

    .line 90
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$MyTimer;->isCancelled:Z

    .line 91
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$MyTimer;->pipeline:Landroid/gov/nist/javax/sip/parser/Pipeline;

    .line 92
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->cleanUpBeforeCancel()V

    .line 93
    return-void
.end method

.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 72
    const/4 v0, 0x0

    return-object v0
.end method

.method public runTask()V
    .locals 1

    .line 76
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$MyTimer;->isCancelled:Z

    if-eqz v0, :cond_0

    .line 77
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$MyTimer;->pipeline:Landroid/gov/nist/javax/sip/parser/Pipeline;

    .line 78
    return-void

    .line 82
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$MyTimer;->pipeline:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/Pipeline;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    goto :goto_0

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 86
    .end local v0    # "ex":Ljava/io/IOException;
    :goto_0
    return-void
.end method
