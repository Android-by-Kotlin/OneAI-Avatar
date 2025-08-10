.class Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1$1;
.super Ljava/lang/Object;
.source "NioTlsWebSocketMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->doSend([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;)V
    .locals 0

    .line 146
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1$1;->this$1:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doSend([B)V
    .locals 2
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 150
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1$1;->this$1:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->this$0:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1$1;->this$1:Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;

    iget-boolean v1, v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$1;->val$isClient:Z

    invoke-static {v0, p1, v1}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;->access$401(Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;[BZ)V

    .line 151
    return-void
.end method
