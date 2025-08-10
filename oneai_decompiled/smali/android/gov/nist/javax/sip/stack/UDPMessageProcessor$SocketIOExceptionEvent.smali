.class Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor$SocketIOExceptionEvent;
.super Landroid/javax/sip/IOExceptionEvent;
.source "UDPMessageProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SocketIOExceptionEvent"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0xacdca8251406350L


# instance fields
.field private final msg:Ljava/lang/String;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;Ljava/lang/String;)V
    .locals 3
    .param p2, "msg"    # Ljava/lang/String;

    .line 298
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor$SocketIOExceptionEvent;->this$0:Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;

    .line 299
    iget-object v0, p1, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->sock:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->access$000(Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;)I

    move-result v1

    iget-object v2, p1, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;->transport:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/javax/sip/IOExceptionEvent;-><init>(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/String;)V

    .line 300
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor$SocketIOExceptionEvent;->msg:Ljava/lang/String;

    .line 301
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 305
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor$SocketIOExceptionEvent;->msg:Ljava/lang/String;

    return-object v0
.end method
