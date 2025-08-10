.class Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$2;
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

.field final synthetic val$socketChannel:Ljava/nio/channels/SocketChannel;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;Ljava/nio/channels/SocketChannel;)V
    .locals 0

    .line 326
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$2;->this$1:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;

    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$2;->val$nioTcpMessageChannel:Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$2;->val$socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 328
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$2;->val$nioTcpMessageChannel:Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$2;->this$1:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$100(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$2;->val$socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Queue;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->triggerConnectFailure(Ljava/util/Queue;)V

    .line 329
    return-void
.end method
