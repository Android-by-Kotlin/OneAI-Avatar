.class Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
.super Ljava/lang/Object;
.source "PipelinedMsgParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CallIDOrderingStructure"
.end annotation


# instance fields
.field private messagesForCallID:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroid/gov/nist/javax/sip/message/SIPMessage;",
            ">;"
        }
    .end annotation
.end field

.field private semaphore:Ljava/util/concurrent/Semaphore;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)V
    .locals 1

    .line 613
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 614
    new-instance p1, Ljava/util/concurrent/Semaphore;

    const/4 v0, 0x1

    invoke-direct {p1, v0, v0}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;->semaphore:Ljava/util/concurrent/Semaphore;

    .line 615
    new-instance p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;->messagesForCallID:Ljava/util/Queue;

    .line 616
    return-void
.end method


# virtual methods
.method public getMessagesForCallID()Ljava/util/Queue;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Queue<",
            "Landroid/gov/nist/javax/sip/message/SIPMessage;",
            ">;"
        }
    .end annotation

    .line 629
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;->messagesForCallID:Ljava/util/Queue;

    return-object v0
.end method

.method public getSemaphore()Ljava/util/concurrent/Semaphore;
    .locals 1

    .line 622
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;->semaphore:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method
