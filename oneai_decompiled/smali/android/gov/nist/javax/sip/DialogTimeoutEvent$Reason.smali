.class public final enum Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;
.super Ljava/lang/Enum;
.source "DialogTimeoutEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/DialogTimeoutEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Reason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

.field public static final enum AckNotReceived:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

.field public static final enum AckNotSent:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

.field public static final enum CannotAcquireAckSemaphoreForOk:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

.field public static final enum EarlyStateTimeout:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

.field public static final enum ReInviteTimeout:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 35
    new-instance v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    const-string v1, "AckNotReceived"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->AckNotReceived:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    new-instance v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    const-string v1, "AckNotSent"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->AckNotSent:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    new-instance v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    const-string/jumbo v1, "ReInviteTimeout"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->ReInviteTimeout:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    new-instance v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    const-string v1, "EarlyStateTimeout"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->EarlyStateTimeout:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    new-instance v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    const-string v1, "CannotAcquireAckSemaphoreForOk"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->CannotAcquireAckSemaphoreForOk:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    sget-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->AckNotReceived:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    sget-object v1, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->AckNotSent:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    sget-object v2, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->ReInviteTimeout:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    sget-object v3, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->EarlyStateTimeout:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    sget-object v4, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->CannotAcquireAckSemaphoreForOk:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    filled-new-array {v0, v1, v2, v3, v4}, [Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->$VALUES:[Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 35
    const-class v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    return-object v0
.end method

.method public static values()[Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;
    .locals 1

    .line 35
    sget-object v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->$VALUES:[Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    invoke-virtual {v0}, [Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    return-object v0
.end method
