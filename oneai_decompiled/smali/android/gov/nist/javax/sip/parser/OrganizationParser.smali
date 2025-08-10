.class public Landroid/gov/nist/javax/sip/parser/OrganizationParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "OrganizationParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 55
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "organization"    # Ljava/lang/String;

    .line 47
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 48
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
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/OrganizationParser;->debug:Z

    const-string v1, "OrganizationParser.parse"

    if-eqz v0, :cond_0

    .line 66
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/OrganizationParser;->dbg_enter(Ljava/lang/String;)V

    .line 67
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/Organization;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Organization;-><init>()V

    .line 69
    .local v0, "organization":Landroid/gov/nist/javax/sip/header/Organization;
    const/16 v2, 0x82d

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/OrganizationParser;->headerName(I)V

    .line 70
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/OrganizationParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v2

    .line 71
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/Organization;->setOrganization(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    nop

    .line 74
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/OrganizationParser;->debug:Z

    if-eqz v3, :cond_1

    .line 75
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/OrganizationParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 74
    .end local v2    # "value":Ljava/lang/String;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/OrganizationParser;->debug:Z

    if-eqz v3, :cond_2

    .line 75
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/OrganizationParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v2
.end method
