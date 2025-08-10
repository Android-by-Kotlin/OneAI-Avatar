.class public Landroid/gov/nist/javax/sdp/parser/URIFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "URIFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "uriField"    # Ljava/lang/String;

    .line 50
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 51
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/URIFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 52
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

    .line 74
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/URIFieldParser;->uriField()Landroid/gov/nist/javax/sdp/fields/URIField;

    move-result-object v0

    return-object v0
.end method

.method public uriField()Landroid/gov/nist/javax/sdp/fields/URIField;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 59
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/URIFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x75

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 60
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/URIFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 61
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/URIFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 62
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/URIFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 64
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/URIField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/URIField;-><init>()V

    .line 65
    .local v0, "uriField":Landroid/gov/nist/javax/sdp/fields/URIField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/URIFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "rest":Ljava/lang/String;
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/URIField;->setURI(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    return-object v0

    .line 68
    .end local v0    # "uriField":Landroid/gov/nist/javax/sdp/fields/URIField;
    .end local v1    # "rest":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/URIFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->createParseException()Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method
