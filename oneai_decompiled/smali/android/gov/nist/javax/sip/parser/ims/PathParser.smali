.class public Landroid/gov/nist/javax/sip/parser/ims/PathParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "PathParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 57
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;

    .line 52
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

    .line 54
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

    .line 72
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PathList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PathList;-><init>()V

    .line 74
    .local v0, "pathList":Landroid/gov/nist/javax/sip/header/ims/PathList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->debug:Z

    const-string/jumbo v2, "PathParser.parse"

    if-eqz v1, :cond_0

    .line 75
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->dbg_enter(Ljava/lang/String;)V

    .line 78
    :cond_0
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x847

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 79
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 80
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x3a

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 81
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 83
    :goto_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/ims/Path;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/ims/Path;-><init>()V

    .line 84
    .local v1, "path":Landroid/gov/nist/javax/sip/header/ims/Path;
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    .line 85
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ims/PathList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 86
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 87
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    .line 88
    .local v3, "la":C
    const/16 v4, 0x2c

    if-ne v3, v4, :cond_1

    .line 89
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 90
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    .end local v1    # "path":Landroid/gov/nist/javax/sip/header/ims/Path;
    .end local v3    # "la":C
    goto :goto_0

    .line 91
    .restart local v1    # "path":Landroid/gov/nist/javax/sip/header/ims/Path;
    .restart local v3    # "la":C
    :cond_1
    const/16 v4, 0xa

    if-ne v3, v4, :cond_3

    .line 92
    nop

    .line 96
    .end local v1    # "path":Landroid/gov/nist/javax/sip/header/ims/Path;
    .end local v3    # "la":C
    nop

    .line 98
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->debug:Z

    if-eqz v1, :cond_2

    .line 99
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    return-object v0

    .line 94
    .restart local v1    # "path":Landroid/gov/nist/javax/sip/header/ims/Path;
    .restart local v3    # "la":C
    :cond_3
    :try_start_1
    const-string/jumbo v4, "unexpected char"

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "pathList":Landroid/gov/nist/javax/sip/header/ims/PathList;
    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 98
    .end local v1    # "path":Landroid/gov/nist/javax/sip/header/ims/Path;
    .end local v3    # "la":C
    .restart local v0    # "pathList":Landroid/gov/nist/javax/sip/header/ims/PathList;
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->debug:Z

    if-eqz v3, :cond_4

    .line 99
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PathParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method
