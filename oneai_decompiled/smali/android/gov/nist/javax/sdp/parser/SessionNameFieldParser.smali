.class public Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "SessionNameFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "sessionNameField"    # Ljava/lang/String;

    .line 43
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 44
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 45
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 7
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 74
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "s=SDP Seminar \n"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "s= Session SDP\n"

    aput-object v2, v0, v1

    .line 76
    .local v0, "session":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 77
    new-instance v2, Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;

    aget-object v3, v0, v1

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;-><init>(Ljava/lang/String;)V

    .line 79
    .local v2, "sessionNameFieldParser":Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;->sessionNameField()Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    move-result-object v3

    .line 81
    .local v3, "sessionNameField":Landroid/gov/nist/javax/sdp/fields/SessionNameField;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "encoded: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/SessionNameField;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 76
    .end local v2    # "sessionNameFieldParser":Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;
    .end local v3    # "sessionNameField":Landroid/gov/nist/javax/sdp/fields/SessionNameField;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 83
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 70
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;->sessionNameField()Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    move-result-object v0

    return-object v0
.end method

.method public sessionNameField()Landroid/gov/nist/javax/sdp/fields/SessionNameField;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 52
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x73

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 53
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 54
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 55
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 57
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/SessionNameField;-><init>()V

    .line 58
    .local v0, "sessionNameField":Landroid/gov/nist/javax/sdp/fields/SessionNameField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "rest":Ljava/lang/String;
    if-nez v1, :cond_0

    const-string v2, ""

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/SessionNameField;->setSessionName(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    return-object v0

    .line 63
    .end local v0    # "sessionNameField":Landroid/gov/nist/javax/sdp/fields/SessionNameField;
    .end local v1    # "rest":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/SessionNameFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->createParseException()Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method
