.class public abstract Landroid/gov/nist/javax/sdp/parser/SDPParser;
.super Landroid/gov/nist/core/ParserCore;
.source "SDPParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Landroid/gov/nist/core/ParserCore;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
