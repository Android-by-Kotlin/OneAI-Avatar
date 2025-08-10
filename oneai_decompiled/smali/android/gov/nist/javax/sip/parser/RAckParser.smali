.class public Landroid/gov/nist/javax/sip/parser/RAckParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "RAckParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 60
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "rack"    # Ljava/lang/String;

    .line 52
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 53
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

    .line 70
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/RAckParser;->debug:Z

    const-string/jumbo v1, "RAckParser.parse"

    if-eqz v0, :cond_0

    .line 71
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/RAckParser;->dbg_enter(Ljava/lang/String;)V

    .line 72
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/RAck;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RAck;-><init>()V

    .line 74
    .local v0, "rack":Landroid/gov/nist/javax/sip/header/RAck;
    const/16 v2, 0x83d

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/RAckParser;->headerName(I)V

    .line 76
    const-string/jumbo v2, "RAck"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/RAck;->setHeaderName(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    :try_start_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/RAckParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v2

    .line 80
    .local v2, "number":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Landroid/gov/nist/javax/sip/header/RAck;->setRSequenceNumber(J)V

    .line 81
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RAckParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 82
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RAckParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v3

    move-object v2, v3

    .line 83
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Landroid/gov/nist/javax/sip/header/RAck;->setCSequenceNumber(J)V

    .line 84
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RAckParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 85
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RAckParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xfff

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 86
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RAckParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 87
    .local v3, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/header/RAck;->setMethod(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    .end local v2    # "number":Ljava/lang/String;
    .end local v3    # "token":Landroid/gov/nist/core/Token;
    nop

    .line 92
    :try_start_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/RAckParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 93
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/RAckParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 95
    nop

    .line 97
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/RAckParser;->debug:Z

    if-eqz v2, :cond_1

    .line 98
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/RAckParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 89
    :catch_0
    move-exception v2

    .line 90
    .local v2, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_3
    invoke-virtual {v2}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/RAckParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v3

    .end local v0    # "rack":Landroid/gov/nist/javax/sip/header/RAck;
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 97
    .end local v2    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "rack":Landroid/gov/nist/javax/sip/header/RAck;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/RAckParser;->debug:Z

    if-eqz v3, :cond_2

    .line 98
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/RAckParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v2
.end method
