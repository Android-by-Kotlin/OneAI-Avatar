.class Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$1;
.super Ljava/lang/Object;
.source "ConnectionOrientedMessageChannel.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/ThreadAffinityTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

.field final synthetic val$sipMessage:Landroid/gov/nist/javax/sip/message/SIPMessage;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 0

    .line 184
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$1;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$1;->val$sipMessage:Landroid/gov/nist/javax/sip/message/SIPMessage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 202
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$1;->val$sipMessage:Landroid/gov/nist/javax/sip/message/SIPMessage;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public run()V
    .locals 3

    .line 188
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$1;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$1;->val$sipMessage:Landroid/gov/nist/javax/sip/message/SIPMessage;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPMessage;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    goto :goto_0

    .line 189
    :catch_0
    move-exception v0

    .line 190
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 192
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string v2, "Error self routing message cause by: "

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 198
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method
