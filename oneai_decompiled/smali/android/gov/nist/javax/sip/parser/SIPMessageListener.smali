.class public interface abstract Landroid/gov/nist/javax/sip/parser/SIPMessageListener;
.super Ljava/lang/Object;
.source "SIPMessageListener.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;


# virtual methods
.method public abstract processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract sendSingleCLRF()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
