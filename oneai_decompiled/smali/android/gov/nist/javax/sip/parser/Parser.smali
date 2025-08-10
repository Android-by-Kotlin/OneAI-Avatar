.class public abstract Landroid/gov/nist/javax/sip/parser/Parser;
.super Landroid/gov/nist/core/ParserCore;
.source "Parser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Landroid/gov/nist/core/ParserCore;-><init>()V

    return-void
.end method

.method public static final checkToken(Ljava/lang/String;)V
    .locals 3
    .param p0, "token"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 114
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_2

    .line 118
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 119
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Landroid/gov/nist/core/LexerCore;->isTokenChar(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 118
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 120
    :cond_0
    new-instance v1, Ljava/text/ParseException;

    const-string v2, "Invalid character(s) in string (not allowed in \'token\')"

    invoke-direct {v1, v2, v0}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 124
    .end local v0    # "i":I
    :cond_1
    return-void

    .line 115
    :cond_2
    new-instance v0, Ljava/text/ParseException;

    const-string/jumbo v1, "null or empty token"

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method


# virtual methods
.method protected createParseException(Ljava/lang/String;)Ljava/text/ParseException;
    .locals 3
    .param p1, "exceptionString"    # Ljava/lang/String;

    .line 45
    new-instance v0, Ljava/text/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/Parser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/Parser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v2

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method

.method protected getLexer()Landroid/gov/nist/javax/sip/parser/Lexer;
    .locals 1

    .line 51
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/Parser;->lexer:Landroid/gov/nist/core/LexerCore;

    check-cast v0, Landroid/gov/nist/javax/sip/parser/Lexer;

    return-object v0
.end method

.method protected method()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 78
    const-string/jumbo v0, "method"

    :try_start_0
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/Parser;->debug:Z

    if-eqz v1, :cond_0

    .line 79
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/Parser;->dbg_enter(Ljava/lang/String;)V

    .line 80
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Parser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->peekNextToken(I)[Landroid/gov/nist/core/Token;

    move-result-object v1

    .line 81
    .local v1, "tokens":[Landroid/gov/nist/core/Token;
    const/4 v2, 0x0

    aget-object v2, v1, v2

    .line 82
    .local v2, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v3

    const/16 v4, 0x805

    if-eq v3, v4, :cond_2

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v3

    const/16 v4, 0x806

    if-eq v3, v4, :cond_2

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v3

    const/16 v4, 0x808

    if-eq v3, v4, :cond_2

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v3

    const/16 v4, 0x807

    if-eq v3, v4, :cond_2

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v3

    const/16 v4, 0x804

    if-eq v3, v4, :cond_2

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v3

    const/16 v4, 0x809

    if-eq v3, v4, :cond_2

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v3

    const/16 v4, 0x835

    if-eq v3, v4, :cond_2

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v3

    const/16 v4, 0x836

    if-eq v3, v4, :cond_2

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v3

    const/16 v4, 0x843

    if-eq v3, v4, :cond_2

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v3

    const/16 v4, 0x846

    if-eq v3, v4, :cond_2

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v3

    const/16 v4, 0xfff

    if-ne v3, v4, :cond_1

    goto :goto_0

    .line 96
    :cond_1
    const-string v3, "Invalid Method"

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/Parser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v3

    throw v3

    .line 93
    :cond_2
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/Parser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->consume()V

    .line 94
    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    sget-boolean v4, Landroid/gov/nist/core/Debug;->debug:Z

    if-eqz v4, :cond_3

    .line 100
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/Parser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v3

    .line 99
    .end local v1    # "tokens":[Landroid/gov/nist/core/Token;
    .end local v2    # "token":Landroid/gov/nist/core/Token;
    :catchall_0
    move-exception v1

    sget-boolean v2, Landroid/gov/nist/core/Debug;->debug:Z

    if-eqz v2, :cond_4

    .line 100
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/Parser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method

.method protected sipVersion()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 55
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/Parser;->debug:Z

    const-string/jumbo v1, "sipVersion"

    if-eqz v0, :cond_0

    .line 56
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/Parser;->dbg_enter(Ljava/lang/String;)V

    .line 58
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/Parser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x803

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    move-result-object v0

    .line 59
    .local v0, "tok":Landroid/gov/nist/core/Token;
    invoke-virtual {v0}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "SIP"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 60
    const-string v2, "Expecting SIP"

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/Parser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    .line 61
    :cond_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/Parser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 62
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/Parser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xfff

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    move-result-object v2

    move-object v0, v2

    .line 63
    invoke-virtual {v0}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v2

    const-string v3, "2.0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 64
    const-string v2, "Expecting SIP/2.0"

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/Parser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    .line 66
    :cond_2
    const-string/jumbo v2, "SIP/2.0"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/Parser;->debug:Z

    if-eqz v3, :cond_3

    .line 69
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/Parser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v2

    .line 68
    .end local v0    # "tok":Landroid/gov/nist/core/Token;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/Parser;->debug:Z

    if-eqz v2, :cond_4

    .line 69
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/Parser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v0
.end method
