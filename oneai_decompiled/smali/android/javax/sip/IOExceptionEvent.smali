.class public Landroid/javax/sip/IOExceptionEvent;
.super Ljava/util/EventObject;
.source "IOExceptionEvent.java"


# instance fields
.field private m_host:Ljava/lang/String;

.field private m_port:I

.field private m_transport:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "remoteHost"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "transport"    # Ljava/lang/String;

    .line 59
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 60
    iput-object p2, p0, Landroid/javax/sip/IOExceptionEvent;->m_host:Ljava/lang/String;

    .line 61
    iput p3, p0, Landroid/javax/sip/IOExceptionEvent;->m_port:I

    .line 62
    iput-object p4, p0, Landroid/javax/sip/IOExceptionEvent;->m_transport:Ljava/lang/String;

    .line 63
    return-void
.end method


# virtual methods
.method public getHost()Ljava/lang/String;
    .locals 1

    .line 72
    iget-object v0, p0, Landroid/javax/sip/IOExceptionEvent;->m_host:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 81
    iget v0, p0, Landroid/javax/sip/IOExceptionEvent;->m_port:I

    return v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Landroid/javax/sip/IOExceptionEvent;->m_transport:Ljava/lang/String;

    return-object v0
.end method
