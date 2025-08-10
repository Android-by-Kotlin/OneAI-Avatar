.class Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPDialog.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DialogDeleteTask"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    .locals 0

    .line 657
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 665
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public runTask()V
    .locals 1

    .line 660
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->delete()V

    .line 661
    return-void
.end method
