.class public Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;
.super Ljava/lang/Object;
.source "NioTcpMessageProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChangeRequest"
.end annotation


# static fields
.field public static final CHANGEOPS:I = 0x2

.field public static final REGISTER:I = 0x1


# instance fields
.field public ops:I

.field public socket:Ljava/nio/channels/SocketChannel;

.field public type:I


# direct methods
.method public constructor <init>(Ljava/nio/channels/SocketChannel;II)V
    .locals 0
    .param p1, "socket"    # Ljava/nio/channels/SocketChannel;
    .param p2, "type"    # I
    .param p3, "ops"    # I

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->socket:Ljava/nio/channels/SocketChannel;

    .line 85
    iput p2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->type:I

    .line 86
    iput p3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->ops:I

    .line 87
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->socket:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " type = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ops = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->ops:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
