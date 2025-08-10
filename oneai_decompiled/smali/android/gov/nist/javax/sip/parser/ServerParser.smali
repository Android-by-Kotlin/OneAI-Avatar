.class public Landroid/gov/nist/javax/sip/parser/ServerParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "ServerParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 56
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "server"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 49
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

    .line 66
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ServerParser;->debug:Z

    const-string/jumbo v1, "ServerParser.parse"

    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ServerParser;->dbg_enter(Ljava/lang/String;)V

    .line 68
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/Server;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Server;-><init>()V

    .line 70
    .local v0, "server":Landroid/gov/nist/javax/sip/header/Server;
    const/16 v2, 0x812

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ServerParser;->headerName(I)V

    .line 71
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ServerParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v4, 0xa

    if-eq v2, v4, :cond_5

    .line 76
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ServerParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    if-eq v2, v4, :cond_3

    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ServerParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    if-eqz v2, :cond_3

    .line 77
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ServerParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v5, 0x28

    if-ne v2, v5, :cond_1

    .line 78
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ServerParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->comment()Ljava/lang/String;

    move-result-object v2

    .line 79
    .local v2, "comment":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x29

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/header/Server;->addProductToken(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .end local v2    # "comment":Ljava/lang/String;
    goto :goto_0

    .line 82
    :cond_1
    const/4 v2, 0x0

    .line 84
    .local v2, "marker":I
    :try_start_1
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/ServerParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->markInputPosition()I

    move-result v5

    move v2, v5

    .line 85
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/ServerParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v6, 0x2f

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->getString(C)Ljava/lang/String;

    move-result-object v5

    .line 87
    .local v5, "tok":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v4, :cond_2

    .line 88
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    move-object v5, v6

    .line 89
    :cond_2
    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/header/Server;->addProductToken(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 95
    nop

    .line 96
    .end local v2    # "marker":I
    .end local v5    # "tok":Ljava/lang/String;
    goto :goto_0

    .line 90
    .restart local v2    # "marker":I
    :catch_0
    move-exception v3

    .line 91
    .local v3, "ex":Ljava/text/ParseException;
    :try_start_2
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ServerParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v2}, Landroid/gov/nist/core/LexerCore;->rewindInputPosition(I)V

    .line 92
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ServerParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 93
    .local v4, "tok":Ljava/lang/String;
    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/header/Server;->addProductToken(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 94
    nop

    .line 100
    .end local v2    # "marker":I
    .end local v3    # "ex":Ljava/text/ParseException;
    .end local v4    # "tok":Ljava/lang/String;
    :cond_3
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ServerParser;->debug:Z

    if-eqz v2, :cond_4

    .line 101
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ServerParser;->dbg_leave(Ljava/lang/String;)V

    .line 104
    :cond_4
    return-object v0

    .line 72
    :cond_5
    :try_start_3
    const-string/jumbo v2, "empty header"

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ServerParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v2

    .end local v0    # "server":Landroid/gov/nist/javax/sip/header/Server;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 100
    .restart local v0    # "server":Landroid/gov/nist/javax/sip/header/Server;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ServerParser;->debug:Z

    if-eqz v3, :cond_6

    .line 101
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ServerParser;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    throw v2
.end method
