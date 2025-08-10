.class public Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;
.super Ljava/lang/Object;
.source "NioPipelineParser.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/gov/nist/javax/sip/stack/QueuedMessageDispatchBase;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/parser/NioPipelineParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Dispatch"
.end annotation


# instance fields
.field callId:Ljava/lang/String;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

.field time:J

.field unparsedMessage:Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;Ljava/lang/String;)V
    .locals 2
    .param p2, "unparsedMsg"    # Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;
    .param p3, "callId"    # Ljava/lang/String;

    .line 100
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-object p2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->unparsedMessage:Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;

    .line 102
    iput-object p3, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->callId:Ljava/lang/String;

    .line 103
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->time:J

    .line 104
    return-void
.end method


# virtual methods
.method public getReceptionTime()J
    .locals 2

    .line 158
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->time:J

    return-wide v0
.end method

.method public run()V
    .locals 7

    .line 106
    const-string/jumbo v0, "releasing semaphore for message "

    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "serving msg on call id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->callId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 107
    const/4 v1, 0x0

    .line 110
    .local v1, "parsedSIPMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    const/16 v2, 0x20

    :try_start_0
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 111
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\nUnparsed message before parser is:\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->unparsedMessage:Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 113
    :cond_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->unparsedMessage:Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;->lines:Ljava/lang/String;

    const-string/jumbo v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    .line 114
    .local v3, "lineBytes":[B
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-static {v4}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$100(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-interface {v4, v3, v6, v6, v5}, Landroid/gov/nist/javax/sip/parser/MessageParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v4

    move-object v1, v4

    .line 115
    if-nez v1, :cond_1

    .line 117
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 118
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v4

    const-string/jumbo v5, "parsed message is null, probably because of end of stream, empty packets or socket closed and we got CRLF to terminate cleanly, not processing message"

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_0

    .line 121
    :cond_1
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->unparsedMessage:Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;->body:[B

    array-length v4, v4

    if-lez v4, :cond_2

    .line 122
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->unparsedMessage:Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;->body:[B

    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setMessageContent([B)V

    .line 125
    :cond_2
    :goto_0
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-static {v4}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$200(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v4

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v4, :cond_3

    if-eqz v1, :cond_3

    .line 128
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-static {v4}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$200(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v4

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    invoke-interface {v4, v1}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->beforeMessage(Landroid/javax/sip/message/Message;)V

    .line 131
    :cond_3
    if-eqz v1, :cond_4

    .line 132
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    invoke-interface {v4, v1}, Landroid/gov/nist/javax/sip/parser/SIPMessageListener;->processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    .end local v3    # "lineBytes":[B
    :cond_4
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 145
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 147
    :cond_5
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$200(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v0, :cond_9

    if-eqz v1, :cond_9

    .line 150
    :goto_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$200(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->afterMessage(Landroid/javax/sip/message/Message;)V

    goto/16 :goto_3

    .line 144
    :catchall_0
    move-exception v3

    goto/16 :goto_4

    .line 140
    :catch_0
    move-exception v3

    .line 141
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error occured processing message "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    iget-object v6, v6, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->message:Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 144
    .end local v3    # "e":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 145
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 147
    :cond_6
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$200(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v0, :cond_9

    if-eqz v1, :cond_9

    .line 150
    :goto_2
    goto :goto_1

    .line 134
    :catch_1
    move-exception v3

    .line 137
    .local v3, "e":Ljava/text/ParseException;
    :try_start_2
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 138
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Problem parsing message "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->unparsedMessage:Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 144
    .end local v3    # "e":Ljava/text/ParseException;
    :cond_7
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 145
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 147
    :cond_8
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$200(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v0, :cond_9

    if-eqz v1, :cond_9

    .line 150
    goto :goto_2

    .line 153
    :cond_9
    :goto_3
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 154
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "dispatch task done on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 156
    :cond_a
    return-void

    .line 144
    :goto_4
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 145
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 147
    :cond_b
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$200(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v0, :cond_c

    if-eqz v1, :cond_c

    .line 150
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->access$200(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->afterMessage(Landroid/javax/sip/message/Message;)V

    :cond_c
    throw v3
.end method
