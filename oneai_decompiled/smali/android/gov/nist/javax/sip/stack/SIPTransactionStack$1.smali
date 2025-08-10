.class Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$1;
.super Ljava/lang/Object;
.source "SIPTransactionStack.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

.field private threadCount:I


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    .locals 0

    .line 446
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$1;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 447
    const/4 p1, 0x0

    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$1;->threadCount:I

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 3
    .param p1, "pRunnable"    # Ljava/lang/Runnable;

    .line 450
    new-instance v0, Ljava/lang/Thread;

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$1;->threadCount:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$1;->threadCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string/jumbo v2, "ReInviteSender"

    filled-new-array {v2, v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%s-%d"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    return-object v0
.end method
