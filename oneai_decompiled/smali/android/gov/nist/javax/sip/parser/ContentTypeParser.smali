.class public Landroid/gov/nist/javax/sip/parser/ContentTypeParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "ContentTypeParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 53
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "contentType"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

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

    .line 58
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentType;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ContentType;-><init>()V

    .line 59
    .local v0, "contentType":Landroid/gov/nist/javax/sip/header/ContentType;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->debug:Z

    const-string v2, "ContentTypeParser.parse"

    if-eqz v1, :cond_0

    .line 60
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->dbg_enter(Ljava/lang/String;)V

    .line 63
    :cond_0
    const/16 v1, 0x826

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->headerName(I)V

    .line 66
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xfff

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 67
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v1

    .line 68
    .local v1, "type":Landroid/gov/nist/core/Token;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 69
    invoke-virtual {v1}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/header/ContentType;->setContentType(Ljava/lang/String;)V

    .line 72
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0x2f

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 73
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 74
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 75
    .local v3, "subType":Landroid/gov/nist/core/Token;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 76
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/header/ContentType;->setContentSubType(Ljava/lang/String;)V

    .line 77
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 78
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    nop

    .end local v1    # "type":Landroid/gov/nist/core/Token;
    .end local v3    # "subType":Landroid/gov/nist/core/Token;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->debug:Z

    if-eqz v1, :cond_1

    .line 81
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->dbg_leave(Ljava/lang/String;)V

    .line 83
    :cond_1
    return-object v0

    .line 80
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->debug:Z

    if-eqz v3, :cond_2

    .line 81
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v1
.end method
