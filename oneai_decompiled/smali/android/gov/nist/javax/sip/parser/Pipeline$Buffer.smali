.class Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;
.super Ljava/lang/Object;
.source "Pipeline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/parser/Pipeline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Buffer"
.end annotation


# instance fields
.field bytes:[B

.field length:I

.field ptr:I

.field final synthetic this$0:Landroid/gov/nist/javax/sip/parser/Pipeline;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/parser/Pipeline;[BI)V
    .locals 0
    .param p2, "bytes"    # [B
    .param p3, "length"    # I

    .line 104
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->this$0:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    const/4 p1, 0x0

    iput p1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->ptr:I

    .line 106
    iput p3, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->length:I

    .line 107
    iput-object p2, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->bytes:[B

    .line 108
    return-void
.end method


# virtual methods
.method public getNextByte()I
    .locals 3

    .line 111
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->bytes:[B

    iget v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->ptr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->ptr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method
