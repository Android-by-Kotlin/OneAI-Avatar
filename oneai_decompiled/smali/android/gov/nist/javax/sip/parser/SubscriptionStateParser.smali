.class public Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "SubscriptionStateParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 57
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "subscriptionState"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 50
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 67
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->debug:Z

    const-string/jumbo v1, "SubscriptionStateParser.parse"

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->dbg_enter(Ljava/lang/String;)V

    .line 70
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/SubscriptionState;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/SubscriptionState;-><init>()V

    .line 72
    .local v0, "subscriptionState":Landroid/gov/nist/javax/sip/header/SubscriptionState;
    const/16 v2, 0x838

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->headerName(I)V

    .line 74
    const-string/jumbo v2, "Subscription-State"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/SubscriptionState;->setHeaderName(Ljava/lang/String;)V

    .line 77
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xfff

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 78
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 79
    .local v2, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/SubscriptionState;->setState(Ljava/lang/String;)V

    .line 81
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v4, 0x3b

    if-ne v3, v4, :cond_4

    .line 82
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 83
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 87
    const/16 v3, 0x3d

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->nameValue(C)Landroid/gov/nist/core/NameValue;

    move-result-object v3

    .line 88
    .local v3, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "reason"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 89
    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/header/SubscriptionState;->setReasonCode(Ljava/lang/String;)V

    goto :goto_1

    .line 90
    :cond_1
    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "expires"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_2

    .line 92
    :try_start_1
    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 93
    .local v4, "expires":I
    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/header/SubscriptionState;->setExpires(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 98
    .end local v4    # "expires":I
    goto :goto_1

    .line 96
    :catch_0
    move-exception v4

    .line 97
    .local v4, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_2
    invoke-virtual {v4}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "subscriptionState":Landroid/gov/nist/javax/sip/header/SubscriptionState;
    throw v5

    .line 94
    .end local v4    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "subscriptionState":Landroid/gov/nist/javax/sip/header/SubscriptionState;
    :catch_1
    move-exception v4

    .line 95
    .local v4, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "subscriptionState":Landroid/gov/nist/javax/sip/header/SubscriptionState;
    throw v5

    .line 99
    .end local v4    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "subscriptionState":Landroid/gov/nist/javax/sip/header/SubscriptionState;
    :cond_2
    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "retry-after"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v4, :cond_3

    .line 101
    :try_start_3
    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 102
    .local v4, "retryAfter":I
    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/header/SubscriptionState;->setRetryAfter(I)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 107
    .end local v4    # "retryAfter":I
    goto :goto_1

    .line 105
    :catch_2
    move-exception v4

    .line 106
    .local v4, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_4
    invoke-virtual {v4}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "subscriptionState":Landroid/gov/nist/javax/sip/header/SubscriptionState;
    throw v5

    .line 103
    .end local v4    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "subscriptionState":Landroid/gov/nist/javax/sip/header/SubscriptionState;
    :catch_3
    move-exception v4

    .line 104
    .local v4, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "subscriptionState":Landroid/gov/nist/javax/sip/header/SubscriptionState;
    throw v5

    .line 109
    .end local v4    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "subscriptionState":Landroid/gov/nist/javax/sip/header/SubscriptionState;
    :cond_3
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/SubscriptionState;->setParameter(Landroid/gov/nist/core/NameValue;)V

    .line 111
    :goto_1
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 112
    .end local v3    # "nv":Landroid/gov/nist/core/NameValue;
    goto/16 :goto_0

    .line 114
    .end local v2    # "token":Landroid/gov/nist/core/Token;
    :cond_4
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->debug:Z

    if-eqz v2, :cond_5

    .line 115
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->dbg_leave(Ljava/lang/String;)V

    .line 118
    :cond_5
    return-object v0

    .line 114
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->debug:Z

    if-eqz v3, :cond_6

    .line 115
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    throw v2
.end method
