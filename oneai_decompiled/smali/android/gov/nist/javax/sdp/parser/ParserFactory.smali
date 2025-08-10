.class public Landroid/gov/nist/javax/sdp/parser/ParserFactory;
.super Ljava/lang/Object;
.source "ParserFactory.java"


# static fields
.field private static constructorArgs:[Ljava/lang/Class; = null

.field private static final packageName:Ljava/lang/String; = "android.gov.nist.javax.sdp.parser"

.field private static parserTable:Ljava/util/Hashtable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 58
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    sput-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->constructorArgs:[Ljava/lang/Class;

    .line 59
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->constructorArgs:[Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljava/lang/String;

    aput-object v2, v0, v1

    .line 60
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    .line 61
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string v1, "AttributeFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "a"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string v1, "BandwidthFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "b"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string v1, "ConnectionFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "c"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string v1, "EmailFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "e"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string v1, "InformationFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "i"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string v1, "KeyFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "k"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string v1, "MediaFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "m"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string v1, "OriginFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "o"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string/jumbo v1, "PhoneFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "p"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string/jumbo v1, "ProtoVersionFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "v"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string/jumbo v1, "RepeatFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "r"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string/jumbo v1, "SessionNameFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "s"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string/jumbo v1, "TimeFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "t"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string/jumbo v1, "URIFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "u"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    const-string/jumbo v1, "ZoneFieldParser"

    invoke-static {v1}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->getParser(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "z"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createParser(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/parser/SDPParser;
    .locals 6
    .param p0, "field"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 79
    invoke-static {p0}, Landroid/gov/nist/javax/sdp/parser/Lexer;->getFieldName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, "fieldName":Ljava/lang/String;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 81
    return-object v1

    .line 82
    :cond_0
    sget-object v2, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->parserTable:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 84
    .local v2, "parserClass":Ljava/lang/Class;
    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 87
    :try_start_0
    sget-object v4, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->constructorArgs:[Ljava/lang/Class;

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 88
    .local v4, "cons":Ljava/lang/reflect/Constructor;
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    .line 89
    .local v5, "args":[Ljava/lang/Object;
    aput-object p0, v5, v3

    .line 90
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sdp/parser/SDPParser;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v3

    .line 91
    .local v1, "retval":Landroid/gov/nist/javax/sdp/parser/SDPParser;
    return-object v1

    .line 93
    .end local v1    # "retval":Landroid/gov/nist/javax/sdp/parser/SDPParser;
    .end local v4    # "cons":Ljava/lang/reflect/Constructor;
    .end local v5    # "args":[Ljava/lang/Object;
    :catch_0
    move-exception v3

    .line 94
    .local v3, "ex":Ljava/lang/Exception;
    invoke-static {v3}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 95
    return-object v1

    .line 98
    .end local v3    # "ex":Ljava/lang/Exception;
    :cond_1
    new-instance v1, Ljava/text/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not find parser for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method private static getParser(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p0, "parserClass"    # Ljava/lang/String;

    .line 48
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "android.gov.nist.javax.sdp.parser."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Could not find class"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 51
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    .line 52
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 53
    const/4 v1, 0x0

    return-object v1
.end method
