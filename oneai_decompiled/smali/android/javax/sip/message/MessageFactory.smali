.class public interface abstract Landroid/javax/sip/message/MessageFactory;
.super Ljava/lang/Object;
.source "MessageFactory.java"


# virtual methods
.method public abstract createRequest(Landroid/javax/sip/address/URI;Ljava/lang/String;Landroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;)Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createRequest(Landroid/javax/sip/address/URI;Ljava/lang/String;Landroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;Landroid/javax/sip/header/ContentTypeHeader;Ljava/lang/Object;)Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createRequest(Landroid/javax/sip/address/URI;Ljava/lang/String;Landroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;Landroid/javax/sip/header/ContentTypeHeader;[B)Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createRequest(Ljava/lang/String;)Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createResponse(ILandroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;)Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createResponse(ILandroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;Landroid/javax/sip/header/ContentTypeHeader;Ljava/lang/Object;)Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createResponse(ILandroid/javax/sip/header/CallIdHeader;Landroid/javax/sip/header/CSeqHeader;Landroid/javax/sip/header/FromHeader;Landroid/javax/sip/header/ToHeader;Ljava/util/List;Landroid/javax/sip/header/MaxForwardsHeader;Landroid/javax/sip/header/ContentTypeHeader;[B)Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createResponse(ILandroid/javax/sip/message/Request;)Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createResponse(ILandroid/javax/sip/message/Request;Landroid/javax/sip/header/ContentTypeHeader;Ljava/lang/Object;)Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createResponse(ILandroid/javax/sip/message/Request;Landroid/javax/sip/header/ContentTypeHeader;[B)Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createResponse(Ljava/lang/String;)Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
