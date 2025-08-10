.class public Landroid/javax/sip/TransactionTerminatedEvent;
.super Ljava/util/EventObject;
.source "TransactionTerminatedEvent.java"


# instance fields
.field private m_clientTransaction:Landroid/javax/sip/ClientTransaction;

.field private m_isServerTransaction:Z

.field private m_serverTransaction:Landroid/javax/sip/ServerTransaction;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/javax/sip/ClientTransaction;)V
    .locals 1
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "clientTransaction"    # Landroid/javax/sip/ClientTransaction;

    .line 66
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 106
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/TransactionTerminatedEvent;->m_serverTransaction:Landroid/javax/sip/ServerTransaction;

    .line 107
    iput-object v0, p0, Landroid/javax/sip/TransactionTerminatedEvent;->m_clientTransaction:Landroid/javax/sip/ClientTransaction;

    .line 67
    iput-object p2, p0, Landroid/javax/sip/TransactionTerminatedEvent;->m_clientTransaction:Landroid/javax/sip/ClientTransaction;

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/javax/sip/TransactionTerminatedEvent;->m_isServerTransaction:Z

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;)V
    .locals 1
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "serverTransaction"    # Landroid/javax/sip/ServerTransaction;

    .line 51
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 106
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/TransactionTerminatedEvent;->m_serverTransaction:Landroid/javax/sip/ServerTransaction;

    .line 107
    iput-object v0, p0, Landroid/javax/sip/TransactionTerminatedEvent;->m_clientTransaction:Landroid/javax/sip/ClientTransaction;

    .line 52
    iput-object p2, p0, Landroid/javax/sip/TransactionTerminatedEvent;->m_serverTransaction:Landroid/javax/sip/ServerTransaction;

    .line 53
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/javax/sip/TransactionTerminatedEvent;->m_isServerTransaction:Z

    .line 55
    return-void
.end method


# virtual methods
.method public getClientTransaction()Landroid/javax/sip/ClientTransaction;
    .locals 1

    .line 89
    iget-object v0, p0, Landroid/javax/sip/TransactionTerminatedEvent;->m_clientTransaction:Landroid/javax/sip/ClientTransaction;

    return-object v0
.end method

.method public getServerTransaction()Landroid/javax/sip/ServerTransaction;
    .locals 1

    .line 78
    iget-object v0, p0, Landroid/javax/sip/TransactionTerminatedEvent;->m_serverTransaction:Landroid/javax/sip/ServerTransaction;

    return-object v0
.end method

.method public isServerTransaction()Z
    .locals 1

    .line 100
    iget-boolean v0, p0, Landroid/javax/sip/TransactionTerminatedEvent;->m_isServerTransaction:Z

    return v0
.end method
