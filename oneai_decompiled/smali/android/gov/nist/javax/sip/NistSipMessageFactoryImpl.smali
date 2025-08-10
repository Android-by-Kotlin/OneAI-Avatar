.class Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;
.super Ljava/lang/Object;
.source "NistSipMessageFactoryImpl.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/StackMessageFactory;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 55
    const-class v0, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    .locals 0
    .param p1, "sipStackImpl"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    iput-object p1, p0, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 142
    return-void
.end method


# virtual methods
.method public newSIPServerRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    .locals 5
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "sipTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 70
    if-eqz p2, :cond_2

    if-eqz p1, :cond_2

    .line 74
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    .line 75
    .local v0, "theStack":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    new-instance v1, Landroid/gov/nist/javax/sip/DialogFilter;

    invoke-direct {v1, v0}, Landroid/gov/nist/javax/sip/DialogFilter;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 79
    .local v1, "retval":Landroid/gov/nist/javax/sip/DialogFilter;
    iput-object p2, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 80
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getListeningPoint()Landroid/gov/nist/javax/sip/ListeningPointImpl;

    move-result-object v2

    iput-object v2, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 82
    iget-object v2, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    if-nez v2, :cond_0

    .line 83
    const/4 v2, 0x0

    return-object v2

    .line 84
    :cond_0
    sget-object v2, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 85
    sget-object v2, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Returning request interface for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " sipTransaction = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 89
    :cond_1
    return-object v1

    .line 71
    .end local v0    # "theStack":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .end local v1    # "retval":Landroid/gov/nist/javax/sip/DialogFilter;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Null Arg!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public newSIPServerResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    .locals 5
    .param p1, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;
    .param p2, "msgChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 104
    iget-object v0, p0, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v0

    .line 105
    .local v0, "tr":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    sget-object v1, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 106
    sget-object v1, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Found Transaction "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 109
    :cond_0
    if-eqz v0, :cond_4

    .line 114
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getInternalState()I

    move-result v1

    const/4 v3, 0x0

    if-gez v1, :cond_2

    .line 115
    sget-object v1, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 116
    sget-object v1, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Dropping response - null transaction state"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 118
    :cond_1
    return-object v3

    .line 120
    :cond_2
    const/4 v1, 0x3

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getInternalState()I

    move-result v4

    if-ne v1, v4, :cond_4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v1

    div-int/lit8 v1, v1, 0x64

    const/4 v4, 0x1

    if-ne v1, v4, :cond_4

    .line 122
    sget-object v1, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 123
    sget-object v1, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Dropping response - late arriving "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 126
    :cond_3
    return-object v3

    .line 130
    :cond_4
    new-instance v1, Landroid/gov/nist/javax/sip/DialogFilter;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-direct {v1, v2}, Landroid/gov/nist/javax/sip/DialogFilter;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 132
    .local v1, "retval":Landroid/gov/nist/javax/sip/DialogFilter;
    iput-object v0, v1, Landroid/gov/nist/javax/sip/DialogFilter;->transactionChannel:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 134
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getListeningPoint()Landroid/gov/nist/javax/sip/ListeningPointImpl;

    move-result-object v2

    iput-object v2, v1, Landroid/gov/nist/javax/sip/DialogFilter;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 136
    return-object v1
.end method
