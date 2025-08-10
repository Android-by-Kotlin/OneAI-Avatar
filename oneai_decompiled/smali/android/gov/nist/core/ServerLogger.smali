.class public interface abstract Landroid/gov/nist/core/ServerLogger;
.super Ljava/lang/Object;
.source "ServerLogger.java"

# interfaces
.implements Landroid/gov/nist/core/LogLevels;


# virtual methods
.method public abstract closeLogFile()V
.end method

.method public abstract logException(Ljava/lang/Exception;)V
.end method

.method public abstract logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
.end method

.method public abstract logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V
.end method

.method public abstract logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;ZJ)V
.end method

.method public abstract setSipStack(Landroid/javax/sip/SipStack;)V
.end method

.method public abstract setStackProperties(Ljava/util/Properties;)V
.end method
