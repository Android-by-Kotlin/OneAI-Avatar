.class Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;
.super Ljava/lang/Object;
.source "NioTlsWebSocketMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sendMessage([BZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

.field final synthetic val$b1:Ljava/nio/ByteBuffer;

.field final synthetic val$isClient:Z


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;Ljava/nio/ByteBuffer;Z)V
    .locals 0

    .line 136
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->val$b1:Ljava/nio/ByteBuffer;

    iput-boolean p3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->val$isClient:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doSend([B)V
    .locals 5
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->access$001(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;)Ljava/net/InetAddress;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->access$101(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;)I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v0, p1, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->access$201(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BLjava/net/InetAddress;IZ)V

    .line 143
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 146
    .local v0, "sent":Ljava/lang/Boolean;
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sslStateMachine:Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->val$b1:Ljava/nio/ByteBuffer;

    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    invoke-static {v4}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->access$300(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    new-instance v4, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1$1;

    invoke-direct {v4, p0}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1$1;-><init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;)V

    invoke-virtual {v1, v2, v3, v4}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    nop

    .line 156
    return-void

    .line 153
    :catch_0
    move-exception v1

    .line 154
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Can\'t send message"

    invoke-direct {v2, v3, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
