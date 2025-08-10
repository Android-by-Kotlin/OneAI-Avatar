.class public Landroid/gov/nist/javax/sip/IOExceptionEventExt;
.super Landroid/javax/sip/IOExceptionEvent;
.source "IOExceptionEventExt.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;
    }
.end annotation


# instance fields
.field private final myHost:Ljava/lang/String;

.field private final myPort:I

.field private reason:Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)V
    .locals 1
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "reason"    # Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;
    .param p3, "myHost"    # Ljava/lang/String;
    .param p4, "myPort"    # I
    .param p5, "peerHost"    # Ljava/lang/String;
    .param p6, "peerPort"    # I
    .param p7, "transport"    # Ljava/lang/String;

    .line 35
    invoke-direct {p0, p1, p5, p6, p7}, Landroid/javax/sip/IOExceptionEvent;-><init>(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/String;)V

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->reason:Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    .line 36
    iput-object p3, p0, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->myHost:Ljava/lang/String;

    .line 37
    iput p4, p0, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->myPort:I

    .line 38
    iput-object p2, p0, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->reason:Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    .line 39
    return-void
.end method


# virtual methods
.method public getLocalHost()Ljava/lang/String;
    .locals 1

    .line 42
    iget-object v0, p0, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->myHost:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalPort()I
    .locals 1

    .line 46
    iget v0, p0, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->myPort:I

    return v0
.end method

.method public getPeerHost()Ljava/lang/String;
    .locals 1

    .line 50
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->getHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPeerPort()I
    .locals 1

    .line 54
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->getPort()I

    move-result v0

    return v0
.end method

.method public getReason()Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;
    .locals 1

    .line 63
    iget-object v0, p0, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->reason:Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "KeepAliveTimeoutEvent{myHost=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->myHost:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", myPort="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->myPort:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", peerHost=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", peerPort="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->getPort()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", transport=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/IOExceptionEventExt;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
