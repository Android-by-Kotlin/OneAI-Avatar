.class public Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "PAccessNetworkInfoParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 98
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "accessNetwork"    # Ljava/lang/String;

    .line 92
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 94
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 106
    const-string v0, "\""

    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->debug:Z

    const-string v2, "AccessNetworkInfoParser.parse"

    if-eqz v1, :cond_0

    .line 107
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->dbg_enter(Ljava/lang/String;)V

    .line 109
    :cond_0
    const/16 v1, 0x84f

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->headerName(I)V

    .line 110
    new-instance v1, Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;-><init>()V

    .line 111
    .local v1, "accessNetworkInfo":Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;
    const-string/jumbo v3, "P-Access-Network-Info"

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;->setHeaderName(Ljava/lang/String;)V

    .line 113
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 114
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xfff

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 115
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 116
    .local v3, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;->setAccessType(Ljava/lang/String;)V

    .line 118
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 119
    :goto_0
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v4

    const/16 v5, 0x3b

    if-ne v4, v5, :cond_2

    .line 120
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 121
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    const/16 v4, 0x3d

    :try_start_1
    invoke-super {p0, v4}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->nameValue(C)Landroid/gov/nist/core/NameValue;

    move-result-object v4

    .line 125
    .local v4, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;->setParameter(Landroid/gov/nist/core/NameValue;)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 137
    .end local v4    # "nv":Landroid/gov/nist/core/NameValue;
    goto :goto_2

    .line 126
    :catch_0
    move-exception v4

    .line 127
    .local v4, "e":Ljava/text/ParseException;
    :try_start_2
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 128
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->quotedString()Ljava/lang/String;

    move-result-object v5

    .line 129
    .local v5, "ext":Ljava/lang/String;
    if-nez v5, :cond_1

    .line 130
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->ttokenGenValue()Ljava/lang/String;

    move-result-object v6

    move-object v5, v6

    goto :goto_1

    .line 134
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object v5, v6

    .line 136
    :goto_1
    invoke-virtual {v1, v5}, Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;->setExtensionAccessInfo(Ljava/lang/Object;)V

    .line 138
    .end local v4    # "e":Ljava/text/ParseException;
    .end local v5    # "ext":Ljava/lang/String;
    :goto_2
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    goto :goto_0

    .line 140
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 141
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xa

    invoke-virtual {v0, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 144
    nop

    .line 146
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->debug:Z

    if-eqz v0, :cond_3

    .line 147
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v1

    .line 146
    .end local v1    # "accessNetworkInfo":Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;
    .end local v3    # "token":Landroid/gov/nist/core/Token;
    :catchall_0
    move-exception v0

    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->debug:Z

    if-eqz v1, :cond_4

    .line 147
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v0
.end method
