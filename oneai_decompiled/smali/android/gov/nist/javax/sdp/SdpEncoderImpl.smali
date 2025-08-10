.class public Landroid/gov/nist/javax/sdp/SdpEncoderImpl;
.super Ljava/lang/Object;
.source "SdpEncoderImpl.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    return-void
.end method


# virtual methods
.method public output(Landroid/javax/sdp/SessionDescription;Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "sd"    # Landroid/javax/sdp/SessionDescription;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 108
    instance-of v0, p2, Ljava/io/ObjectOutputStream;

    if-eqz v0, :cond_1

    .line 109
    move-object v0, p2

    check-cast v0, Ljava/io/ObjectOutputStream;

    .line 110
    .local v0, "output":Ljava/io/ObjectOutputStream;
    if-eqz p1, :cond_0

    .line 111
    invoke-virtual {v0, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 114
    .end local v0    # "output":Ljava/io/ObjectOutputStream;
    nop

    .line 116
    return-void

    .line 113
    .restart local v0    # "output":Ljava/io/ObjectOutputStream;
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "The parameter is null"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 115
    .end local v0    # "output":Ljava/io/ObjectOutputStream;
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "The output stream has to be an instance of ObjectOutputStream"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 2
    .param p1, "enc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 61
    new-instance v0, Ljava/io/UnsupportedEncodingException;

    const-string v1, "Method not supported"

    invoke-direct {v0, v1}, Ljava/io/UnsupportedEncodingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRtpmapAttribute(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .line 98
    return-void
.end method

.method public setTypedTime(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .line 89
    return-void
.end method
