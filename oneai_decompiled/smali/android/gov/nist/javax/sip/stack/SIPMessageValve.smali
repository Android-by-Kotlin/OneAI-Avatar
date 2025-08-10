.class public interface abstract Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
.super Ljava/lang/Object;
.source "SIPMessageValve.java"


# virtual methods
.method public abstract destroy()V
.end method

.method public abstract init(Landroid/javax/sip/SipStack;)V
.end method

.method public abstract processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Z
.end method

.method public abstract processResponse(Landroid/javax/sip/message/Response;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Z
.end method
