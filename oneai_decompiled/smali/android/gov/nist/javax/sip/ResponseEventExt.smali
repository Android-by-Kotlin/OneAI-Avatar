.class public Landroid/gov/nist/javax/sip/ResponseEventExt;
.super Landroid/javax/sip/ResponseEvent;
.source "ResponseEventExt.java"


# instance fields
.field private isForked:Z

.field private isRetransmission:Z

.field private m_originalTransaction:Landroid/gov/nist/javax/sip/ClientTransactionExt;

.field private remoteIpAddress:Ljava/lang/String;

.field private remotePort:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/gov/nist/javax/sip/ClientTransactionExt;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Response;)V
    .locals 0
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "clientTransaction"    # Landroid/gov/nist/javax/sip/ClientTransactionExt;
    .param p3, "dialog"    # Landroid/javax/sip/Dialog;
    .param p4, "response"    # Landroid/javax/sip/message/Response;

    .line 20
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/javax/sip/ResponseEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Response;)V

    .line 21
    iput-object p2, p0, Landroid/gov/nist/javax/sip/ResponseEventExt;->m_originalTransaction:Landroid/gov/nist/javax/sip/ClientTransactionExt;

    .line 22
    return-void
.end method


# virtual methods
.method public getOriginalTransaction()Landroid/gov/nist/javax/sip/ClientTransactionExt;
    .locals 1

    .line 59
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ResponseEventExt;->m_originalTransaction:Landroid/gov/nist/javax/sip/ClientTransactionExt;

    return-object v0
.end method

.method public getRemoteIpAddress()Ljava/lang/String;
    .locals 1

    .line 100
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ResponseEventExt;->remoteIpAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getRemotePort()I
    .locals 1

    .line 92
    iget v0, p0, Landroid/gov/nist/javax/sip/ResponseEventExt;->remotePort:I

    return v0
.end method

.method public isForkedResponse()Z
    .locals 1

    .line 30
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/ResponseEventExt;->isForked:Z

    return v0
.end method

.method public isRetransmission()Z
    .locals 1

    .line 68
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/ResponseEventExt;->isRetransmission:Z

    return v0
.end method

.method public setForkedResponse(Z)V
    .locals 0
    .param p1, "forked"    # Z

    .line 39
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/ResponseEventExt;->isForked:Z

    .line 40
    return-void
.end method

.method public setOriginalTransaction(Landroid/gov/nist/javax/sip/ClientTransactionExt;)V
    .locals 0
    .param p1, "originalTransaction"    # Landroid/gov/nist/javax/sip/ClientTransactionExt;

    .line 49
    iput-object p1, p0, Landroid/gov/nist/javax/sip/ResponseEventExt;->m_originalTransaction:Landroid/gov/nist/javax/sip/ClientTransactionExt;

    .line 50
    return-void
.end method

.method public setRemoteIpAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "remoteIpAddress"    # Ljava/lang/String;

    .line 110
    iput-object p1, p0, Landroid/gov/nist/javax/sip/ResponseEventExt;->remoteIpAddress:Ljava/lang/String;

    .line 111
    return-void
.end method

.method public setRemotePort(I)V
    .locals 0
    .param p1, "remotePort"    # I

    .line 84
    iput p1, p0, Landroid/gov/nist/javax/sip/ResponseEventExt;->remotePort:I

    .line 85
    return-void
.end method

.method public setRetransmission(Z)V
    .locals 0
    .param p1, "isRetransmission"    # Z

    .line 75
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/ResponseEventExt;->isRetransmission:Z

    .line 76
    return-void
.end method
