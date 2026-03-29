#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define PRECISION highp
#else
	#define PRECISION mediump
#endif

extern PRECISION vec2 hyped;

extern PRECISION number dissolve;
extern PRECISION number time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;

vec4 RGB(vec4 c);
vec4 HSL(vec4 c);

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv);

#define iterations 4
#define formuparam2 0.89
#define volsteps 10
#define stepsize 0.190
#define zoom_factor 3.900
#define tile_size 0.450
#define speed2 0.010
#define brightness 0.2
#define darkmatter 0.400
#define distfading 0.560
#define saturation 0.400
#define transverseSpeed 1.1
#define cloud_strength 0.2

float triangle(float x, float a) {
    return 2.0 * abs(3.0 * ((x / a) - floor((x / a) + 0.5))) - 1.0;
}

float cloud_field(in vec3 p, float t) {
    float strength = 7.0 + 0.03 * log(1.e-6 + fract(sin(t) * 4373.11));
    float accum = 0.;
    float prev = 0.;
    float tw = 0.;

    for (int i = 0; i < 6; ++i) {
        float mag = dot(p, p);
        p = abs(p) / mag + vec3(-.5, -.8 + 0.1 * sin(t * 0.2 + 2.0), -1.1 + 0.3 * cos(t * 0.15));
        float w = exp(-float(i) / 7.);
        accum += w * exp(-strength * pow(abs(mag - prev), 2.3));
        tw += w;
        prev = mag;
    }
    return max(0., 5. * accum / tw - .7);
}

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec2 uv = (((texture_coords) * (image_details)) - texture_details.xy * texture_details.zw) / texture_details.zw;
    vec4 pixel = Texel(texture, texture_coords);

    float t = time + hyped.r * 0.001;

    vec2 uvs = (uv - 0.5) * 2.0;

    float speed = 0.005 * cos(t * 0.02 + 3.1415926 / 4.0);
    float formuparam = formuparam2;

    float a_xz = 0.9;
    float a_yz = -0.6;
    float a_xy = 0.9 + t * 0.04;

    mat2 rot_xz = mat2(cos(a_xz), sin(a_xz), -sin(a_xz), cos(a_xz));
    mat2 rot_yz = mat2(cos(a_yz), sin(a_yz), -sin(a_yz), cos(a_yz));
    mat2 rot_xy = mat2(cos(a_xy), sin(a_xy), -sin(a_xy), cos(a_xy));

    vec3 dir = vec3(uvs * zoom_factor, 1.);
    vec3 from = vec3(0.0);

    from.x -= 5.0 * 0.5;
    from.y -= 5.0 * 0.5;

    vec3 forward = vec3(0., 0., 1.);

    from.x += transverseSpeed * cos(0.01 * t) + 0.001 * t;
    from.y += transverseSpeed * sin(0.01 * t) + 0.001 * t;
    from.z += 0.003 * t;

    dir.xy *= rot_xy;
    forward.xy *= rot_xy;
    dir.xz *= rot_xz;
    forward.xz *= rot_xz;
    dir.yz *= rot_yz;
    forward.yz *= rot_yz;

    from.xy *= -rot_xy;
    from.xz *= rot_xz;
    from.yz *= rot_yz;

    float zooom = (t - 3311.) * speed;
    from += forward * zooom;
    float sampleShift = mod(zooom, stepsize);
    float zoffset = -sampleShift;
    sampleShift /= stepsize;

    float s = 0.24;
    float s3 = s + stepsize / 2.0;
    vec3 v = vec3(0.);
    float t3 = 0.0;
    vec3 backCol2 = vec3(0.);

    for (int r = 0; r < volsteps; r++) {
        vec3 p2 = from + (s + zoffset) * dir;
        vec3 p3 = (from + (s3 + zoffset) * dir) * (1.9 / zoom_factor);

        p2 = abs(vec3(tile_size) - mod(p2, vec3(tile_size * 2.)));
        p3 = abs(vec3(tile_size) - mod(p3, vec3(tile_size * 2.)));

        t3 = cloud_field(p3, t);

        float pa = 0.;
        float a = 0.;
        for (int i = 0; i < iterations; i++) {
            p2 = abs(p2) / dot(p2, p2) - formuparam;
            float D = abs(length(p2) - pa);
            if (i > 2) {
                a += i > 7 ? min(12., D) : D;
            }
            pa = length(p2);
        }

        a *= a * a;
        float s1 = s + zoffset;
        float fade = pow(distfading, max(0., float(r) - sampleShift));

        v += fade;

        if (r == 0)
            fade *= (1. - sampleShift);
        if (r == volsteps - 1)
            fade *= sampleShift;

        v += vec3(s1, s1 * s1, s1 * s1 * s1 * s1) * a * brightness * fade;
        backCol2 += mix(.4, 1., 1.0) * vec3(0.20 * t3 * t3 * t3, 0.4 * t3 * t3, t3 * 0.7) * fade;

        s += stepsize;
        s3 += stepsize;
    }

    v = mix(vec3(length(v)), v, saturation);
    vec3 starColor = v * 0.01 + backCol2 * cloud_strength;

    vec4 blended = pixel;
    blended.rgb = mix(pixel.rgb, pixel.rgb * (starColor + 0.5), 0.45);
    blended.rgb = mix(blended.rgb, starColor, 0.2);

    colour.rgb = mix(colour.rgb, starColor, 0.15);

    return dissolve_mask(blended * colour, texture_coords, uv);
}

number hue(number s, number t, number h)
{
    number hs = mod(h, 1.) * 6.;
    if (hs < 1.) return (t-s)*hs + s;
    if (hs < 3.) return t;
    if (hs < 4.) return (t-s)*(4.-hs) + s;
    return s;
}

vec4 RGB(vec4 c)
{
    if (c.y < 0.0001)
        return vec4(vec3(c.z), c.a);
    number t = (c.z < .5) ? c.y*c.z + c.z : -c.y*c.z + (c.y+c.z);
    number s = 2.0*c.z - t;
    return vec4(hue(s,t,c.x+1./3.), hue(s,t,c.x), hue(s,t,c.x-1./3.), c.w);
}

vec4 HSL(vec4 c)
{
    number low   = min(c.r, min(c.g, c.b));
    number high  = max(c.r, max(c.g, c.b));
    number delta = high - low;
    number sum   = high + low;
    vec4 hsl = vec4(.0, .0, .5*sum, c.a);
    if (delta == .0) return hsl;
    hsl.y = (hsl.z < .5) ? delta/sum : delta/(2.0-sum);
    if      (high == c.r) hsl.x = (c.g-c.b)/delta;
    else if (high == c.g) hsl.x = (c.b-c.r)/delta + 2.0;
    else                  hsl.x = (c.r-c.g)/delta + 4.0;
    hsl.x = mod(hsl.x/6., 1.);
    return hsl;
}

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, shadow ? tex.a*0.3 : tex.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01;

    float t = time * 10.0 + 2003.;
    vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);

    vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t/143.6340), cos(-t/99.4324));
    vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t/53.1532),  cos( t/61.4532));
    vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t/87.53218), sin(-t/49.0000));

    float field = (1.+(
        cos(length(field_part1)/19.483) + sin(length(field_part2)/33.155)*cos(field_part2.y/15.73) +
        cos(length(field_part3)/27.193)*sin(field_part3.x/21.92)))/2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5*cos((adjusted_dissolve)/82.612 + (field+-.5)*3.14))
        - (floored_uv.x > borders.y ? (floored_uv.x-borders.y)*(5.+5.*dissolve) : 0.)*(dissolve)
        - (floored_uv.y > borders.y ? (floored_uv.y-borders.y)*(5.+5.*dissolve) : 0.)*(dissolve)
        - (floored_uv.x < borders.x ? (borders.x-floored_uv.x)*(5.+5.*dissolve) : 0.)*(dissolve)
        - (floored_uv.y < borders.x ? (borders.x-floored_uv.y)*(5.+5.*dissolve) : 0.)*(dissolve);

    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            tex.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.3 : tex.a) : .0);
}

extern PRECISION vec2 mouse_screen_pos;
extern PRECISION float hovering;
extern PRECISION float screen_scale;

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    if (hovering <= 0.){
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);
    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif
