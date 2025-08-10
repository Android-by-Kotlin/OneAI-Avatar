.class Landroid/gov/nist/javax/sip/DialogFilter;
.super Ljava/lang/Object;
.source "DialogFilter.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
.implements Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

.field private sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

.field protected transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 95
    const-class v0, Landroid/gov/nist/javax/sip/DialogFilter;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    .locals 0
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput-object p1, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 106
    return-void
.end method

.method private sendBadRequestResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;Ljava/lang/String;)V
    .locals 5
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .param p3, "reasonPhrase"    # Ljava/lang/String;

    .line 152
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v0

    sget-object v1, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    if-eq v0, v1, :cond_3

    .line 154
    const/16 v0, 0x190

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 156
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    if-eqz p3, :cond_0

    .line 157
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setReasonPhrase(Ljava/lang/String;)V

    .line 158
    :cond_0
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;

    move-result-object v1

    .line 160
    .local v1, "serverHeader":Landroid/javax/sip/header/ServerHeader;
    if-eqz v1, :cond_1

    .line 161
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 164
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    const-string v3, "INVITE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 165
    iget-object v2, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 167
    :cond_2
    invoke-interface {p2, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->sendResponse(Landroid/javax/sip/message/Response;)V

    .line 168
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    goto :goto_0

    .line 169
    :catch_0
    move-exception v2

    .line 170
    .local v2, "ex":Ljava/lang/Exception;
    sget-object v3, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "Problem sending error response"

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 172
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 173
    iget-object v3, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 177
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v1    # "serverHeader":Landroid/javax/sip/header/ServerHeader;
    .end local v2    # "ex":Ljava/lang/Exception;
    :cond_3
    :goto_0
    return-void
.end method

.method private sendCallOrTransactionDoesNotExistResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 5
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 189
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v0

    sget-object v1, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    if-eq v0, v1, :cond_2

    .line 190
    const/16 v0, 0x1e1

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 193
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;

    move-result-object v1

    .line 195
    .local v1, "serverHeader":Landroid/javax/sip/header/ServerHeader;
    if-eqz v1, :cond_0

    .line 196
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 199
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    const-string v3, "INVITE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 200
    iget-object v2, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 202
    :cond_1
    invoke-interface {p2, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->sendResponse(Landroid/javax/sip/message/Response;)V

    .line 203
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    goto :goto_0

    .line 204
    :catch_0
    move-exception v2

    .line 205
    .local v2, "ex":Ljava/lang/Exception;
    sget-object v3, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "Problem sending error response"

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 207
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 208
    iget-object v3, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 213
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v1    # "serverHeader":Landroid/javax/sip/header/ServerHeader;
    .end local v2    # "ex":Ljava/lang/Exception;
    :cond_2
    :goto_0
    return-void
.end method

.method private sendLoopDetectedResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 5
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 224
    const/16 v0, 0x1e2

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 226
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v1

    sget-object v2, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    if-eq v1, v2, :cond_1

    .line 228
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;

    move-result-object v1

    .line 230
    .local v1, "serverHeader":Landroid/javax/sip/header/ServerHeader;
    if-eqz v1, :cond_0

    .line 231
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 234
    :cond_0
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 235
    invoke-interface {p2, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->sendResponse(Landroid/javax/sip/message/Response;)V

    .line 236
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    goto :goto_0

    .line 237
    :catch_0
    move-exception v2

    .line 238
    .local v2, "ex":Ljava/lang/Exception;
    sget-object v3, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "Problem sending error response"

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 240
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 241
    iget-object v3, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 246
    .end local v1    # "serverHeader":Landroid/javax/sip/header/ServerHeader;
    .end local v2    # "ex":Ljava/lang/Exception;
    :cond_1
    :goto_0
    return-void
.end method

.method private sendRequestPendingResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 5
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 116
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v0

    sget-object v1, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    if-eq v0, v1, :cond_2

    .line 117
    const/16 v0, 0x1eb

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 119
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;

    move-result-object v1

    .line 121
    .local v1, "serverHeader":Landroid/javax/sip/header/ServerHeader;
    if-eqz v1, :cond_0

    .line 122
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 125
    :cond_0
    :try_start_0
    new-instance v2, Landroid/gov/nist/javax/sip/header/RetryAfter;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/RetryAfter;-><init>()V

    .line 126
    .local v2, "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/header/RetryAfter;->setRetryAfter(I)V

    .line 127
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 128
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v3

    const-string v4, "INVITE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 129
    iget-object v3, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 131
    :cond_1
    invoke-interface {p2, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->sendResponse(Landroid/javax/sip/message/Response;)V

    .line 132
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    .end local v2    # "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    goto :goto_0

    .line 133
    :catch_0
    move-exception v2

    .line 134
    .local v2, "ex":Ljava/lang/Exception;
    sget-object v3, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "Problem sending error response"

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 136
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 137
    iget-object v3, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 140
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v1    # "serverHeader":Landroid/javax/sip/header/ServerHeader;
    .end local v2    # "ex":Ljava/lang/Exception;
    :cond_2
    :goto_0
    return-void
.end method

.method private sendServerInternalErrorResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 4
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 289
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v0

    sget-object v1, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    if-eq v0, v1, :cond_2

    .line 290
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 291
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "Sending 500 response for out of sequence message"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 293
    :cond_0
    const/16 v0, 0x1f4

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 295
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    const-string/jumbo v1, "Request out of order"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setReasonPhrase(Ljava/lang/String;)V

    .line 296
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 297
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;

    move-result-object v1

    .line 299
    .local v1, "serverHeader":Landroid/javax/sip/header/ServerHeader;
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 303
    .end local v1    # "serverHeader":Landroid/javax/sip/header/ServerHeader;
    :cond_1
    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/RetryAfter;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/RetryAfter;-><init>()V

    .line 304
    .local v1, "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/header/RetryAfter;->setRetryAfter(I)V

    .line 305
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 306
    iget-object v2, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 307
    invoke-interface {p2, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->sendResponse(Landroid/javax/sip/message/Response;)V

    .line 308
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 314
    .end local v1    # "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    goto :goto_0

    .line 309
    :catch_0
    move-exception v1

    .line 310
    .local v1, "ex":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "Problem sending response"

    invoke-interface {v2, v3, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 312
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 313
    iget-object v2, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 316
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_2
    :goto_0
    return-void
.end method

.method private sendTryingResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 5
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 257
    const/16 v0, 0x64

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 259
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v1

    sget-object v2, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    if-eq v1, v2, :cond_1

    .line 261
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;

    move-result-object v1

    .line 263
    .local v1, "serverHeader":Landroid/javax/sip/header/ServerHeader;
    if-eqz v1, :cond_0

    .line 264
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 267
    :cond_0
    :try_start_0
    invoke-interface {p2, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->sendResponse(Landroid/javax/sip/message/Response;)V

    .line 268
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 275
    goto :goto_0

    .line 269
    :catch_0
    move-exception v2

    .line 270
    .local v2, "ex":Ljava/lang/Exception;
    sget-object v3, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "Problem sending error response"

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 272
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 273
    iget-object v3, p0, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 278
    .end local v1    # "serverHeader":Landroid/javax/sip/header/ServerHeader;
    .end local v2    # "ex":Ljava/lang/Exception;
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public getProcessingInfo()Ljava/lang/String;
    .locals 1

    .line 1531
    const/4 v0, 0x0

    return-object v0
.end method

.method public processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    .locals 21
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "incomingMessageChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 329
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    if-eqz v0, :cond_0

    .line 331
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "PROCESSING INCOMING REQUEST "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " transactionChannel = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " listening point = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getIPAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getPort()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 337
    :cond_0
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    if-nez v0, :cond_2

    .line 338
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 339
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Dropping message: No listening point registered!"

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 341
    :cond_1
    return-void

    .line 344
    :cond_2
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v4

    .line 347
    .local v4, "sipStack":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v5

    .line 348
    .local v5, "sipProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    if-nez v5, :cond_4

    .line 349
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 350
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "No provider - dropping !!"

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 351
    :cond_3
    return-void

    .line 354
    :cond_4
    if-nez v4, :cond_5

    .line 355
    const-string v0, "Egads! no sip stack!"

    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/String;)V

    .line 359
    :cond_5
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-object v6, v0

    check-cast v6, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 360
    .local v6, "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    if-eqz v6, :cond_6

    .line 361
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 362
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "transaction state = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 365
    :cond_6
    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v7

    .line 366
    .local v7, "dialogId":Ljava/lang/String;
    invoke-virtual {v4, v7}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v8

    .line 373
    .local v8, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v8, :cond_d

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v9

    if-eq v5, v9, :cond_d

    .line 374
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMyContactHeader()Landroid/gov/nist/javax/sip/header/Contact;

    move-result-object v9

    .line 375
    .local v9, "contact":Landroid/gov/nist/javax/sip/header/Contact;
    if-eqz v9, :cond_d

    .line 376
    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/header/Contact;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v10

    invoke-interface {v10}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v10

    check-cast v10, Landroid/gov/nist/javax/sip/address/SipUri;

    check-cast v10, Landroid/gov/nist/javax/sip/address/SipUri;

    .line 377
    .local v10, "contactUri":Landroid/gov/nist/javax/sip/address/SipUri;
    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/address/SipUri;->getHost()Ljava/lang/String;

    move-result-object v11

    .line 378
    .local v11, "ipAddress":Ljava/lang/String;
    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/address/SipUri;->getPort()I

    move-result v12

    .line 379
    .local v12, "contactPort":I
    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/address/SipUri;->getTransportParam()Ljava/lang/String;

    move-result-object v13

    .line 380
    .local v13, "contactTransport":Ljava/lang/String;
    if-nez v13, :cond_7

    .line 381
    const-string/jumbo v13, "udp"

    .line 382
    :cond_7
    const/4 v14, -0x1

    if-ne v12, v14, :cond_a

    .line 383
    const-string/jumbo v14, "udp"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_9

    const-string/jumbo v14, "tcp"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_8

    goto :goto_0

    .line 387
    :cond_8
    const/16 v12, 0x13c5

    goto :goto_1

    .line 385
    :cond_9
    :goto_0
    const/16 v12, 0x13c4

    .line 392
    :cond_a
    :goto_1
    if-eqz v11, :cond_d

    iget-object v14, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v14}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getIPAddress()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_b

    iget-object v14, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v14}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getPort()I

    move-result v14

    if-eq v12, v14, :cond_d

    .line 395
    :cond_b
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v14, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v14

    if-eqz v14, :cond_c

    .line 396
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v0, "nulling dialog -- listening point mismatch!  "

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v15, "  lp port = "

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v15, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v15}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getPort()I

    move-result v15

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v14, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 402
    :cond_c
    const/4 v8, 0x0

    .line 419
    .end local v9    # "contact":Landroid/gov/nist/javax/sip/header/Contact;
    .end local v10    # "contactUri":Landroid/gov/nist/javax/sip/address/SipUri;
    .end local v11    # "ipAddress":Ljava/lang/String;
    .end local v12    # "contactPort":I
    .end local v13    # "contactTransport":Ljava/lang/String;
    :cond_d
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isDialogErrorsAutomaticallyHandled()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getToTag()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e

    .line 421
    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findMergedTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 422
    invoke-direct {v1, v2, v6}, Landroid/gov/nist/javax/sip/DialogFilter;->sendLoopDetectedResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 423
    return-void

    .line 427
    :cond_e
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 428
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "dialogId = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 429
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "dialog = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 442
    :cond_f
    const-string/jumbo v0, "Route"

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v9

    if-eqz v9, :cond_14

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v9

    if-eqz v9, :cond_14

    .line 444
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRouteHeaders()Landroid/gov/nist/javax/sip/header/RouteList;

    move-result-object v9

    .line 445
    .local v9, "routes":Landroid/gov/nist/javax/sip/header/RouteList;
    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/header/RouteList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v10

    check-cast v10, Landroid/gov/nist/javax/sip/header/Route;

    .line 446
    .local v10, "route":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/header/Route;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v11

    invoke-interface {v11}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v11

    check-cast v11, Landroid/gov/nist/javax/sip/address/SipUri;

    .line 447
    .local v11, "uri":Landroid/gov/nist/javax/sip/address/SipUri;
    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/address/SipUri;->getHostPort()Landroid/gov/nist/core/HostPort;

    move-result-object v12

    .line 449
    .local v12, "hostPort":Landroid/gov/nist/core/HostPort;
    invoke-virtual {v12}, Landroid/gov/nist/core/HostPort;->hasPort()Z

    move-result v13

    if-eqz v13, :cond_10

    .line 450
    invoke-virtual {v12}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v13

    .local v13, "port":I
    goto :goto_2

    .line 452
    .end local v13    # "port":I
    :cond_10
    iget-object v13, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getTransport()Ljava/lang/String;

    move-result-object v13

    const-string/jumbo v14, "TLS"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 454
    const/16 v13, 0x13c5

    .restart local v13    # "port":I
    goto :goto_2

    .line 456
    .end local v13    # "port":I
    :cond_11
    const/16 v13, 0x13c4

    .line 458
    .restart local v13    # "port":I
    :goto_2
    invoke-virtual {v12}, Landroid/gov/nist/core/HostPort;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v14

    invoke-virtual {v14}, Landroid/gov/nist/core/Host;->encode()Ljava/lang/String;

    move-result-object v14

    .line 459
    .local v14, "host":Ljava/lang/String;
    iget-object v15, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v15}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getIPAddress()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_12

    iget-object v15, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v15}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getSentBy()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_14

    :cond_12
    iget-object v15, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v15}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getPort()I

    move-result v15

    if-ne v13, v15, :cond_14

    .line 462
    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/header/RouteList;->size()I

    move-result v15

    const/4 v3, 0x1

    if-ne v15, v3, :cond_13

    .line 463
    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->removeHeader(Ljava/lang/String;)V

    goto :goto_3

    .line 465
    :cond_13
    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/header/RouteList;->removeFirst()V

    .line 468
    .end local v9    # "routes":Landroid/gov/nist/javax/sip/header/RouteList;
    .end local v10    # "route":Landroid/gov/nist/javax/sip/header/Route;
    .end local v11    # "uri":Landroid/gov/nist/javax/sip/address/SipUri;
    .end local v12    # "hostPort":Landroid/gov/nist/core/HostPort;
    .end local v13    # "port":I
    .end local v14    # "host":Ljava/lang/String;
    :cond_14
    :goto_3
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v3

    .line 469
    .local v3, "sipRequestMethod":Ljava/lang/String;
    const-string/jumbo v0, "REFER"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v10, " "

    const-string v11, "BYE"

    const-string/jumbo v12, "PRACK"

    const-string v13, "ACK"

    const-string v9, "CANCEL"

    const-string v15, "INVITE"

    if-eqz v0, :cond_1a

    if-eqz v8, :cond_1a

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isDialogErrorsAutomaticallyHandled()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 476
    const-string/jumbo v0, "Refer-To"

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/ReferToHeader;

    .line 478
    .local v0, "sipHeader":Landroid/javax/sip/header/ReferToHeader;
    if-nez v0, :cond_15

    .line 479
    const-string/jumbo v9, "Refer-To header is missing"

    invoke-direct {v1, v2, v6, v9}, Landroid/gov/nist/javax/sip/DialogFilter;->sendBadRequestResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;Ljava/lang/String;)V

    .line 481
    return-void

    .line 489
    :cond_15
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastTransaction()Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v14

    .line 491
    .local v14, "lastTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    if-eqz v14, :cond_18

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isDialogErrorsAutomaticallyHandled()Z

    move-result v18

    if-eqz v18, :cond_18

    .line 493
    move-object/from16 v18, v0

    .end local v0    # "sipHeader":Landroid/javax/sip/header/ReferToHeader;
    .local v18, "sipHeader":Landroid/javax/sip/header/ReferToHeader;
    invoke-interface {v14}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 494
    .local v0, "lastTransactionMethod":Ljava/lang/String;
    move-object/from16 v19, v9

    instance-of v9, v14, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v9, :cond_17

    .line 496
    invoke-interface {v14}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getInternalState()I

    move-result v9

    move-object/from16 v20, v10

    const/4 v10, 0x2

    if-eq v9, v10, :cond_16

    invoke-interface {v14}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getInternalState()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_19

    :cond_16
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_19

    .line 499
    invoke-direct {v1, v2, v6}, Landroid/gov/nist/javax/sip/DialogFilter;->sendRequestPendingResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 502
    return-void

    .line 504
    :cond_17
    move-object/from16 v20, v10

    instance-of v9, v14, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    if-eqz v9, :cond_19

    .line 505
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_19

    invoke-interface {v14}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getInternalState()I

    move-result v9

    const/4 v10, 0x5

    if-eq v9, v10, :cond_19

    invoke-interface {v14}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getInternalState()I

    move-result v9

    const/4 v10, 0x3

    if-eq v9, v10, :cond_19

    .line 508
    invoke-direct {v1, v2, v6}, Landroid/gov/nist/javax/sip/DialogFilter;->sendRequestPendingResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 511
    return-void

    .line 491
    .end local v18    # "sipHeader":Landroid/javax/sip/header/ReferToHeader;
    .local v0, "sipHeader":Landroid/javax/sip/header/ReferToHeader;
    :cond_18
    move-object/from16 v18, v0

    move-object/from16 v19, v9

    move-object/from16 v20, v10

    .line 516
    .end local v0    # "sipHeader":Landroid/javax/sip/header/ReferToHeader;
    .end local v14    # "lastTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    :cond_19
    move-object/from16 v18, v13

    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 469
    :cond_1a
    move-object/from16 v19, v9

    move-object/from16 v20, v10

    .line 516
    const-string/jumbo v0, "UPDATE"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 521
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v0

    if-eqz v0, :cond_1b

    if-nez v8, :cond_1b

    .line 522
    invoke-direct {v1, v2, v6}, Landroid/gov/nist/javax/sip/DialogFilter;->sendCallOrTransactionDoesNotExistResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 524
    return-void

    .line 521
    :cond_1b
    move-object/from16 v18, v13

    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 526
    :cond_1c
    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v9, "Dialog does not exist "

    const-string v10, " isServerTransaction = "

    if-eqz v0, :cond_33

    .line 528
    if-eqz v6, :cond_1e

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isInviteTransaction()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 531
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x20

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 532
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v9, "Processing ACK for INVITE Tx "

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    move-object/from16 v18, v13

    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 531
    :cond_1d
    move-object/from16 v18, v13

    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 536
    :cond_1e
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v14, 0x20

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 537
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v18, v13

    const-string/jumbo v13, "Processing ACK for dialog "

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v0, v13}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_4

    .line 536
    :cond_1f
    move-object/from16 v18, v13

    .line 540
    :goto_4
    const-string/jumbo v13, "Problem terminating transaction"

    const-string v0, "Found Tx pending ACK"

    if-nez v8, :cond_25

    .line 541
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v15, 0x20

    invoke-interface {v14, v15}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v14

    if-eqz v14, :cond_20

    .line 542
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v14, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 548
    :cond_20
    invoke-virtual {v4, v7}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getRetransmissionAlertTransaction(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v9

    .line 550
    .local v9, "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    if-eqz v9, :cond_21

    invoke-interface {v9}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isRetransmissionAlertEnabled()Z

    move-result v10

    if-eqz v10, :cond_21

    .line 551
    invoke-interface {v9}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->disableRetransmissionAlerts()V

    .line 558
    :cond_21
    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findTransactionPendingAck(Landroid/gov/nist/javax/sip/message/SIPRequest;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v10

    .line 564
    .local v10, "ackTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    if-eqz v10, :cond_24

    .line 565
    sget-object v11, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v12, 0x20

    invoke-interface {v11, v12}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v11

    if-eqz v11, :cond_22

    .line 566
    sget-object v11, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v11, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 569
    :cond_22
    :try_start_0
    invoke-interface {v10}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setAckSeen()V

    .line 570
    invoke-virtual {v4, v10}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 571
    invoke-virtual {v4, v10}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 578
    goto :goto_5

    .line 573
    :catch_0
    move-exception v0

    .line 574
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v11, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v11}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v11

    if-eqz v11, :cond_23

    .line 575
    sget-object v11, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v11, v13, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 579
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_23
    :goto_5
    return-void

    .line 582
    .end local v9    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v10    # "ackTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_24
    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 583
    :cond_25
    invoke-virtual {v8, v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->handleAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)Z

    move-result v9

    if-nez v9, :cond_30

    .line 584
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isSequenceNumberValidation()Z

    move-result v9

    if-nez v9, :cond_2a

    .line 585
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v14, 0x20

    invoke-interface {v9, v14}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_26

    .line 586
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Dialog exists with loose dialog validation "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/4 v14, 0x1

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v14, " dialog = "

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 594
    :cond_26
    invoke-virtual {v4, v7}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getRetransmissionAlertTransaction(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v9

    .line 596
    .restart local v9    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    if-eqz v9, :cond_27

    invoke-interface {v9}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isRetransmissionAlertEnabled()Z

    move-result v10

    if-eqz v10, :cond_27

    .line 597
    invoke-interface {v9}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->disableRetransmissionAlerts()V

    .line 603
    :cond_27
    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findTransactionPendingAck(Landroid/gov/nist/javax/sip/message/SIPRequest;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v10

    .line 609
    .restart local v10    # "ackTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    if-eqz v10, :cond_29

    .line 610
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v15, 0x20

    invoke-interface {v14, v15}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v14

    if-eqz v14, :cond_28

    .line 611
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v14, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 614
    :cond_28
    :try_start_1
    invoke-interface {v10}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setAckSeen()V

    .line 615
    invoke-virtual {v4, v10}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 616
    invoke-virtual {v4, v10}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 623
    goto :goto_6

    .line 618
    :catch_1
    move-exception v0

    .line 619
    .restart local v0    # "ex":Ljava/lang/Exception;
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v14}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v14

    if-eqz v14, :cond_29

    .line 620
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v14, v13, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 625
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v9    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v10    # "ackTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_29
    :goto_6
    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 626
    :cond_2a
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v10, 0x20

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_2b

    .line 628
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v10, "Dropping ACK - cannot find a transaction or dialog"

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 632
    :cond_2b
    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findTransactionPendingAck(Landroid/gov/nist/javax/sip/message/SIPRequest;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v9

    .line 634
    .local v9, "ackTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    if-eqz v9, :cond_2d

    .line 635
    sget-object v10, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v14, 0x20

    invoke-interface {v10, v14}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v10

    if-eqz v10, :cond_2c

    .line 636
    sget-object v10, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v10, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 639
    :cond_2c
    :try_start_2
    invoke-interface {v9}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setAckSeen()V

    .line 640
    invoke-virtual {v4, v9}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 641
    invoke-virtual {v4, v9}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 650
    goto :goto_7

    .line 643
    :catch_2
    move-exception v0

    .line 644
    .restart local v0    # "ex":Ljava/lang/Exception;
    sget-object v10, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v10

    if-eqz v10, :cond_2d

    .line 645
    sget-object v10, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v10, v13, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 657
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_2d
    :goto_7
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDeliverRetransmittedAckToListener()Z

    move-result v0

    if-eqz v0, :cond_2f

    if-eqz v9, :cond_2e

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isNon2XXAckPassedToListener()Z

    move-result v0

    if-nez v0, :cond_2e

    goto :goto_8

    .line 663
    .end local v9    # "ackTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_2e
    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 661
    .restart local v9    # "ackTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_2f
    :goto_8
    return-void

    .line 666
    .end local v9    # "ackTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_30
    invoke-virtual {v8, v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z

    .line 667
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    .line 668
    invoke-virtual {v8, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 669
    invoke-interface {v6, v8, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 670
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isDialogErrorsAutomaticallyHandled()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 673
    invoke-virtual {v4, v6, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putInMergeTable(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 681
    :cond_31
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDeliverTerminatedEventForAck()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 683
    :try_start_3
    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 684
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->scheduleAckRemoval()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_9

    .line 685
    :catch_3
    move-exception v0

    .line 687
    :goto_9
    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 689
    :cond_32
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setMapped(Z)V

    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 695
    :cond_33
    move-object/from16 v18, v13

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 706
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v13, 0x20

    invoke-interface {v0, v13}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 707
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Processing PRACK for dialog "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v0, v13}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 710
    :cond_34
    if-nez v8, :cond_38

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v0

    if-eqz v0, :cond_38

    .line 711
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v11, 0x20

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 712
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 718
    :cond_35
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x20

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_36

    .line 719
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v9, "Sending 481 for PRACK - automatic dialog support is enabled -- cant find dialog!"

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 723
    :cond_36
    const/16 v9, 0x1e1

    invoke-virtual {v2, v9}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v9

    .line 727
    .local v9, "notExist":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :try_start_4
    invoke-virtual {v5, v9}, Landroid/gov/nist/javax/sip/SipProviderImpl;->sendResponse(Landroid/javax/sip/message/Response;)V
    :try_end_4
    .catch Landroid/javax/sip/SipException; {:try_start_4 .. :try_end_4} :catch_4

    .line 731
    goto :goto_a

    .line 728
    :catch_4
    move-exception v0

    move-object v10, v0

    move-object v0, v10

    .line 729
    .local v0, "e":Landroid/javax/sip/SipException;
    sget-object v10, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v11, "error sending response"

    invoke-interface {v10, v11, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 732
    .end local v0    # "e":Landroid/javax/sip/SipException;
    :goto_a
    if-eqz v6, :cond_37

    .line 733
    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 734
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 736
    :cond_37
    return-void

    .line 738
    .end local v9    # "notExist":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :cond_38
    if-eqz v8, :cond_3c

    .line 739
    invoke-virtual {v8, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->handlePrack(Landroid/gov/nist/javax/sip/message/SIPRequest;)Z

    move-result v0

    if-nez v0, :cond_3b

    .line 740
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x20

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 741
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v9, "Dropping out of sequence PRACK "

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 743
    :cond_39
    if-eqz v6, :cond_3a

    .line 744
    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 745
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 747
    :cond_3a
    return-void

    .line 750
    :cond_3b
    :try_start_5
    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 751
    invoke-virtual {v8, v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z

    .line 752
    invoke-virtual {v8, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 753
    invoke-interface {v6, v8, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_b

    .line 754
    :catch_5
    move-exception v0

    .line 755
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 756
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_b
    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 759
    :cond_3c
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x20

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 760
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v9, "Processing PRACK without a DIALOG -- this must be a proxy element"

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 759
    :cond_3d
    move-object/from16 v9, v19

    move-object/from16 v10, v20

    goto/16 :goto_15

    .line 765
    :cond_3e
    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_49

    .line 767
    if-eqz v8, :cond_42

    invoke-virtual {v8, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isRequestConsumable(Landroid/gov/nist/javax/sip/message/SIPRequest;)Z

    move-result v0

    if-nez v0, :cond_42

    .line 768
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x20

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 769
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Dropping out of sequence BYE "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteSeqNumber()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v10, v20

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v10

    invoke-interface {v10}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 774
    :cond_3f
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteSeqNumber()J

    move-result-wide v9

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v11

    cmp-long v0, v9, v11

    if-lez v0, :cond_40

    .line 776
    invoke-direct {v1, v2, v6}, Landroid/gov/nist/javax/sip/DialogFilter;->sendServerInternalErrorResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    goto :goto_c

    .line 778
    :cond_40
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getInternalState()I

    move-result v0

    const/4 v9, 0x2

    if-ne v0, v9, :cond_41

    .line 779
    invoke-direct {v1, v2, v6}, Landroid/gov/nist/javax/sip/DialogFilter;->sendTryingResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 783
    :cond_41
    :goto_c
    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 784
    return-void

    .line 767
    :cond_42
    move-object/from16 v10, v20

    .line 786
    if-nez v8, :cond_45

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v0

    if-eqz v0, :cond_45

    .line 797
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x20

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 798
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v9, "dropping request -- automatic dialog support enabled and dialog does not exist!"

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 802
    :cond_43
    invoke-direct {v1, v2, v6}, Landroid/gov/nist/javax/sip/DialogFilter;->sendCallOrTransactionDoesNotExistResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 805
    if-eqz v6, :cond_44

    .line 806
    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 807
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 808
    const/4 v6, 0x0

    .line 810
    :cond_44
    return-void

    .line 818
    :cond_45
    if-eqz v6, :cond_47

    if-eqz v8, :cond_47

    .line 820
    :try_start_6
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    if-ne v5, v0, :cond_46

    .line 821
    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 822
    invoke-virtual {v8, v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z

    .line 823
    invoke-interface {v6, v8, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_6

    .line 828
    :cond_46
    goto :goto_d

    .line 826
    :catch_6
    move-exception v0

    .line 827
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 830
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_47
    :goto_d
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x20

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 831
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "BYE Tx = "

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v13, " isMapped ="

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isTransactionMapped()Z

    move-result v13

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    move-object/from16 v9, v19

    goto/16 :goto_15

    .line 830
    :cond_48
    move-object/from16 v9, v19

    goto/16 :goto_15

    .line 836
    :cond_49
    move-object/from16 v10, v20

    move-object/from16 v9, v19

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    .line 838
    const/4 v0, 0x1

    invoke-virtual {v4, v2, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findCancelTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 840
    .local v13, "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v14, 0x20

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 841
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Got a CANCEL, InviteServerTx = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " cancel Server Tx ID = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " isMapped = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isTransactionMapped()Z

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 850
    :cond_4a
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 854
    if-eqz v13, :cond_4d

    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getInternalState()I

    move-result v0

    const/4 v14, 0x5

    if-ne v0, v14, :cond_4d

    .line 859
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x20

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4b

    .line 860
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v9, "Too late to cancel Transaction"

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 865
    :cond_4b
    const/16 v0, 0xc8

    :try_start_7
    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    invoke-interface {v6, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->sendResponse(Landroid/javax/sip/message/Response;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    .line 872
    goto :goto_e

    .line 867
    :catch_7
    move-exception v0

    .line 868
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v9

    if-eqz v9, :cond_4c

    invoke-virtual {v0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v9

    instance-of v9, v9, Ljava/io/IOException;

    if-eqz v9, :cond_4c

    .line 870
    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->raiseIOExceptionEvent()V

    .line 873
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_4c
    :goto_e
    return-void

    .line 875
    :cond_4d
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v14, 0x20

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 876
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Cancel transaction = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 880
    :cond_4e
    if-eqz v6, :cond_4f

    if-eqz v13, :cond_4f

    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    if-eqz v0, :cond_4f

    .line 883
    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-interface {v6, v0, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 884
    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    goto :goto_10

    .line 885
    :cond_4f
    if-nez v13, :cond_52

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v0

    if-eqz v0, :cond_52

    if-eqz v6, :cond_52

    .line 893
    const/16 v9, 0x1e1

    invoke-virtual {v2, v9}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v9

    .line 895
    .local v9, "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v10, 0x20

    invoke-interface {v0, v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_50

    .line 896
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v10, "dropping request -- automatic dialog support enabled and INVITE ST does not exist!"

    invoke-interface {v0, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 901
    :cond_50
    :try_start_8
    invoke-virtual {v5, v9}, Landroid/gov/nist/javax/sip/SipProviderImpl;->sendResponse(Landroid/javax/sip/message/Response;)V
    :try_end_8
    .catch Landroid/javax/sip/SipException; {:try_start_8 .. :try_end_8} :catch_8

    .line 904
    goto :goto_f

    .line 902
    :catch_8
    move-exception v0

    move-object v10, v0

    move-object v0, v10

    .line 903
    .local v0, "ex":Landroid/javax/sip/SipException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 905
    .end local v0    # "ex":Landroid/javax/sip/SipException;
    :goto_f
    if-eqz v6, :cond_51

    .line 906
    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 907
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 909
    :cond_51
    return-void

    .line 915
    .end local v9    # "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :cond_52
    :goto_10
    if-eqz v13, :cond_54

    .line 918
    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setPassToListener()V

    .line 920
    if-eqz v6, :cond_53

    .line 921
    :try_start_9
    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 922
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setPassToListener()V

    .line 923
    invoke-interface {v6, v13}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setInviteTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 926
    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->acquireSem()Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_9

    goto :goto_11

    .line 930
    :catch_9
    move-exception v0

    .line 931
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    goto :goto_12

    .line 932
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_53
    :goto_11
    nop

    .line 934
    .end local v13    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_54
    :goto_12
    goto/16 :goto_15

    :cond_55
    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    .line 935
    if-nez v8, :cond_56

    const/4 v0, 0x0

    goto :goto_13

    :cond_56
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getInviteTransaction()Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v0

    .line 947
    .local v0, "lastTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    :goto_13
    if-eqz v8, :cond_58

    if-eqz v6, :cond_58

    if-eqz v0, :cond_58

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v13

    invoke-interface {v13}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v13

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getCSeq()J

    move-result-wide v19

    cmp-long v13, v13, v19

    if-lez v13, :cond_58

    instance-of v13, v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v13, :cond_58

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isDialogErrorsAutomaticallyHandled()Z

    move-result v13

    if-eqz v13, :cond_58

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isSequenceNumberValidation()Z

    move-result v13

    if-eqz v13, :cond_58

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isInviteTransaction()Z

    move-result v13

    if-eqz v13, :cond_58

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getInternalState()I

    move-result v13

    const/4 v14, 0x3

    if-eq v13, v14, :cond_58

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getInternalState()I

    move-result v13

    const/4 v14, 0x5

    if-eq v13, v14, :cond_58

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getInternalState()I

    move-result v13

    const/4 v14, 0x4

    if-eq v13, v14, :cond_58

    .line 959
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v10, 0x20

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_57

    .line 960
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v10, "Sending 500 response for out of sequence message"

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 963
    :cond_57
    invoke-direct {v1, v2, v6}, Landroid/gov/nist/javax/sip/DialogFilter;->sendServerInternalErrorResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 964
    return-void

    .line 974
    :cond_58
    if-nez v8, :cond_59

    const/4 v13, 0x0

    goto :goto_14

    :cond_59
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastTransaction()Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v13

    :goto_14
    move-object v0, v13

    .line 977
    if-eqz v8, :cond_5b

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isDialogErrorsAutomaticallyHandled()Z

    move-result v13

    if-eqz v13, :cond_5b

    if-eqz v0, :cond_5b

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isInviteTransaction()Z

    move-result v13

    if-eqz v13, :cond_5b

    instance-of v13, v0, Landroid/javax/sip/ClientTransaction;

    if-eqz v13, :cond_5b

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v13

    sget-object v14, Landroid/javax/sip/TransactionState;->COMPLETED:Landroid/javax/sip/TransactionState;

    if-eq v13, v14, :cond_5b

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v13

    sget-object v14, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    if-eq v13, v14, :cond_5b

    .line 985
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v10, 0x20

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_5a

    .line 986
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "DialogFilter::processRequest:lastTransaction.getState(): "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " Sending 491 response for clientTx."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 989
    :cond_5a
    invoke-direct {v1, v2, v6}, Landroid/gov/nist/javax/sip/DialogFilter;->sendRequestPendingResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 990
    return-void

    .line 993
    :cond_5b
    if-eqz v8, :cond_5e

    if-eqz v0, :cond_5e

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isDialogErrorsAutomaticallyHandled()Z

    move-result v13

    if-eqz v13, :cond_5e

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isInviteTransaction()Z

    move-result v13

    if-eqz v13, :cond_5e

    instance-of v13, v0, Landroid/javax/sip/ServerTransaction;

    if-eqz v13, :cond_5e

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v13

    invoke-interface {v13}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v13

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getCSeq()J

    move-result-wide v16

    cmp-long v13, v13, v16

    if-lez v13, :cond_5e

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getInternalState()I

    move-result v13

    const/4 v14, 0x2

    if-eq v13, v14, :cond_5c

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getInternalState()I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_5e

    .line 1005
    :cond_5c
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v10, 0x20

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_5d

    .line 1006
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v10, "Sending 491 response. Last transaction is in PROCEEDING state."

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1009
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "last Transaction state = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " state "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1013
    :cond_5d
    invoke-direct {v1, v2, v6}, Landroid/gov/nist/javax/sip/DialogFilter;->sendRequestPendingResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 1014
    return-void

    .line 1023
    .end local v0    # "lastTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    :cond_5e
    :goto_15
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v13, 0x20

    invoke-interface {v0, v13}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_5f

    .line 1024
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "CHECK FOR OUT OF SEQ MESSAGE "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " transaction "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v0, v13}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1029
    :cond_5f
    if-eqz v8, :cond_66

    if-eqz v6, :cond_66

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_66

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_66

    move-object/from16 v9, v18

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_66

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_66

    .line 1035
    invoke-virtual {v8, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isRequestConsumable(Landroid/gov/nist/javax/sip/message/SIPRequest;)Z

    move-result v0

    if-nez v0, :cond_63

    .line 1046
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x20

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_60

    .line 1047
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Dropping out of sequence message "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteSeqNumber()J

    move-result-wide v11

    invoke-virtual {v9, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1060
    :cond_60
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteSeqNumber()J

    move-result-wide v9

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v11

    cmp-long v0, v9, v11

    if-lez v0, :cond_61

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isDialogErrorsAutomaticallyHandled()Z

    move-result v0

    if-eqz v0, :cond_61

    .line 1063
    invoke-direct {v1, v2, v6}, Landroid/gov/nist/javax/sip/DialogFilter;->sendServerInternalErrorResponse(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    goto :goto_16

    .line 1067
    :cond_61
    :try_start_a
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->terminate()V
    :try_end_a
    .catch Landroid/javax/sip/ObjectInUseException; {:try_start_a .. :try_end_a} :catch_a

    .line 1073
    goto :goto_16

    .line 1068
    :catch_a
    move-exception v0

    move-object v9, v0

    move-object v0, v9

    .line 1069
    .local v0, "e":Landroid/javax/sip/ObjectInUseException;
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v9

    if-eqz v9, :cond_62

    .line 1070
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v10, "Unexpected exception"

    invoke-interface {v9, v10, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1075
    .end local v0    # "e":Landroid/javax/sip/ObjectInUseException;
    :cond_62
    :goto_16
    return-void

    .line 1079
    :cond_63
    :try_start_b
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    if-ne v5, v0, :cond_65

    .line 1080
    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 1082
    invoke-virtual {v8, v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z

    move-result v0

    if-nez v0, :cond_64

    .line 1083
    return-void

    .line 1085
    :cond_64
    invoke-virtual {v8, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 1086
    invoke-interface {v6, v8, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_b

    .line 1093
    :cond_65
    goto :goto_17

    .line 1089
    :catch_b
    move-exception v0

    .line 1090
    .local v0, "ex":Ljava/io/IOException;
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->raiseIOExceptionEvent()V

    .line 1091
    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1092
    return-void

    .line 1099
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_66
    :goto_17
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x20

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_67

    .line 1100
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " transaction.isMapped = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isTransactionMapped()Z

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1120
    :cond_67
    if-nez v8, :cond_78

    const-string v0, "NOTIFY"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_78

    .line 1122
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v4, v2, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findSubscribeTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/ListeningPointImpl;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v9

    .line 1125
    .local v9, "pendingSubscribeClientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v10, 0x20

    invoke-interface {v0, v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_68

    .line 1126
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "PROCESSING NOTIFY  DIALOG == null "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v0, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1138
    :cond_68
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v0

    if-eqz v0, :cond_6a

    if-nez v9, :cond_6a

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDeliverUnsolicitedNotify()Z

    move-result v0

    if-nez v0, :cond_6a

    .line 1147
    :try_start_c
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v10, 0x20

    invoke-interface {v0, v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_69

    .line 1148
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v10, "Could not find Subscription for Notify Tx."

    invoke-interface {v0, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1151
    :cond_69
    const/16 v10, 0x1e1

    invoke-virtual {v2, v10}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v0

    .line 1153
    .local v0, "errorResponse":Landroid/javax/sip/message/Response;
    const-string/jumbo v10, "Subscription does not exist"

    invoke-interface {v0, v10}, Landroid/javax/sip/message/Response;->setReasonPhrase(Ljava/lang/String;)V

    .line 1155
    invoke-virtual {v5, v0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->sendResponse(Landroid/javax/sip/message/Response;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_c

    .line 1156
    return-void

    .line 1158
    .end local v0    # "errorResponse":Landroid/javax/sip/message/Response;
    :catch_c
    move-exception v0

    .line 1159
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v10, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v11, "Exception while sending error response statelessly"

    invoke-interface {v10, v11, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1163
    return-void

    .line 1171
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_6a
    if-eqz v9, :cond_76

    .line 1177
    invoke-interface {v6, v9}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setPendingSubscribe(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V

    .line 1181
    invoke-interface {v9}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v10

    .line 1185
    .local v10, "subscriptionDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v10, :cond_6d

    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6d

    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6b

    goto :goto_19

    .line 1255
    :cond_6b
    invoke-interface {v6, v10, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 1256
    move-object v8, v10

    .line 1257
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isTransactionMapped()Z

    move-result v0

    if-nez v0, :cond_6c

    .line 1258
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->mapTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 1262
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setPassToListener()V

    .line 1264
    :try_start_d
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_d

    .line 1266
    goto :goto_18

    .line 1265
    :catch_d
    move-exception v0

    .line 1268
    :cond_6c
    :goto_18
    invoke-virtual {v4, v10}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1269
    if-eqz v9, :cond_74

    .line 1270
    invoke-virtual {v10, v9}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z

    .line 1272
    invoke-interface {v9, v10, v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    goto/16 :goto_1c

    .line 1192
    :cond_6d
    :goto_19
    if-eqz v10, :cond_6e

    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_6e

    .line 1194
    invoke-virtual {v10, v7}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setDialogId(Ljava/lang/String;)V

    .line 1195
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v11, 0x20

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_6f

    .line 1196
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v11, "Dialog id set on default dialog."

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_1a

    .line 1201
    :cond_6e
    invoke-interface {v9, v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v10

    .line 1204
    :cond_6f
    :goto_1a
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v11, 0x20

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_70

    .line 1205
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "PROCESSING NOTIFY Subscribe DIALOG "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1212
    :cond_70
    if-nez v10, :cond_72

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v0

    if-nez v0, :cond_71

    invoke-interface {v9}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    if-eqz v0, :cond_72

    .line 1215
    :cond_71
    const-string v0, "Event"

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Event;

    .line 1217
    .local v0, "event":Landroid/gov/nist/javax/sip/header/Event;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Event;->getEventType()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isEventForked(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_72

    .line 1219
    invoke-virtual {v4, v9, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->createDialog(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v10

    .line 1225
    .end local v0    # "event":Landroid/gov/nist/javax/sip/header/Event;
    :cond_72
    if-eqz v10, :cond_74

    .line 1226
    invoke-interface {v6, v10, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 1227
    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v11, Landroid/javax/sip/DialogState;->CONFIRMED:Landroid/javax/sip/DialogState;

    if-eq v0, v11, :cond_73

    .line 1228
    invoke-virtual {v10, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setPendingRouteUpdateOn202Response(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 1232
    :cond_73
    sget-object v0, Landroid/javax/sip/DialogState;->CONFIRMED:Landroid/javax/sip/DialogState;

    invoke-virtual {v0}, Landroid/javax/sip/DialogState;->getValue()I

    move-result v0

    invoke-virtual {v10, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 1234
    invoke-virtual {v4, v10}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1235
    invoke-interface {v9, v10, v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 1237
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isTransactionMapped()Z

    move-result v0

    if-nez v0, :cond_74

    .line 1238
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->mapTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 1244
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setPassToListener()V

    .line 1246
    :try_start_e
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_e

    goto :goto_1b

    .line 1247
    :catch_e
    move-exception v0

    .line 1248
    :goto_1b
    nop

    .line 1277
    :cond_74
    :goto_1c
    if-eqz v6, :cond_75

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isTransactionMapped()Z

    move-result v0

    if-eqz v0, :cond_75

    .line 1283
    new-instance v0, Landroid/gov/nist/javax/sip/RequestEventExt;

    invoke-direct {v0, v5, v6, v10, v2}, Landroid/gov/nist/javax/sip/RequestEventExt;-><init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Request;)V

    .local v0, "sipEvent":Landroid/javax/sip/RequestEvent;
    goto :goto_1d

    .line 1292
    .end local v0    # "sipEvent":Landroid/javax/sip/RequestEvent;
    :cond_75
    new-instance v0, Landroid/gov/nist/javax/sip/RequestEventExt;

    const/4 v11, 0x0

    invoke-direct {v0, v5, v11, v10, v2}, Landroid/gov/nist/javax/sip/RequestEventExt;-><init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Request;)V

    .line 1297
    .end local v10    # "subscriptionDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .restart local v0    # "sipEvent":Landroid/javax/sip/RequestEvent;
    :goto_1d
    goto :goto_1e

    .line 1298
    .end local v0    # "sipEvent":Landroid/javax/sip/RequestEvent;
    :cond_76
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v10, 0x20

    invoke-interface {v0, v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_77

    .line 1299
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v10, "could not find subscribe tx"

    invoke-interface {v0, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1305
    :cond_77
    new-instance v0, Landroid/gov/nist/javax/sip/RequestEventExt;

    const/4 v10, 0x0

    invoke-direct {v0, v5, v10, v10, v2}, Landroid/gov/nist/javax/sip/RequestEventExt;-><init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Request;)V

    .line 1309
    .end local v9    # "pendingSubscribeClientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .restart local v0    # "sipEvent":Landroid/javax/sip/RequestEvent;
    :goto_1e
    goto :goto_1f

    .line 1313
    .end local v0    # "sipEvent":Landroid/javax/sip/RequestEvent;
    :cond_78
    if-eqz v6, :cond_79

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isTransactionMapped()Z

    move-result v0

    if-eqz v0, :cond_79

    .line 1316
    new-instance v0, Landroid/gov/nist/javax/sip/RequestEventExt;

    invoke-direct {v0, v5, v6, v8, v2}, Landroid/gov/nist/javax/sip/RequestEventExt;-><init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Request;)V

    .restart local v0    # "sipEvent":Landroid/javax/sip/RequestEvent;
    goto :goto_1f

    .line 1320
    .end local v0    # "sipEvent":Landroid/javax/sip/RequestEvent;
    :cond_79
    new-instance v0, Landroid/gov/nist/javax/sip/RequestEventExt;

    const/4 v9, 0x0

    invoke-direct {v0, v5, v9, v8, v2}, Landroid/gov/nist/javax/sip/RequestEventExt;-><init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Request;)V

    .line 1326
    .restart local v0    # "sipEvent":Landroid/javax/sip/RequestEvent;
    :goto_1f
    move-object v9, v0

    check-cast v9, Landroid/gov/nist/javax/sip/RequestEventExt;

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v10

    invoke-virtual {v10}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/gov/nist/javax/sip/RequestEventExt;->setRemoteIpAddress(Ljava/lang/String;)V

    .line 1327
    move-object v9, v0

    check-cast v9, Landroid/gov/nist/javax/sip/RequestEventExt;

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRemotePort()I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/gov/nist/javax/sip/RequestEventExt;->setRemotePort(I)V

    .line 1328
    invoke-virtual {v5, v0, v6}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1330
    return-void
.end method

.method public processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    .locals 17
    .param p1, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;
    .param p2, "incomingChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 1544
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v3

    .line 1545
    .local v3, "dialogID":Ljava/lang/String;
    iget-object v4, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v4

    .line 1547
    .local v4, "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v5

    invoke-interface {v5}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v5

    .line 1548
    .local v5, "method":Ljava/lang/String;
    sget-object v6, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v7, 0x20

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1549
    sget-object v6, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "PROCESSING INCOMING RESPONSE: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Landroid/gov/nist/javax/sip/message/SIPResponse;->encodeMessage(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1554
    :cond_0
    iget-object v6, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->checkBranchId()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-static {}, Landroid/gov/nist/javax/sip/Utils;->getInstance()Landroid/gov/nist/javax/sip/Utils;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/gov/nist/javax/sip/Utils;->responseBelongsToUs(Landroid/gov/nist/javax/sip/message/SIPResponse;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 1556
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1557
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v6, "Detected stray response -- dropping"

    invoke-interface {v0, v6}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1560
    :cond_1
    return-void

    .line 1563
    :cond_2
    iget-object v6, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    if-nez v6, :cond_4

    .line 1564
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1565
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v6, "Dropping message: No listening point registered!"

    invoke-interface {v0, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1569
    :cond_3
    return-void

    .line 1572
    :cond_4
    iget-object v6, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v6

    .line 1573
    .local v6, "sipProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    if-nez v6, :cond_6

    .line 1574
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1575
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v7, "Dropping message:  no provider"

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1578
    :cond_5
    return-void

    .line 1581
    :cond_6
    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v8

    if-nez v8, :cond_8

    .line 1582
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1583
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v7, "Dropping message:  no sipListener registered!"

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1586
    :cond_7
    return-void

    .line 1589
    :cond_8
    iget-object v8, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v8, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1594
    .local v8, "transaction":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    if-nez v4, :cond_9

    if-eqz v8, :cond_9

    .line 1595
    invoke-interface {v8, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v4

    .line 1596
    if-eqz v4, :cond_9

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v9

    sget-object v10, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-ne v9, v10, :cond_9

    .line 1598
    const/4 v4, 0x0

    .line 1601
    :cond_9
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 1602
    sget-object v9, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Transaction = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " sipDialog = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1606
    :cond_a
    iget-object v9, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    const/4 v10, 0x1

    if-eqz v9, :cond_10

    .line 1607
    iget-object v9, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v9}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v9

    check-cast v9, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromTag()Ljava/lang/String;

    move-result-object v9

    .line 1609
    .local v9, "originalFrom":Ljava/lang/String;
    if-nez v9, :cond_b

    move v11, v10

    goto :goto_0

    :cond_b
    move v11, v0

    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v12

    invoke-interface {v12}, Landroid/javax/sip/header/FromHeader;->getTag()Ljava/lang/String;

    move-result-object v12

    if-nez v12, :cond_c

    move v12, v10

    goto :goto_1

    :cond_c
    move v12, v0

    :goto_1
    xor-int/2addr v11, v12

    const-string v12, "From tag mismatch -- dropping response"

    if-eqz v11, :cond_e

    .line 1610
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1611
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1613
    :cond_d
    return-void

    .line 1615
    :cond_e
    if-eqz v9, :cond_10

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v11

    invoke-interface {v11}, Landroid/javax/sip/header/FromHeader;->getTag()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_10

    .line 1618
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1619
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1621
    :cond_f
    return-void

    .line 1625
    .end local v9    # "originalFrom":Ljava/lang/String;
    :cond_10
    const/4 v9, 0x0

    .line 1626
    .local v9, "createDialog":Z
    invoke-static {v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v11

    const/16 v12, 0x64

    if-eqz v11, :cond_17

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v11

    if-eq v11, v12, :cond_17

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v11

    invoke-interface {v11}, Landroid/javax/sip/header/FromHeader;->getTag()Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_17

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v11

    invoke-interface {v11}, Landroid/javax/sip/header/ToHeader;->getTag()Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_17

    if-nez v4, :cond_17

    .line 1633
    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v11

    if-eqz v11, :cond_11

    .line 1634
    const/4 v9, 0x1

    goto :goto_2

    .line 1637
    :cond_11
    iget-object v11, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getForkId()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getForkedTransaction(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v11

    .line 1639
    .local v11, "originalTx":Landroid/gov/nist/javax/sip/ClientTransactionExt;
    if-eqz v11, :cond_13

    invoke-interface {v11}, Landroid/gov/nist/javax/sip/ClientTransactionExt;->getDefaultDialog()Landroid/javax/sip/Dialog;

    move-result-object v13

    if-eqz v13, :cond_13

    .line 1640
    sget-object v13, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v13, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v13

    if-eqz v13, :cond_12

    .line 1641
    sget-object v13, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Need to create dialog for response = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1643
    :cond_12
    const/4 v9, 0x1

    .line 1646
    .end local v11    # "originalTx":Landroid/gov/nist/javax/sip/ClientTransactionExt;
    :cond_13
    :goto_2
    if-eqz v9, :cond_1e

    .line 1647
    iget-object v11, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    const-string v13, "Creating dialog for forked response "

    if-eqz v11, :cond_15

    .line 1648
    if-nez v4, :cond_1e

    .line 1649
    sget-object v11, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v11, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v11

    if-eqz v11, :cond_14

    .line 1650
    sget-object v11, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v11, v13}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1654
    :cond_14
    iget-object v11, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v13, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v13, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-virtual {v11, v13, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->createDialog(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v4

    .line 1658
    iget-object v11, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v11, v4, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 1662
    :cond_15
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 1663
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1666
    :cond_16
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v6, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->createDialog(Landroid/gov/nist/javax/sip/SipProviderImpl;Landroid/gov/nist/javax/sip/message/SIPResponse;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v4

    goto/16 :goto_4

    .line 1673
    :cond_17
    if-eqz v4, :cond_1e

    if-nez v8, :cond_1e

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v11

    sget-object v13, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-eq v11, v13, :cond_1e

    .line 1675
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v11

    div-int/2addr v11, v12

    const/4 v13, 0x2

    if-eq v11, v13, :cond_18

    .line 1676
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 1677
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "status code != 200 ; statusCode = "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 1680
    :cond_18
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v11

    sget-object v14, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-ne v11, v14, :cond_1b

    .line 1681
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 1682
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v7, "Dialog is terminated -- dropping response!"

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1688
    :cond_19
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v0

    div-int/2addr v0, v12

    if-ne v0, v13, :cond_1a

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v7, "INVITE"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 1692
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v10

    invoke-virtual {v4, v10, v11}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->createAck(J)Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 1695
    .local v0, "ackRequest":Landroid/javax/sip/message/Request;
    invoke-virtual {v4, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sendAck(Landroid/javax/sip/message/Request;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1699
    .end local v0    # "ackRequest":Landroid/javax/sip/message/Request;
    goto :goto_3

    .line 1696
    :catch_0
    move-exception v0

    .line 1697
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v7, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v10, "Error creating ack"

    invoke-interface {v7, v10, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1701
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1a
    :goto_3
    return-void

    .line 1703
    :cond_1b
    const/4 v11, 0x0

    .line 1704
    .local v11, "ackAlreadySent":Z
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAckSent()Z

    move-result v13

    if-eqz v13, :cond_1c

    .line 1706
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isLastAckPresent()Z

    move-result v13

    if-eqz v13, :cond_1c

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastAckSentCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v13

    invoke-interface {v13}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v13

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v15

    invoke-interface {v15}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v15

    cmp-long v13, v13, v15

    if-nez v13, :cond_1c

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastAckSentDialogId()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 1712
    const/4 v11, 0x1

    .line 1716
    :cond_1c
    if-eqz v11, :cond_1e

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMethod()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 1722
    :try_start_1
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 1723
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v13, "resending ACK"

    invoke-interface {v0, v13}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1726
    :cond_1d
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->resendAck()V
    :try_end_1
    .catch Landroid/javax/sip/SipException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1727
    return-void

    .line 1728
    :catch_1
    move-exception v0

    .line 1738
    .end local v11    # "ackAlreadySent":Z
    :cond_1e
    :goto_4
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 1739
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "sending response "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v13, " to TU for processing "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1742
    :cond_1f
    new-instance v0, Landroid/gov/nist/javax/sip/ResponseEventExt;

    invoke-direct {v0, v6, v8, v4, v2}, Landroid/gov/nist/javax/sip/ResponseEventExt;-><init>(Ljava/lang/Object;Landroid/gov/nist/javax/sip/ClientTransactionExt;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Response;)V

    .line 1746
    .local v0, "responseEvent":Landroid/gov/nist/javax/sip/ResponseEventExt;
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v11

    invoke-virtual {v11}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setRemoteIpAddress(Ljava/lang/String;)V

    .line 1747
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getRemotePort()I

    move-result v11

    invoke-virtual {v0, v11}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setRemotePort(I)V

    .line 1749
    iget-object v11, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxForkTime()I

    move-result v11

    if-eqz v11, :cond_21

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeqHeader()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v11

    invoke-interface {v11}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_21

    .line 1751
    iget-object v11, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getForkId()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getForkedTransaction(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v11

    .line 1753
    .local v11, "originalTx":Landroid/gov/nist/javax/sip/ClientTransactionExt;
    if-eqz v4, :cond_21

    if-eqz v11, :cond_21

    .line 1754
    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->checkRetransmissionForForking(Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 1755
    invoke-interface {v11}, Landroid/gov/nist/javax/sip/ClientTransactionExt;->getDefaultDialog()Landroid/javax/sip/Dialog;

    move-result-object v13

    if-eqz v13, :cond_21

    invoke-interface {v11}, Landroid/gov/nist/javax/sip/ClientTransactionExt;->getDefaultDialog()Landroid/javax/sip/Dialog;

    move-result-object v13

    invoke-virtual {v4, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_21

    .line 1756
    sget-object v13, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v13, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_20

    .line 1757
    sget-object v7, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "forkedId= "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getForkId()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " forked dialog "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " original tx "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " original dialog "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface {v11}, Landroid/gov/nist/javax/sip/ClientTransactionExt;->getDefaultDialog()Landroid/javax/sip/Dialog;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v7, v13}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1760
    :cond_20
    invoke-virtual {v0, v11}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setOriginalTransaction(Landroid/gov/nist/javax/sip/ClientTransactionExt;)V

    .line 1761
    invoke-virtual {v0, v10}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setForkedResponse(Z)V

    .line 1766
    .end local v11    # "originalTx":Landroid/gov/nist/javax/sip/ClientTransactionExt;
    :cond_21
    if-eqz v4, :cond_22

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v7

    if-eq v7, v12, :cond_22

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v7

    invoke-interface {v7}, Landroid/javax/sip/header/ToHeader;->getTag()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_22

    .line 1767
    invoke-virtual {v4, v8, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLastResponse(Landroid/gov/nist/javax/sip/stack/SIPTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 1769
    :cond_22
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->isRetransmission()Z

    move-result v7

    invoke-virtual {v0, v7}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setRetransmission(Z)V

    .line 1770
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setRemoteIpAddress(Ljava/lang/String;)V

    .line 1771
    invoke-virtual {v6, v0, v8}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1773
    return-void
.end method

.method public processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    .locals 17
    .param p1, "response"    # Landroid/gov/nist/javax/sip/message/SIPResponse;
    .param p2, "incomingMessageChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .param p3, "dialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1342
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p3

    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1343
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "PROCESSING INCOMING RESPONSE"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/message/SIPResponse;->encodeMessage(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1347
    :cond_0
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    if-nez v0, :cond_2

    .line 1348
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1349
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Dropping message: No listening point registered!"

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1353
    :cond_1
    return-void

    .line 1356
    :cond_2
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->checkBranchId()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Landroid/gov/nist/javax/sip/Utils;->getInstance()Landroid/gov/nist/javax/sip/Utils;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/Utils;->responseBelongsToUs(Landroid/gov/nist/javax/sip/message/SIPResponse;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1358
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1359
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Dropping response - topmost VIA header does not originate from this stack"

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1363
    :cond_3
    return-void

    .line 1366
    :cond_4
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v5

    .line 1367
    .local v5, "sipProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    if-nez v5, :cond_6

    .line 1368
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1369
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Dropping message:  no provider"

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1372
    :cond_5
    return-void

    .line 1374
    :cond_6
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v0

    if-nez v0, :cond_8

    .line 1375
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1376
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "No listener -- dropping response!"

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1379
    :cond_7
    return-void

    .line 1382
    :cond_8
    iget-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-object v6, v0

    check-cast v6, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1383
    .local v6, "transaction":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    iget-object v7, v5, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 1385
    .local v7, "sipStackImpl":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1386
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Transaction = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1390
    :cond_9
    const-string v8, " original dialog "

    const-string v9, " original tx "

    const-string/jumbo v10, "forkedId= "

    const/16 v0, 0x64

    const-string v12, " forked dialog "

    if-nez v6, :cond_16

    .line 1395
    if-eqz v3, :cond_10

    .line 1396
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v13

    div-int/2addr v13, v0

    const/4 v0, 0x2

    if-eq v13, v0, :cond_b

    .line 1397
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1398
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "Response is not a final response and dialog is found for response -- dropping response!"

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1402
    :cond_a
    return-void

    .line 1403
    :cond_b
    invoke-virtual/range {p3 .. p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v13, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-ne v0, v13, :cond_d

    .line 1404
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1405
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Dialog is terminated -- dropping response!"

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1408
    :cond_c
    return-void

    .line 1410
    :cond_d
    const/4 v0, 0x0

    .line 1411
    .local v0, "ackAlreadySent":Z
    invoke-virtual/range {p3 .. p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAckSeen()Z

    move-result v13

    if-eqz v13, :cond_e

    invoke-virtual/range {p3 .. p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAckSent()Z

    move-result v13

    if-eqz v13, :cond_e

    .line 1412
    invoke-virtual/range {p3 .. p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isLastAckPresent()Z

    move-result v13

    if-eqz v13, :cond_e

    invoke-virtual/range {p3 .. p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastAckSentCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v13

    invoke-interface {v13}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v13

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v15

    invoke-interface {v15}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v15

    cmp-long v13, v13, v15

    if-nez v13, :cond_e

    .line 1416
    const/4 v0, 0x1

    move v13, v0

    goto :goto_0

    .line 1420
    :cond_e
    move v13, v0

    .end local v0    # "ackAlreadySent":Z
    .local v13, "ackAlreadySent":Z
    :goto_0
    if-eqz v13, :cond_10

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMethod()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 1426
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1427
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v14, "Retransmission of OK detected: Resending last ACK"

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1431
    :cond_f
    invoke-virtual/range {p3 .. p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->resendAck()V
    :try_end_0
    .catch Landroid/javax/sip/SipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1432
    return-void

    .line 1433
    :catch_0
    move-exception v0

    .line 1435
    .local v0, "ex":Landroid/javax/sip/SipException;
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v15, "could not resend ack"

    invoke-interface {v14, v15, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1442
    .end local v0    # "ex":Landroid/javax/sip/SipException;
    .end local v13    # "ackAlreadySent":Z
    :cond_10
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1443
    sget-object v0, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "could not find tx, handling statelessly Dialog =  "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v0, v13}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1450
    :cond_11
    new-instance v0, Landroid/gov/nist/javax/sip/ResponseEventExt;

    invoke-direct {v0, v5, v6, v3, v2}, Landroid/gov/nist/javax/sip/ResponseEventExt;-><init>(Ljava/lang/Object;Landroid/gov/nist/javax/sip/ClientTransactionExt;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Response;)V

    .line 1453
    .local v0, "sipEvent":Landroid/gov/nist/javax/sip/ResponseEventExt;
    iget-object v13, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxForkTime()I

    move-result v13

    if-eqz v13, :cond_15

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeqHeader()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v13

    invoke-interface {v13}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_15

    .line 1455
    sget-object v13, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v13, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v13

    if-eqz v13, :cond_12

    .line 1456
    sget-object v13, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Trying to find forked Transaction for forked id "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getForkId()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1458
    :cond_12
    iget-object v13, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getForkId()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getForkedTransaction(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v13

    .line 1461
    .local v13, "forked":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    if-eqz v3, :cond_15

    if-eqz v13, :cond_15

    .line 1462
    invoke-virtual {v3, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->checkRetransmissionForForking(Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 1463
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v14, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v14

    if-eqz v14, :cond_13

    .line 1464
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "original dialog "

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v15

    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v14, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1466
    :cond_13
    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v11

    if-eqz v11, :cond_15

    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_15

    .line 1467
    sget-object v11, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v11, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 1468
    sget-object v4, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getForkId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v4, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1471
    :cond_14
    invoke-virtual {v0, v13}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setOriginalTransaction(Landroid/gov/nist/javax/sip/ClientTransactionExt;)V

    .line 1472
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setForkedResponse(Z)V

    .line 1473
    if-nez v6, :cond_15

    invoke-virtual/range {p3 .. p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v4

    sget-object v8, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    if-ne v4, v8, :cond_15

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v4

    const/16 v8, 0xc8

    if-lt v4, v8, :cond_15

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v4

    const/16 v8, 0x12c

    if-ge v4, v8, :cond_15

    .line 1477
    invoke-virtual {v3, v6, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLastResponse(Landroid/gov/nist/javax/sip/stack/SIPTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 1482
    .end local v13    # "forked":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_15
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->isRetransmission()Z

    move-result v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setRetransmission(Z)V

    .line 1484
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setRemoteIpAddress(Ljava/lang/String;)V

    .line 1485
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getRemotePort()I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setRemotePort(I)V

    .line 1486
    invoke-virtual {v5, v0, v6}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1487
    return-void

    .line 1491
    .end local v0    # "sipEvent":Landroid/gov/nist/javax/sip/ResponseEventExt;
    :cond_16
    new-instance v11, Landroid/gov/nist/javax/sip/ResponseEventExt;

    invoke-direct {v11, v5, v6, v3, v2}, Landroid/gov/nist/javax/sip/ResponseEventExt;-><init>(Ljava/lang/Object;Landroid/gov/nist/javax/sip/ClientTransactionExt;Landroid/javax/sip/Dialog;Landroid/javax/sip/message/Response;)V

    .line 1493
    .local v11, "responseEvent":Landroid/gov/nist/javax/sip/ResponseEventExt;
    iget-object v13, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v13}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxForkTime()I

    move-result v13

    if-eqz v13, :cond_18

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeqHeader()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v13

    invoke-interface {v13}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_18

    .line 1495
    iget-object v13, v1, Landroid/gov/nist/javax/sip/DialogFilter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getForkId()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getForkedTransaction(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v13

    .line 1497
    .restart local v13    # "forked":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    if-eqz v3, :cond_18

    if-eqz v13, :cond_18

    .line 1498
    invoke-virtual {v3, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->checkRetransmissionForForking(Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 1499
    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v14

    if-eqz v14, :cond_18

    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_18

    .line 1500
    sget-object v14, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v14, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 1501
    sget-object v4, Landroid/gov/nist/javax/sip/DialogFilter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getForkId()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v13}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v4, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1504
    :cond_17
    invoke-virtual {v11, v13}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setOriginalTransaction(Landroid/gov/nist/javax/sip/ClientTransactionExt;)V

    .line 1505
    const/4 v4, 0x1

    invoke-virtual {v11, v4}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setForkedResponse(Z)V

    .line 1511
    .end local v13    # "forked":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_18
    if-eqz v3, :cond_19

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v4

    if-eq v4, v0, :cond_19

    .line 1513
    invoke-virtual {v3, v6, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLastResponse(Landroid/gov/nist/javax/sip/stack/SIPTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 1514
    invoke-virtual/range {p3 .. p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v6, v3, v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 1516
    :cond_19
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->isRetransmission()Z

    move-result v0

    invoke-virtual {v11, v0}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setRetransmission(Z)V

    .line 1517
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setRemoteIpAddress(Ljava/lang/String;)V

    .line 1518
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getRemotePort()I

    move-result v0

    invoke-virtual {v11, v0}, Landroid/gov/nist/javax/sip/ResponseEventExt;->setRemotePort(I)V

    .line 1519
    invoke-virtual {v5, v11, v6}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1520
    return-void
.end method
