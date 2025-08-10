.class public Landroid/javax/sip/ResponseEvent;
.super Ljava/util/EventObject;
.source "ResponseEvent.java"


# instance fields
.field private m_dialog:Landroid/javax/sip/Dialog;

.field private m_response:Landroid/javax/sip/message/Response;

.field private m_transaction:Landroid/javax/sip/ClientTransaction;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Response;)V
    .locals 0
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "clientTransaction"    # Landroid/javax/sip/ClientTransaction;
    .param p3, "dialog"    # Landroid/javax/sip/Dialog;
    .param p4, "response"    # Landroid/javax/sip/message/Response;

    .line 73
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 74
    iput-object p4, p0, Landroid/javax/sip/ResponseEvent;->m_response:Landroid/javax/sip/message/Response;

    .line 75
    iput-object p2, p0, Landroid/javax/sip/ResponseEvent;->m_transaction:Landroid/javax/sip/ClientTransaction;

    .line 76
    iput-object p3, p0, Landroid/javax/sip/ResponseEvent;->m_dialog:Landroid/javax/sip/Dialog;

    .line 77
    return-void
.end method


# virtual methods
.method public getClientTransaction()Landroid/javax/sip/ClientTransaction;
    .locals 1

    .line 85
    iget-object v0, p0, Landroid/javax/sip/ResponseEvent;->m_transaction:Landroid/javax/sip/ClientTransaction;

    return-object v0
.end method

.method public getDialog()Landroid/javax/sip/Dialog;
    .locals 1

    .line 116
    iget-object v0, p0, Landroid/javax/sip/ResponseEvent;->m_dialog:Landroid/javax/sip/Dialog;

    return-object v0
.end method

.method public getResponse()Landroid/javax/sip/message/Response;
    .locals 1

    .line 94
    iget-object v0, p0, Landroid/javax/sip/ResponseEvent;->m_response:Landroid/javax/sip/message/Response;

    return-object v0
.end method
