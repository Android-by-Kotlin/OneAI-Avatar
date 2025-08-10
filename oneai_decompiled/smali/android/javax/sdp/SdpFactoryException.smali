.class public Landroid/javax/sdp/SdpFactoryException;
.super Landroid/javax/sdp/SdpException;
.source "SdpFactoryException.java"


# instance fields
.field protected ex:Ljava/lang/Exception;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Landroid/javax/sdp/SdpException;-><init>()V

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "ex"    # Ljava/lang/Exception;

    .line 42
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    .line 43
    iput-object p1, p0, Landroid/javax/sdp/SdpFactoryException;->ex:Ljava/lang/Exception;

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .line 34
    invoke-direct {p0, p1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/lang/Exception;

    .line 53
    invoke-direct {p0, p1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    .line 54
    iput-object p2, p0, Landroid/javax/sdp/SdpFactoryException;->ex:Ljava/lang/Exception;

    .line 55
    return-void
.end method


# virtual methods
.method public getException()Ljava/lang/Exception;
    .locals 1

    .line 73
    iget-object v0, p0, Landroid/javax/sdp/SdpFactoryException;->ex:Ljava/lang/Exception;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 63
    invoke-super {p0}, Landroid/javax/sdp/SdpException;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-super {p0}, Landroid/javax/sdp/SdpException;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 65
    :cond_0
    iget-object v0, p0, Landroid/javax/sdp/SdpFactoryException;->ex:Ljava/lang/Exception;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/javax/sdp/SdpFactoryException;->ex:Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 66
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method
