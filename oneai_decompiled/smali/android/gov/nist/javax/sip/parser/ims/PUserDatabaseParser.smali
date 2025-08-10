.class public Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "PUserDatabaseParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 68
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "databaseName"    # Ljava/lang/String;

    .line 59
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method private parseheader(Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;)V
    .locals 3
    .param p1, "userDatabase"    # Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .local v0, "dbname":Ljava/lang/StringBuilder;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x3c

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 98
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 100
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getNextChar()C

    move-result v1

    .line 101
    .local v1, "next":C
    const/16 v2, 0x3e

    if-eq v1, v2, :cond_0

    const/16 v2, 0xa

    if-eq v1, v2, :cond_0

    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 106
    .end local v1    # "next":C
    :cond_0
    goto :goto_0

    .line 107
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;->setDatabaseName(Ljava/lang/String;)V

    .line 108
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 110
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 73
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->debug:Z

    const-string/jumbo v1, "PUserDatabase.parse"

    if-eqz v0, :cond_0

    .line 74
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->dbg_enter(Ljava/lang/String;)V

    .line 77
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x85d    # 3.0E-42f

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 79
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x3a

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 80
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 82
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;-><init>()V

    .line 83
    .local v0, "userDatabase":Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;
    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->parseheader(Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    nop

    .line 88
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->debug:Z

    if-eqz v2, :cond_1

    .line 89
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 88
    .end local v0    # "userDatabase":Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->debug:Z

    if-eqz v2, :cond_2

    .line 89
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
