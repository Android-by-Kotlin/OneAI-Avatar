.class public Landroid/javax/sip/DialogTerminatedEvent;
.super Ljava/util/EventObject;
.source "DialogTerminatedEvent.java"


# instance fields
.field private m_dialog:Landroid/javax/sip/Dialog;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/javax/sip/Dialog;)V
    .locals 1
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "dialog"    # Landroid/javax/sip/Dialog;

    .line 50
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/DialogTerminatedEvent;->m_dialog:Landroid/javax/sip/Dialog;

    .line 51
    iput-object p2, p0, Landroid/javax/sip/DialogTerminatedEvent;->m_dialog:Landroid/javax/sip/Dialog;

    .line 53
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/javax/sip/Dialog;
    .locals 1

    .line 64
    iget-object v0, p0, Landroid/javax/sip/DialogTerminatedEvent;->m_dialog:Landroid/javax/sip/Dialog;

    return-object v0
.end method
