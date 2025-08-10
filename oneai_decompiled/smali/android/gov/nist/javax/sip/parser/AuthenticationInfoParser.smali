.class public Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "AuthenticationInfoParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 56
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "authenticationInfo"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 49
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 66
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->debug:Z

    const-string v1, "AuthenticationInfoParser.parse"

    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->dbg_enter(Ljava/lang/String;)V

    .line 70
    :cond_0
    const/16 v0, 0x840

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->headerName(I)V

    .line 72
    new-instance v0, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;-><init>()V

    .line 73
    .local v0, "authenticationInfo":Landroid/gov/nist/javax/sip/header/AuthenticationInfo;
    const-string v2, "Authentication-Info"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setHeaderName(Ljava/lang/String;)V

    .line 76
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 78
    invoke-super {p0}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->nameValue()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    .line 79
    .local v2, "nv":Landroid/gov/nist/core/NameValue;
    const-string v3, ""

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->isValueQuoted()Z

    move-result v3

    if-nez v3, :cond_1

    .line 80
    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setScheme(Ljava/lang/String;)V

    .line 81
    invoke-super {p0}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->nameValue()Landroid/gov/nist/core/NameValue;

    move-result-object v3

    move-object v2, v3

    .line 83
    :cond_1
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setParameter(Landroid/gov/nist/core/NameValue;)V

    .line 84
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 85
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v4, 0x2c

    if-ne v3, v4, :cond_2

    .line 86
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 87
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 89
    invoke-super {p0}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->nameValue()Landroid/gov/nist/core/NameValue;

    move-result-object v3

    move-object v2, v3

    .line 90
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setParameter(Landroid/gov/nist/core/NameValue;)V

    .line 91
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    goto :goto_0

    .line 93
    :cond_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 94
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    nop

    .line 98
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->debug:Z

    if-eqz v3, :cond_3

    .line 99
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 98
    .end local v0    # "authenticationInfo":Landroid/gov/nist/javax/sip/header/AuthenticationInfo;
    .end local v2    # "nv":Landroid/gov/nist/core/NameValue;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->debug:Z

    if-eqz v2, :cond_4

    .line 99
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v0
.end method
