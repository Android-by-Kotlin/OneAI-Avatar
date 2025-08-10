.class public Landroid/gov/nist/javax/sip/parser/SubjectParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "SubjectParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 56
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "subject"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 49
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 65
    new-instance v0, Landroid/gov/nist/javax/sip/header/Subject;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Subject;-><init>()V

    .line 66
    .local v0, "subject":Landroid/gov/nist/javax/sip/header/Subject;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/SubjectParser;->debug:Z

    const-string/jumbo v2, "SubjectParser.parse"

    if-eqz v1, :cond_0

    .line 67
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/SubjectParser;->dbg_enter(Ljava/lang/String;)V

    .line 70
    :cond_0
    const/16 v1, 0x825

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/SubjectParser;->headerName(I)V

    .line 71
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/SubjectParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v1

    .line 72
    .local v1, "s":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/Subject;->setSubject(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .end local v1    # "s":Ljava/lang/String;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/SubjectParser;->debug:Z

    if-eqz v1, :cond_1

    .line 76
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/SubjectParser;->dbg_leave(Ljava/lang/String;)V

    .line 79
    :cond_1
    return-object v0

    .line 75
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/SubjectParser;->debug:Z

    if-eqz v3, :cond_2

    .line 76
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/SubjectParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v1
.end method
