.class public Landroid/gov/nist/javax/sip/parser/StringMsgParserFactory;
.super Ljava/lang/Object;
.source "StringMsgParserFactory.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/MessageParserFactory;


# static fields
.field private static msgParser:Landroid/gov/nist/javax/sip/parser/StringMsgParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    new-instance v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;-><init>()V

    sput-object v0, Landroid/gov/nist/javax/sip/parser/StringMsgParserFactory;->msgParser:Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;
    .locals 1
    .param p1, "stack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 46
    sget-object v0, Landroid/gov/nist/javax/sip/parser/StringMsgParserFactory;->msgParser:Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    return-object v0
.end method
