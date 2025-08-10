.class Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$6;
.super Ljava/lang/Object;
.source "NioTlsWebSocketMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sendNonWebSocketMessage([BZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

.field final synthetic val$isClient:Z


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;Z)V
    .locals 0

    .line 333
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$6;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iput-boolean p2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$6;->val$isClient:Z

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

    .line 337
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$6;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$6;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$6;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget v2, v2, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->peerPort:I

    iget-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$6;->val$isClient:Z

    invoke-static {v0, p1, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->access$1001(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BLjava/net/InetAddress;IZ)V

    .line 340
    return-void
.end method
