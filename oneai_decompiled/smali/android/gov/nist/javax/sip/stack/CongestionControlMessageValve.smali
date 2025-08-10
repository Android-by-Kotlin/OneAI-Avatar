.class public Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;
.super Ljava/lang/Object;
.source "CongestionControlMessageValve.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SIPMessageValve;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected dropResponseStatus:I

.field protected serverTransactionTableHighwaterMark:I

.field protected sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 57
    const-class v0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 101
    sget-object v0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Destorying the congestion control valve "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 103
    return-void
.end method

.method public init(Landroid/javax/sip/SipStack;)V
    .locals 4
    .param p1, "stack"    # Landroid/javax/sip/SipStack;

    .line 106
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 107
    sget-object v0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "Initializing congestion control valve"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 108
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getConfigurationProperties()Ljava/util/Properties;

    move-result-object v0

    const-string/jumbo v1, "android.gov.nist.javax.sip.MAX_SERVER_TRANSACTIONS"

    const-string v2, "10000"

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, "serverTransactionsString":Ljava/lang/String;
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, v0}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->serverTransactionTableHighwaterMark:I

    .line 110
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->getConfigurationProperties()Ljava/util/Properties;

    move-result-object v1

    const-string v2, "DROP_RESPONSE_STATUS"

    const-string v3, "503"

    invoke-virtual {v1, v2, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, "dropResponseStatusString":Ljava/lang/String;
    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v1}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->dropResponseStatus:I

    .line 112
    return-void
.end method

.method public processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Z
    .locals 8
    .param p1, "request"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "messageChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 66
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "requestMethod":Ljava/lang/String;
    const-string v1, "BYE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_1

    const-string v1, "ACK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "PRACK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "CANCEL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v3

    .line 75
    .local v1, "undropableMethod":Z
    :goto_1
    if-nez v1, :cond_4

    .line 76
    iget v4, p0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->serverTransactionTableHighwaterMark:I

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/SipStackImpl;->getServerTransactionTableSize()I

    move-result v5

    if-gt v4, v5, :cond_4

    .line 78
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getToTag()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 79
    return v3

    .line 81
    :cond_2
    iget v3, p0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->dropResponseStatus:I

    if-lez v3, :cond_3

    .line 82
    iget v3, p0, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->dropResponseStatus:I

    invoke-virtual {p1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v3

    .line 84
    .local v3, "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :try_start_0
    invoke-virtual {p2, v3}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    goto :goto_2

    .line 85
    :catch_0
    move-exception v4

    .line 86
    .local v4, "e":Ljava/io/IOException;
    sget-object v5, Landroid/gov/nist/javax/sip/stack/CongestionControlMessageValve;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to send congestion control error response"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 89
    .end local v3    # "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v4    # "e":Ljava/io/IOException;
    :cond_3
    :goto_2
    return v2

    .line 92
    :cond_4
    return v3
.end method

.method public processResponse(Landroid/javax/sip/message/Response;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Z
    .locals 1
    .param p1, "response"    # Landroid/javax/sip/message/Response;
    .param p2, "messageChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 97
    const/4 v0, 0x1

    return v0
.end method
