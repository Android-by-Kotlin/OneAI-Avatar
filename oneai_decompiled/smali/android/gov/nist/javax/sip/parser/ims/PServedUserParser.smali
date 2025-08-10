.class public Landroid/gov/nist/javax/sip/parser/ims/PServedUserParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "PServedUserParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 44
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "servedUser"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

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

    .line 53
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PServedUserParser;->debug:Z

    const-string/jumbo v1, "PServedUser.parse"

    if-eqz v0, :cond_0

    .line 54
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PServedUserParser;->dbg_enter(Ljava/lang/String;)V

    .line 57
    :cond_0
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PServedUser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PServedUser;-><init>()V

    .line 58
    .local v0, "servedUser":Landroid/gov/nist/javax/sip/header/ims/PServedUser;
    const/16 v2, 0x85f

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PServedUserParser;->headerName(I)V

    .line 59
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    .line 60
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PServedUserParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    nop

    .line 64
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PServedUserParser;->debug:Z

    if-eqz v2, :cond_1

    .line 65
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PServedUserParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 64
    .end local v0    # "servedUser":Landroid/gov/nist/javax/sip/header/ims/PServedUser;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PServedUserParser;->debug:Z

    if-eqz v2, :cond_2

    .line 65
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PServedUserParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
