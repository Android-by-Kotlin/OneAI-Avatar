.class public interface abstract Landroid/gov/nist/javax/sip/header/ParametersExt;
.super Ljava/lang/Object;
.source "ParametersExt.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;


# virtual methods
.method public abstract getParameter(Ljava/lang/String;Z)Ljava/lang/String;
.end method

.method public abstract setQuotedParameter(Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
