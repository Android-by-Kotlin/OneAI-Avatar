.class public Landroid/javax/sdp/SdpParseException;
.super Landroid/javax/sdp/SdpException;
.source "SdpParseException.java"


# instance fields
.field private charOffset:I

.field private lineNumber:I


# direct methods
.method public constructor <init>(IILjava/lang/String;)V
    .locals 0
    .param p1, "lineNumber"    # I
    .param p2, "charOffset"    # I
    .param p3, "message"    # Ljava/lang/String;

    .line 41
    invoke-direct {p0, p3}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    .line 42
    iput p1, p0, Landroid/javax/sdp/SdpParseException;->lineNumber:I

    .line 43
    iput p2, p0, Landroid/javax/sdp/SdpParseException;->charOffset:I

    .line 44
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "lineNumber"    # I
    .param p2, "charOffset"    # I
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "rootCause"    # Ljava/lang/Throwable;

    .line 29
    invoke-direct {p0, p3, p4}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    iput p1, p0, Landroid/javax/sdp/SdpParseException;->lineNumber:I

    .line 31
    iput p2, p0, Landroid/javax/sdp/SdpParseException;->charOffset:I

    .line 32
    return-void
.end method


# virtual methods
.method public getCharOffset()I
    .locals 1

    .line 57
    iget v0, p0, Landroid/javax/sdp/SdpParseException;->charOffset:I

    return v0
.end method

.method public getLineNumber()I
    .locals 1

    .line 50
    iget v0, p0, Landroid/javax/sdp/SdpParseException;->lineNumber:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 65
    invoke-super {p0}, Landroid/javax/sdp/SdpException;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
