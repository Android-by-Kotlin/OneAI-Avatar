.class public Landroid/gov/nist/javax/sip/parser/ReplyToParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "ReplyToParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 55
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "replyTo"    # Ljava/lang/String;

    .line 47
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

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

    .line 64
    new-instance v0, Landroid/gov/nist/javax/sip/header/ReplyTo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ReplyTo;-><init>()V

    .line 65
    .local v0, "replyTo":Landroid/gov/nist/javax/sip/header/ReplyTo;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ReplyToParser;->debug:Z

    const-string/jumbo v2, "ReplyTo.parse"

    if-eqz v1, :cond_0

    .line 66
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ReplyToParser;->dbg_enter(Ljava/lang/String;)V

    .line 69
    :cond_0
    const/16 v1, 0x83a

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ReplyToParser;->headerName(I)V

    .line 71
    const-string/jumbo v1, "Reply-To"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ReplyTo;->setHeaderName(Ljava/lang/String;)V

    .line 73
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    nop

    .line 77
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ReplyToParser;->debug:Z

    if-eqz v1, :cond_1

    .line 78
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ReplyToParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 77
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ReplyToParser;->debug:Z

    if-eqz v3, :cond_2

    .line 78
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ReplyToParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v1
.end method
