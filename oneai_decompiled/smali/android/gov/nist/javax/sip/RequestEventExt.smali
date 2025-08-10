.class public Landroid/gov/nist/javax/sip/RequestEventExt;
.super Landroid/javax/sip/RequestEvent;
.source "RequestEventExt.java"


# instance fields
.field private remoteIpAddress:Ljava/lang/String;

.field private remotePort:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Request;)V
    .locals 0
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "serverTransaction"    # Landroid/javax/sip/ServerTransaction;
    .param p3, "dialog"    # Landroid/javax/sip/Dialog;
    .param p4, "request"    # Landroid/javax/sip/message/Request;

    .line 22
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/javax/sip/RequestEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Request;)V

    .line 23
    return-void
.end method


# virtual methods
.method public getRemoteIpAddress()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Landroid/gov/nist/javax/sip/RequestEventExt;->remoteIpAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getRemotePort()I
    .locals 1

    .line 38
    iget v0, p0, Landroid/gov/nist/javax/sip/RequestEventExt;->remotePort:I

    return v0
.end method

.method public setRemoteIpAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "remoteIpAddress"    # Ljava/lang/String;

    .line 26
    iput-object p1, p0, Landroid/gov/nist/javax/sip/RequestEventExt;->remoteIpAddress:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public setRemotePort(I)V
    .locals 0
    .param p1, "remotePort"    # I

    .line 34
    iput p1, p0, Landroid/gov/nist/javax/sip/RequestEventExt;->remotePort:I

    .line 35
    return-void
.end method
