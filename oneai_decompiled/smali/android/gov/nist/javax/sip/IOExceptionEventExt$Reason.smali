.class public final enum Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;
.super Ljava/lang/Enum;
.source "IOExceptionEventExt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/IOExceptionEventExt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Reason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

.field public static final enum KeepAliveTimeout:Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 32
    new-instance v0, Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    const-string v1, "KeepAliveTimeout"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;->KeepAliveTimeout:Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    sget-object v0, Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;->KeepAliveTimeout:Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    filled-new-array {v0}, [Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;->$VALUES:[Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 32
    const-class v0, Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    return-object v0
.end method

.method public static values()[Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;
    .locals 1

    .line 32
    sget-object v0, Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;->$VALUES:[Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    invoke-virtual {v0}, [Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    return-object v0
.end method
