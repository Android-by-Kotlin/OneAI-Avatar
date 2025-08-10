.class public Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;
.super Ljava/lang/Object;
.source "SSLStateMachine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SSLStateMachine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MessageSendItem"
.end annotation


# instance fields
.field private callback:Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;

.field private message:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    .locals 0
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "callback"    # Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;

    .line 478
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 479
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->message:Ljava/nio/ByteBuffer;

    .line 480
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->callback:Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;

    .line 481
    return-void
.end method

.method static synthetic access$000(Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;)Ljava/nio/ByteBuffer;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;

    .line 473
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->message:Ljava/nio/ByteBuffer;

    return-object v0
.end method


# virtual methods
.method public getCallBack()Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;
    .locals 1

    .line 484
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->callback:Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 488
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->message:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->callback:Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
