.class public Landroid/javax/sip/TimeoutEvent;
.super Ljava/util/EventObject;
.source "TimeoutEvent.java"


# instance fields
.field private m_clientTransaction:Landroid/javax/sip/ClientTransaction;

.field private m_isServerTransaction:Z

.field private m_serverTransaction:Landroid/javax/sip/ServerTransaction;

.field private m_timeout:Landroid/javax/sip/Timeout;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/Timeout;)V
    .locals 1
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "clientTransaction"    # Landroid/javax/sip/ClientTransaction;
    .param p3, "timeout"    # Landroid/javax/sip/Timeout;

    .line 84
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/TimeoutEvent;->m_serverTransaction:Landroid/javax/sip/ServerTransaction;

    .line 141
    iput-object v0, p0, Landroid/javax/sip/TimeoutEvent;->m_clientTransaction:Landroid/javax/sip/ClientTransaction;

    .line 85
    iput-object p2, p0, Landroid/javax/sip/TimeoutEvent;->m_clientTransaction:Landroid/javax/sip/ClientTransaction;

    .line 86
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/javax/sip/TimeoutEvent;->m_isServerTransaction:Z

    .line 87
    iput-object p3, p0, Landroid/javax/sip/TimeoutEvent;->m_timeout:Landroid/javax/sip/Timeout;

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Timeout;)V
    .locals 1
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "serverTransaction"    # Landroid/javax/sip/ServerTransaction;
    .param p3, "timeout"    # Landroid/javax/sip/Timeout;

    .line 67
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/TimeoutEvent;->m_serverTransaction:Landroid/javax/sip/ServerTransaction;

    .line 141
    iput-object v0, p0, Landroid/javax/sip/TimeoutEvent;->m_clientTransaction:Landroid/javax/sip/ClientTransaction;

    .line 68
    iput-object p2, p0, Landroid/javax/sip/TimeoutEvent;->m_serverTransaction:Landroid/javax/sip/ServerTransaction;

    .line 69
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/javax/sip/TimeoutEvent;->m_isServerTransaction:Z

    .line 70
    iput-object p3, p0, Landroid/javax/sip/TimeoutEvent;->m_timeout:Landroid/javax/sip/Timeout;

    .line 71
    return-void
.end method


# virtual methods
.method public getClientTransaction()Landroid/javax/sip/ClientTransaction;
    .locals 1

    .line 108
    iget-object v0, p0, Landroid/javax/sip/TimeoutEvent;->m_clientTransaction:Landroid/javax/sip/ClientTransaction;

    return-object v0
.end method

.method public getServerTransaction()Landroid/javax/sip/ServerTransaction;
    .locals 1

    .line 97
    iget-object v0, p0, Landroid/javax/sip/TimeoutEvent;->m_serverTransaction:Landroid/javax/sip/ServerTransaction;

    return-object v0
.end method

.method public getTimeout()Landroid/javax/sip/Timeout;
    .locals 1

    .line 133
    iget-object v0, p0, Landroid/javax/sip/TimeoutEvent;->m_timeout:Landroid/javax/sip/Timeout;

    return-object v0
.end method

.method public isServerTransaction()Z
    .locals 1

    .line 119
    iget-boolean v0, p0, Landroid/javax/sip/TimeoutEvent;->m_isServerTransaction:Z

    return v0
.end method
