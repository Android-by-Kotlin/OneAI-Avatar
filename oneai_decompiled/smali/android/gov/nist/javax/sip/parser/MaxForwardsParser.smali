.class public Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "MaxForwardsParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "contentLength"    # Ljava/lang/String;

    .line 44
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 45
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

    .line 52
    const-string v0, "MaxForwardsParser.leave"

    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->debug:Z

    if-eqz v1, :cond_0

    .line 53
    const-string v1, "MaxForwardsParser.enter"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->dbg_enter(Ljava/lang/String;)V

    .line 55
    :cond_0
    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/MaxForwards;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/MaxForwards;-><init>()V

    .line 56
    .local v1, "contentLength":Landroid/gov/nist/javax/sip/header/MaxForwards;
    const/16 v2, 0x81f

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->headerName(I)V

    .line 57
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v2

    .line 58
    .local v2, "number":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/header/MaxForwards;->setMaxForwards(I)V

    .line 59
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 60
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    nop

    .line 67
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->debug:Z

    if-eqz v3, :cond_1

    .line 68
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v1

    .line 67
    .end local v1    # "contentLength":Landroid/gov/nist/javax/sip/header/MaxForwards;
    .end local v2    # "number":Ljava/lang/String;
    :catchall_0
    move-exception v1

    goto :goto_0

    .line 64
    :catch_0
    move-exception v1

    .line 65
    .local v1, "ex":Ljava/lang/NumberFormatException;
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v2

    throw v2

    .line 62
    .end local v1    # "ex":Ljava/lang/NumberFormatException;
    :catch_1
    move-exception v1

    .line 63
    .local v1, "ex":Landroid/javax/sip/InvalidArgumentException;
    invoke-virtual {v1}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v2

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    .end local v1    # "ex":Landroid/javax/sip/InvalidArgumentException;
    :goto_0
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->debug:Z

    if-eqz v2, :cond_2

    .line 68
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v1
.end method
