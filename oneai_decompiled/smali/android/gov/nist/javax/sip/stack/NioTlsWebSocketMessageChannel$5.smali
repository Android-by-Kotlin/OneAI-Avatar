.class Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$5;
.super Ljava/lang/Object;
.source "NioTlsWebSocketMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->sendHttpMessage([BLjava/net/InetAddress;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

.field final synthetic val$receiverAddress:Ljava/net/InetAddress;

.field final synthetic val$receiverPort:I

.field final synthetic val$retry:Z


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;Ljava/net/InetAddress;IZ)V
    .locals 0

    .line 271
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$5;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$5;->val$receiverAddress:Ljava/net/InetAddress;

    iput p3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$5;->val$receiverPort:I

    iput-boolean p4, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$5;->val$retry:Z

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

    .line 275
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$5;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$5;->val$receiverAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$5;->val$receiverPort:I

    iget-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$5;->val$retry:Z

    invoke-static {v0, p1, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->access$901(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BLjava/net/InetAddress;IZ)V

    .line 278
    return-void
.end method
