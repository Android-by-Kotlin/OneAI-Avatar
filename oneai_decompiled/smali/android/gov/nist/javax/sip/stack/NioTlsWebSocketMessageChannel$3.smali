.class Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;
.super Ljava/lang/Object;
.source "NioTlsWebSocketMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sendMessage([BLjava/net/InetAddress;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

.field final synthetic val$b1:Ljava/nio/ByteBuffer;

.field final synthetic val$receiverAddress:Ljava/net/InetAddress;

.field final synthetic val$receiverPort:I

.field final synthetic val$retry:Z


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;Ljava/net/InetAddress;ILjava/nio/ByteBuffer;Z)V
    .locals 0

    .line 210
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->val$receiverAddress:Ljava/net/InetAddress;

    iput p3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->val$receiverPort:I

    iput-object p4, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->val$b1:Ljava/nio/ByteBuffer;

    iput-boolean p5, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->val$retry:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doSend([B)V
    .locals 4
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 214
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->val$receiverAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->val$receiverPort:I

    const/4 v3, 0x0

    invoke-static {v0, p1, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->access$601(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BLjava/net/InetAddress;IZ)V

    .line 218
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->val$b1:Ljava/nio/ByteBuffer;

    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    invoke-static {v3}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->access$300(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    new-instance v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3$1;

    invoke-direct {v3, p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3$1;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 229
    nop

    .line 230
    return-void

    .line 227
    :catch_0
    move-exception v0

    .line 228
    .local v0, "e":Ljava/io/IOException;
    throw v0
.end method
