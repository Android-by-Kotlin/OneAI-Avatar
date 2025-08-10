.class public Landroid/gov/nist/javax/sip/parser/AddressParser;
.super Landroid/gov/nist/javax/sip/parser/Parser;
.source "AddressParser.java"


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 2
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 40
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/Parser;-><init>()V

    .line 41
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 42
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const-string/jumbo v1, "charLexer"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->selectLexer(Ljava/lang/String;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "address"    # Ljava/lang/String;

    .line 45
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/Parser;-><init>()V

    .line 46
    new-instance v0, Landroid/gov/nist/javax/sip/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sip/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 47
    return-void
.end method


# virtual methods
.method public address(Z)Landroid/gov/nist/javax/sip/address/AddressImpl;
    .locals 8
    .param p1, "inclParams"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 93
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/AddressParser;->debug:Z

    const-string/jumbo v1, "address"

    if-eqz v0, :cond_0

    .line 94
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;->dbg_enter(Ljava/lang/String;)V

    .line 95
    :cond_0
    const/4 v0, 0x0

    .line 97
    .local v0, "retval":Landroid/gov/nist/javax/sip/address/AddressImpl;
    const/4 v2, 0x0

    .line 98
    .local v2, "k":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v3

    const/16 v4, 0x2f

    const/16 v5, 0x3a

    const/16 v6, 0x22

    const/16 v7, 0x3c

    if-eqz v3, :cond_3

    .line 99
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    .line 100
    .local v3, "la":C
    if-eq v3, v7, :cond_3

    if-eq v3, v6, :cond_3

    if-eq v3, v5, :cond_3

    if-ne v3, v4, :cond_1

    .line 104
    goto :goto_1

    .line 105
    :cond_1
    if-eqz v3, :cond_2

    .line 108
    nop

    .end local v3    # "la":C
    add-int/lit8 v2, v2, 0x1

    .line 109
    goto :goto_0

    .line 106
    .restart local v3    # "la":C
    :cond_2
    const-string/jumbo v4, "unexpected EOL"

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/AddressParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "retval":Landroid/gov/nist/javax/sip/address/AddressImpl;
    .end local p1    # "inclParams":Z
    throw v4

    .line 110
    .end local v3    # "la":C
    .restart local v0    # "retval":Landroid/gov/nist/javax/sip/address/AddressImpl;
    .restart local p1    # "inclParams":Z
    :cond_3
    :goto_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    .line 111
    .restart local v3    # "la":C
    if-eq v3, v7, :cond_7

    if-ne v3, v6, :cond_4

    goto :goto_3

    .line 113
    :cond_4
    if-eq v3, v5, :cond_6

    if-ne v3, v4, :cond_5

    goto :goto_2

    .line 120
    :cond_5
    const-string v4, "Bad address spec"

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/AddressParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "retval":Landroid/gov/nist/javax/sip/address/AddressImpl;
    .end local p1    # "inclParams":Z
    throw v4

    .line 114
    .restart local v0    # "retval":Landroid/gov/nist/javax/sip/address/AddressImpl;
    .restart local p1    # "inclParams":Z
    :cond_6
    :goto_2
    new-instance v4, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v4}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    move-object v0, v4

    .line 115
    new-instance v4, Landroid/gov/nist/javax/sip/parser/URLParser;

    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    check-cast v5, Landroid/gov/nist/javax/sip/parser/Lexer;

    invoke-direct {v4, v5}, Landroid/gov/nist/javax/sip/parser/URLParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 116
    .local v4, "uriParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    invoke-virtual {v4, p1}, Landroid/gov/nist/javax/sip/parser/URLParser;->uriReference(Z)Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v5

    .line 117
    .local v5, "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    const/4 v6, 0x2

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setAddressType(I)V

    .line 118
    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setURI(Landroid/javax/sip/address/URI;)V

    .line 119
    .end local v4    # "uriParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    .end local v5    # "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    goto :goto_4

    .line 112
    :cond_7
    :goto_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/AddressParser;->nameAddr()Landroid/gov/nist/javax/sip/address/AddressImpl;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v4

    .line 122
    :goto_4
    nop

    .line 124
    sget-boolean v4, Landroid/gov/nist/javax/sip/parser/AddressParser;->debug:Z

    if-eqz v4, :cond_8

    .line 125
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;->dbg_leave(Ljava/lang/String;)V

    :cond_8
    return-object v0

    .line 124
    .end local v2    # "k":I
    .end local v3    # "la":C
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AddressParser;->debug:Z

    if-eqz v3, :cond_9

    .line 125
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;->dbg_leave(Ljava/lang/String;)V

    :cond_9
    throw v2
.end method

.method protected nameAddr()Landroid/gov/nist/javax/sip/address/AddressImpl;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 50
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/AddressParser;->debug:Z

    const-string/jumbo v1, "nameAddr"

    if-eqz v0, :cond_0

    .line 51
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;->dbg_enter(Ljava/lang/String;)V

    .line 53
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v0

    const/16 v3, 0x3e

    const/16 v4, 0x3c

    const/4 v5, 0x1

    if-ne v0, v4, :cond_2

    .line 54
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 55
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const-string/jumbo v2, "sip_urlLexer"

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->selectLexer(Ljava/lang/String;)V

    .line 56
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 57
    new-instance v0, Landroid/gov/nist/javax/sip/parser/URLParser;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    check-cast v2, Landroid/gov/nist/javax/sip/parser/Lexer;

    invoke-direct {v0, v2}, Landroid/gov/nist/javax/sip/parser/URLParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 58
    .local v0, "uriParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/parser/URLParser;->uriReference(Z)Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v2

    .line 59
    .local v2, "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    new-instance v4, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v4}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    .line 60
    .local v4, "retval":Landroid/gov/nist/javax/sip/address/AddressImpl;
    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setAddressType(I)V

    .line 61
    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setURI(Landroid/javax/sip/address/URI;)V

    .line 62
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 63
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    nop

    .line 87
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AddressParser;->debug:Z

    if-eqz v3, :cond_1

    .line 88
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v4

    .line 66
    .end local v0    # "uriParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    .end local v2    # "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    .end local v4    # "retval":Landroid/gov/nist/javax/sip/address/AddressImpl;
    :cond_2
    :try_start_1
    new-instance v0, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    .line 67
    .local v0, "addr":Landroid/gov/nist/javax/sip/address/AddressImpl;
    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setAddressType(I)V

    .line 68
    const/4 v6, 0x0

    .line 69
    .local v6, "name":Ljava/lang/String;
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v7, 0x22

    if-ne v2, v7, :cond_3

    .line 70
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->quotedString()Ljava/lang/String;

    move-result-object v2

    .line 71
    .end local v6    # "name":Ljava/lang/String;
    .local v2, "name":Ljava/lang/String;
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    goto :goto_0

    .line 73
    .end local v2    # "name":Ljava/lang/String;
    .restart local v6    # "name":Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v4}, Landroid/gov/nist/core/LexerCore;->getNextToken(C)Ljava/lang/String;

    move-result-object v2

    .line 74
    .end local v6    # "name":Ljava/lang/String;
    .restart local v2    # "name":Ljava/lang/String;
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setDisplayName(Ljava/lang/String;)V

    .line 75
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 76
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 77
    new-instance v4, Landroid/gov/nist/javax/sip/parser/URLParser;

    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    check-cast v6, Landroid/gov/nist/javax/sip/parser/Lexer;

    invoke-direct {v4, v6}, Landroid/gov/nist/javax/sip/parser/URLParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 78
    .local v4, "uriParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/parser/URLParser;->uriReference(Z)Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v6

    .line 79
    .local v6, "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    new-instance v7, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v7}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    .line 80
    .local v7, "retval":Landroid/gov/nist/javax/sip/address/AddressImpl;
    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setAddressType(I)V

    .line 81
    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setURI(Landroid/javax/sip/address/URI;)V

    .line 82
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 83
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AddressParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    nop

    .line 87
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AddressParser;->debug:Z

    if-eqz v3, :cond_4

    .line 88
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    return-object v0

    .line 87
    .end local v0    # "addr":Landroid/gov/nist/javax/sip/address/AddressImpl;
    .end local v2    # "name":Ljava/lang/String;
    .end local v4    # "uriParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    .end local v6    # "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    .end local v7    # "retval":Landroid/gov/nist/javax/sip/address/AddressImpl;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/AddressParser;->debug:Z

    if-eqz v2, :cond_5

    .line 88
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    throw v0
.end method
