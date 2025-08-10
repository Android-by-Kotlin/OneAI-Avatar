.class Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$RemoveForkedTransactionTimerTask;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPTransactionStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RemoveForkedTransactionTimerTask"
.end annotation


# instance fields
.field private final forkId:Ljava/lang/String;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Ljava/lang/String;)V
    .locals 0
    .param p2, "forkId"    # Ljava/lang/String;

    .line 498
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$RemoveForkedTransactionTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 499
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$RemoveForkedTransactionTimerTask;->forkId:Ljava/lang/String;

    .line 500
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 504
    const/4 v0, 0x0

    return-object v0
.end method

.method public runTask()V
    .locals 3

    .line 509
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 510
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Removing forked client transaction : forkId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$RemoveForkedTransactionTimerTask;->forkId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 513
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$RemoveForkedTransactionTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->access$100(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$RemoveForkedTransactionTimerTask;->forkId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    return-void
.end method
