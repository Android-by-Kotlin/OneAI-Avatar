.class public final Landroid/javax/sip/DialogState;
.super Ljava/lang/Object;
.source "DialogState.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final COMPLETED:Landroid/javax/sip/DialogState;

.field public static final CONFIRMED:Landroid/javax/sip/DialogState;

.field public static final EARLY:Landroid/javax/sip/DialogState;

.field public static final TERMINATED:Landroid/javax/sip/DialogState;

.field public static final _COMPLETED:I = 0x2

.field public static final _CONFIRMED:I = 0x1

.field public static final _EARLY:I = 0x0

.field public static final _TERMINATED:I = 0x3

.field private static m_dialogStateArray:[Landroid/javax/sip/DialogState;

.field private static m_size:I


# instance fields
.field private m_dialogState:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 151
    const/4 v0, 0x4

    sput v0, Landroid/javax/sip/DialogState;->m_size:I

    .line 152
    sget v0, Landroid/javax/sip/DialogState;->m_size:I

    new-array v0, v0, [Landroid/javax/sip/DialogState;

    sput-object v0, Landroid/javax/sip/DialogState;->m_dialogStateArray:[Landroid/javax/sip/DialogState;

    .line 164
    new-instance v0, Landroid/javax/sip/DialogState;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/javax/sip/DialogState;-><init>(I)V

    sput-object v0, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    .line 176
    new-instance v0, Landroid/javax/sip/DialogState;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/javax/sip/DialogState;-><init>(I)V

    sput-object v0, Landroid/javax/sip/DialogState;->CONFIRMED:Landroid/javax/sip/DialogState;

    .line 190
    new-instance v0, Landroid/javax/sip/DialogState;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/javax/sip/DialogState;-><init>(I)V

    sput-object v0, Landroid/javax/sip/DialogState;->COMPLETED:Landroid/javax/sip/DialogState;

    .line 202
    new-instance v0, Landroid/javax/sip/DialogState;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/javax/sip/DialogState;-><init>(I)V

    sput-object v0, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    return-void
.end method

.method private constructor <init>(I)V
    .locals 2
    .param p1, "dialogState"    # I

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput p1, p0, Landroid/javax/sip/DialogState;->m_dialogState:I

    .line 54
    sget-object v0, Landroid/javax/sip/DialogState;->m_dialogStateArray:[Landroid/javax/sip/DialogState;

    iget v1, p0, Landroid/javax/sip/DialogState;->m_dialogState:I

    aput-object p0, v0, v1

    .line 55
    return-void
.end method

.method public static getObject(I)Landroid/javax/sip/DialogState;
    .locals 2
    .param p0, "dialogState"    # I

    .line 64
    if-ltz p0, :cond_0

    sget v0, Landroid/javax/sip/DialogState;->m_size:I

    if-ge p0, v0, :cond_0

    .line 65
    sget-object v0, Landroid/javax/sip/DialogState;->m_dialogStateArray:[Landroid/javax/sip/DialogState;

    aget-object v0, v0, p0

    return-object v0

    .line 67
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid dialogState value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readResolve()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .line 94
    sget-object v0, Landroid/javax/sip/DialogState;->m_dialogStateArray:[Landroid/javax/sip/DialogState;

    iget v1, p0, Landroid/javax/sip/DialogState;->m_dialogState:I

    aget-object v0, v0, v1

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .line 107
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 109
    :cond_0
    instance-of v1, p1, Landroid/javax/sip/DialogState;

    if-eqz v1, :cond_1

    move-object v1, p1

    check-cast v1, Landroid/javax/sip/DialogState;

    iget v1, v1, Landroid/javax/sip/DialogState;->m_dialogState:I

    iget v2, p0, Landroid/javax/sip/DialogState;->m_dialogState:I

    if-ne v1, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getValue()I
    .locals 1

    .line 77
    iget v0, p0, Landroid/javax/sip/DialogState;->m_dialogState:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 119
    iget v0, p0, Landroid/javax/sip/DialogState;->m_dialogState:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 128
    const-string v0, ""

    .line 129
    .local v0, "text":Ljava/lang/String;
    iget v1, p0, Landroid/javax/sip/DialogState;->m_dialogState:I

    packed-switch v1, :pswitch_data_0

    .line 143
    const-string v0, "Error while printing Dialog State"

    goto :goto_0

    .line 140
    :pswitch_0
    const-string/jumbo v0, "Terminated Dialog"

    .line 141
    goto :goto_0

    .line 137
    :pswitch_1
    const-string v0, "Completed Dialog"

    .line 138
    goto :goto_0

    .line 134
    :pswitch_2
    const-string v0, "Confirmed Dialog"

    .line 135
    goto :goto_0

    .line 131
    :pswitch_3
    const-string v0, "Early Dialog"

    .line 132
    nop

    .line 146
    :goto_0
    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
