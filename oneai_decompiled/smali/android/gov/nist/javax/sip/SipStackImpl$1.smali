.class Landroid/gov/nist/javax/sip/SipStackImpl$1;
.super Ljava/lang/Thread;
.source "SipStackImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/SipStackImpl;-><init>(Ljava/util/Properties;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/SipStackImpl;

.field final synthetic val$thisStack:Landroid/javax/sip/SipStack;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/SipStackImpl;Landroid/javax/sip/SipStack;)V
    .locals 0

    .line 1585
    iput-object p1, p0, Landroid/gov/nist/javax/sip/SipStackImpl$1;->this$0:Landroid/gov/nist/javax/sip/SipStackImpl;

    iput-object p2, p0, Landroid/gov/nist/javax/sip/SipStackImpl$1;->val$thisStack:Landroid/javax/sip/SipStack;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1588
    const-wide/16 v0, 0x64

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 1589
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl$1;->this$0:Landroid/gov/nist/javax/sip/SipStackImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipStackImpl$1;->val$thisStack:Landroid/javax/sip/SipStack;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->init(Landroid/javax/sip/SipStack;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1593
    goto :goto_0

    .line 1590
    :catch_0
    move-exception v0

    .line 1591
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/SipStackImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string v2, "Error intializing SIPEventInterceptor"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1595
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
