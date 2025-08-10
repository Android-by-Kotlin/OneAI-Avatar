.class Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPDialog.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EarlyStateTimerTask"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    .locals 0

    .line 372
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 374
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 396
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public runTask()V
    .locals 3

    .line 379
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v1, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    invoke-virtual {v0, v1}, Landroid/javax/sip/DialogState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 381
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$300(Landroid/gov/nist/javax/sip/stack/SIPDialog;I)V

    goto :goto_0

    .line 384
    :cond_0
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 385
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EarlyStateTimerTask : Dialog state is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 391
    :cond_1
    :goto_0
    goto :goto_1

    .line 388
    :catch_0
    move-exception v0

    .line 389
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string/jumbo v2, "Unexpected exception delivering event"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 392
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_1
    return-void
.end method
