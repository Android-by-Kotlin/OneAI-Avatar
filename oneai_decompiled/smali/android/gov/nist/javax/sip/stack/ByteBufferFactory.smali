.class public Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;
.super Ljava/lang/Object;
.source "ByteBufferFactory.java"


# static fields
.field private static instance:Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private useDirect:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    const-class v0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->logger:Landroid/gov/nist/core/StackLogger;

    .line 43
    new-instance v0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;-><init>()V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->instance:Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->useDirect:Z

    return-void
.end method

.method public static getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;
    .locals 1

    .line 48
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->instance:Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    return-object v0
.end method


# virtual methods
.method public allocate(I)Ljava/nio/ByteBuffer;
    .locals 3
    .param p1, "capacity"    # I

    .line 58
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Allocating buffer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logTrace(Ljava/lang/String;)V

    .line 60
    :cond_0
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public allocateDirect(I)Ljava/nio/ByteBuffer;
    .locals 3
    .param p1, "capacity"    # I

    .line 52
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Allocating direct buffer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logTrace(Ljava/lang/String;)V

    .line 54
    :cond_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->useDirect:Z

    if-eqz v0, :cond_1

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_0

    :cond_1
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public setUseDirect(Z)V
    .locals 3
    .param p1, "useDirect"    # Z

    .line 65
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 66
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Direct buffers are "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p1, :cond_0

    const-string/jumbo v2, "enabled"

    goto :goto_0

    :cond_0
    const-string/jumbo v2, "disabled"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logTrace(Ljava/lang/String;)V

    .line 67
    :cond_1
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->useDirect:Z

    .line 68
    return-void
.end method
