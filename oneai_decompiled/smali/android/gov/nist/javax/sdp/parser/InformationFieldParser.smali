.class public Landroid/gov/nist/javax/sdp/parser/InformationFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "InformationFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "informationField"    # Ljava/lang/String;

    .line 43
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 44
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/InformationFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 45
    return-void
.end method


# virtual methods
.method public informationField()Landroid/gov/nist/javax/sdp/fields/InformationField;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 49
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/InformationFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x69

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 50
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/InformationFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 51
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/InformationFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 52
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/InformationFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 54
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/InformationField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/InformationField;-><init>()V

    .line 55
    .local v0, "informationField":Landroid/gov/nist/javax/sdp/fields/InformationField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/InformationFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "rest":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/InformationField;->setInformation(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    return-object v0

    .line 59
    .end local v0    # "informationField":Landroid/gov/nist/javax/sdp/fields/InformationField;
    .end local v1    # "rest":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/text/ParseException;

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/InformationFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/InformationFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v3

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 65
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/InformationFieldParser;->informationField()Landroid/gov/nist/javax/sdp/fields/InformationField;

    move-result-object v0

    return-object v0
.end method
