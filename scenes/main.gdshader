shader_type spatial;

uniform float amplitude : hint_range(0.0, 1.0) = 0.2;
uniform float speed = 1.5;
uniform float frequency = 2.0;

void vertex() {
    float t = TIME * speed;

    float wave =
        sin(VERTEX.x * frequency + t) +
        cos(VERTEX.z * frequency + t);

    VERTEX.y += wave ;
}
