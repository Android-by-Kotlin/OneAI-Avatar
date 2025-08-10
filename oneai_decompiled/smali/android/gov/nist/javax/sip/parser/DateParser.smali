.class public Landroid/gov/nist/javax/sip/parser/DateParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "DateParser.java"


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
    .param p1, "date"    # Ljava/lang/String;

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

    .line 57
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/DateParser;->debug:Z

    const-string v1, "DateParser.parse"

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/DateParser;->dbg_enter(Ljava/lang/String;)V

    .line 60
    :cond_0
    const/16 v0, 0x820

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/DateParser;->headerName(I)V

    .line 61
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/DateParser;->wkday()I

    .line 62
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/DateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x2c

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 63
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/DateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 64
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/DateParser;->date()Ljava/util/Calendar;

    move-result-object v0

    .line 65
    .local v0, "cal":Ljava/util/Calendar;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/DateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 66
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/DateParser;->time(Ljava/util/Calendar;)V

    .line 67
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/DateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 68
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/DateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->ttoken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "tzone":Ljava/lang/String;
    const-string/jumbo v3, "gmt"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 71
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/DateParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 72
    new-instance v3, Landroid/gov/nist/javax/sip/header/SIPDateHeader;

    invoke-direct {v3}, Landroid/gov/nist/javax/sip/header/SIPDateHeader;-><init>()V

    .line 73
    .local v3, "retval":Landroid/gov/nist/javax/sip/header/SIPDateHeader;
    invoke-virtual {v3, v0}, Landroid/gov/nist/javax/sip/header/SIPDateHeader;->setDate(Ljava/util/Calendar;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    nop

    .line 76
    sget-boolean v4, Landroid/gov/nist/javax/sip/parser/DateParser;->debug:Z

    if-eqz v4, :cond_1

    .line 77
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/DateParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v3

    .line 70
    .end local v3    # "retval":Landroid/gov/nist/javax/sip/header/SIPDateHeader;
    :cond_2
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad Time Zone "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/DateParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v3

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    .end local v0    # "cal":Ljava/util/Calendar;
    .end local v2    # "tzone":Ljava/lang/String;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/DateParser;->debug:Z

    if-eqz v2, :cond_3

    .line 77
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/DateParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    throw v0
.end method
