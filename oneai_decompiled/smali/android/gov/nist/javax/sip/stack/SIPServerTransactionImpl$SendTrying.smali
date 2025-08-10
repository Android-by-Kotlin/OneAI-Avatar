.class Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$SendTrying;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPServerTransactionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SendTrying"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;)V
    .locals 3

    .line 345
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$SendTrying;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 346
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 347
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "scheduled timer for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 349
    :cond_0
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 2

    .line 376
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$SendTrying;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 377
    .local v0, "request":Landroid/javax/sip/message/Request;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_0

    .line 378
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 380
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public runTask()V
    .locals 6

    .line 352
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$SendTrying;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    .line 354
    .local v0, "serverTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    .line 356
    .local v1, "realState":I
    if-ltz v1, :cond_0

    const/4 v2, 0x1

    if-ne v2, v1, :cond_3

    .line 357
    :cond_0
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 358
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " sending Trying current state = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 361
    :cond_1
    :try_start_0
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v2

    const-string/jumbo v4, "Trying"

    const/16 v5, 0x64

    invoke-virtual {v2, v5, v4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(ILjava/lang/String;)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 363
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 364
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " trying sent "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 369
    :cond_2
    goto :goto_0

    .line 366
    :catch_0
    move-exception v2

    .line 367
    .local v2, "ex":Ljava/io/IOException;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    invoke-interface {v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 368
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    const-string v4, "IO error sending  TRYING"

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 372
    .end local v2    # "ex":Ljava/io/IOException;
    :cond_3
    :goto_0
    return-void
.end method
