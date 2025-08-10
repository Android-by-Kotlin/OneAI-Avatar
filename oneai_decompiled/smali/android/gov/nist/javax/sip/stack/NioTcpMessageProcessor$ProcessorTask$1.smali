.class Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$1;
.super Ljava/lang/Object;
.source "NioTcpMessageProcessor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->connect(Ljava/nio/channels/SelectionKey;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;

.field final synthetic val$nioTcpMessageChannel:Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;)V
    .locals 0

    .line 305
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$1;->this$1:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;

    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$1;->val$nioTcpMessageChannel:Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 307
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$1;->val$nioTcpMessageChannel:Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->triggerConnectSuccess()V

    .line 308
    return-void
.end method
