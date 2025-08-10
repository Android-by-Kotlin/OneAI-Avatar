.class public Landroid/gov/nist/javax/sip/parser/RSeqParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "RSeqParser.java"


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
    .param p1, "rseq"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 50
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

    .line 67
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/RSeqParser;->debug:Z

    const-string/jumbo v1, "RSeqParser.parse"

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/RSeqParser;->dbg_enter(Ljava/lang/String;)V

    .line 69
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/RSeq;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RSeq;-><init>()V

    .line 71
    .local v0, "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    const/16 v2, 0x83c

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/RSeqParser;->headerName(I)V

    .line 73
    const-string/jumbo v2, "RSeq"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/RSeq;->setHeaderName(Ljava/lang/String;)V

    .line 75
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/RSeqParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    .local v2, "number":Ljava/lang/String;
    :try_start_1
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Landroid/gov/nist/javax/sip/header/RSeq;->setSeqNumber(J)V
    :try_end_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    nop

    .line 81
    :try_start_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RSeqParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 83
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RSeqParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 85
    nop

    .line 87
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/RSeqParser;->debug:Z

    if-eqz v3, :cond_1

    .line 88
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/RSeqParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 78
    :catch_0
    move-exception v3

    .line 79
    .local v3, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_3
    invoke-virtual {v3}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/RSeqParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 87
    .end local v2    # "number":Ljava/lang/String;
    .end local v3    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/RSeqParser;->debug:Z

    if-eqz v3, :cond_2

    .line 88
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/RSeqParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v2
.end method
