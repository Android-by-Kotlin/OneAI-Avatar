package max.ohm.oneai.imageediting.network

import retrofit2.http.Body
import retrofit2.http.POST

interface FaceGenApiService {
    @POST("api/v6/image_editing/face_gen")
    suspend fun generateFace(
        @Body request: FaceGenRequest
    ): FaceGenResponse
}
