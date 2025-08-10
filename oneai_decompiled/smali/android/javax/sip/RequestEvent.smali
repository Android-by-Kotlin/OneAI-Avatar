.class public Landroid/javax/sip/RequestEvent;
.super Ljava/util/EventObject;
.source "RequestEvent.java"


# instance fields
.field private m_dialog:Landroid/javax/sip/Dialog;

.field private m_request:Landroid/javax/sip/message/Request;

.field private m_transaction:Landroid/javax/sip/ServerTransaction;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Request;)V
    .locals 0
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "serverTransaction"    # Landroid/javax/sip/ServerTransaction;
    .param p3, "dialog"    # Landroid/javax/sip/Dialog;
    .param p4, "request"    # Landroid/javax/sip/message/Request;

    .line 73
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 74
    iput-object p2, p0, Landroid/javax/sip/RequestEvent;->m_transaction:Landroid/javax/sip/ServerTransaction;

    .line 75
    iput-object p4, p0, Landroid/javax/sip/RequestEvent;->m_request:Landroid/javax/sip/message/Request;

    .line 76
    iput-object p3, p0, Landroid/javax/sip/RequestEvent;->m_dialog:Landroid/javax/sip/Dialog;

    .line 77
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/javax/sip/Dialog;
    .locals 1

    .line 108
    iget-object v0, p0, Landroid/javax/sip/RequestEvent;->m_dialog:Landroid/javax/sip/Dialog;

    return-object v0
.end method

.method public getRequest()Landroid/javax/sip/message/Request;
    .locals 1

    .line 94
    iget-object v0, p0, Landroid/javax/sip/RequestEvent;->m_request:Landroid/javax/sip/message/Request;

    return-object v0
.end method

.method public getServerTransaction()Landroid/javax/sip/ServerTransaction;
    .locals 1

    .line 85
    iget-object v0, p0, Landroid/javax/sip/RequestEvent;->m_transaction:Landroid/javax/sip/ServerTransaction;

    return-object v0
.end method
