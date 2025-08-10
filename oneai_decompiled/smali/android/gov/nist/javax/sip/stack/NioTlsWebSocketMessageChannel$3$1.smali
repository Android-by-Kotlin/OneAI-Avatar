.class Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3$1;
.super Ljava/lang/Object;
.source "NioTlsWebSocketMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->doSend([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;)V
    .locals 0

    .line 218
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3$1;->this$1:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;

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

    .line 222
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3$1;->this$1:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3$1;->this$1:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->val$receiverAddress:Ljava/net/InetAddress;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3$1;->this$1:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;

    iget v2, v2, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->val$receiverPort:I

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3$1;->this$1:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;

    iget-boolean v3, v3, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$3;->val$retry:Z

    invoke-static {v0, p1, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->access$701(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BLjava/net/InetAddress;IZ)V

    .line 225
    return-void
.end method
