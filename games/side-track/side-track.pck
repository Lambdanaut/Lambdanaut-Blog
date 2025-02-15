GDPC                                                                               <   res://.import/goal.png-d8026b4c83cd0c976a2c07258ba1a29e.stex�o      �       �W"$(>P��/]��W�<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stexs      U      -��`�0��x�5�[D   res://.import/jumpwav.wav-e01680f9e9996f30433632851c80a6d8.sample   ��      !/      ���'��L���(�t��@   res://.import/racer.png-6b8ce749c55c17bb106b008670728271.stex   p]             ���v*��m�\�����L   res://.import/tileset_testtiles.png-4cc50338b9fc63e5ec9b0c76dec8237b.stex    a            ��إٳ6T����   res://Goal-marking.tscn        �       4�1�r;$M�Rޗ��   res://Goal.tscn �      �      ��TaadͶ�ZH�JNT   res://Racer.tscn�	      l      !p�(���H x`���   res://World.tscn       jK      :l��Z�����i"��4�   res://art/racer.png.import  �^      �      �P|�M��f��R��kP0   res://art/testtiles/tileset_testtiles.png.import@l      �      �Q[� D"$Q!9�<{   res://default_env.tres   o      �       um�`�N��<*ỳ�8   res://goal.png.import   �p      �      ��@�O?����.B"   res://icon.png  ��      �      G1?��z�c��vN��   res://icon.png.import   p�      �      �����%��(#AB�   res://jumpwav.wav.import �      �      �kt����b�|�&���   res://project.binary��            �x<�SyI�n3M	���   res://scripts/Racer.gd.remap��      (       �N������[iχS�   res://scripts/Racer.gdc ��      �      �u�^0�%f���lN�    res://scripts/Terrain.gd.remap  �      *       �S�䪧̴0+w}   res://scripts/Terrain.gdc   ��      =      g��*0���^��+���   res://scripts/World.gd.remap@�      (       ^嬀]��Ǻrܧl   res://scripts/World.gdc ��      1      ��˛C�S���,p�ux    res://scripts/binheap.gd.remap  p�      *       !��W׽�ۧ��pN��   res://scripts/binheap.gdc   �      �      ��+I)�7̪    [gd_scene load_steps=2 format=2]

[ext_resource path="res://goal.png" type="Texture" id=1]

[node name="goal-marking" type="Sprite"]
position = Vector2( 0, -8 )
texture = ExtResource( 1 )
    [gd_scene load_steps=3 format=2]

[ext_resource path="res://goal.png" type="Texture" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 7, 8 )

[node name="Goal" type="KinematicBody2D"]

[node name="Sprite" type="Sprite" parent="."]
position = Vector2( 0, -8 )
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( -1, -8 )
shape = SubResource( 1 )
    [gd_scene load_steps=9 format=2]

[ext_resource path="res://art/racer.png" type="Texture" id=1]
[ext_resource path="res://scripts/Racer.gd" type="Script" id=2]

[sub_resource type="Shader" id=1]
code = "shader_type canvas_item;

uniform float blue = 1.0;

void vertex() {
  // Animate Sprite moving in big circle around its location
  //  VERTEX += vec2(cos(TIME), sin(TIME));
}

void fragment() {
    COLOR = texture(TEXTURE, UV);
    COLOR.g = abs(sin(TIME));
}"

[sub_resource type="ShaderMaterial" id=2]
shader = SubResource( 1 )
shader_param/blue = 1.0

[sub_resource type="RectangleShape2D" id=3]
extents = Vector2( 2, 7 )

[sub_resource type="Animation" id=4]
tracks/0/type = "value"
tracks/0/path = NodePath("Sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0 ),
"transitions": PoolRealArray( 1 ),
"update": 1,
"values": [ 3 ]
}

[sub_resource type="Animation" id=5]
length = 0.5
loop = true
step = 0.25
tracks/0/type = "value"
tracks/0/path = NodePath("Sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 0.25 ),
"transitions": PoolRealArray( 1, 1 ),
"update": 1,
"values": [ 1, 2 ]
}

[sub_resource type="Animation" id=6]
length = 0.001
tracks/0/type = "value"
tracks/0/path = NodePath("Sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0 ),
"transitions": PoolRealArray( 1 ),
"update": 1,
"values": [ 0 ]
}

[node name="Player" type="KinematicBody2D"]
collision/safe_margin = 0.01
script = ExtResource( 2 )

[node name="Sprite" type="Sprite" parent="."]
material = SubResource( 2 )
position = Vector2( 0, -8 )
texture = ExtResource( 1 )
hframes = 4
frame = 3

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 0, -7 )
shape = SubResource( 3 )

[node name="AnimationPlayer" type="AnimationPlayer" parent="."]
anims/Jump = SubResource( 4 )
anims/Run = SubResource( 5 )
anims/Stand = SubResource( 6 )
    [gd_scene load_steps=59 format=2]

[ext_resource path="res://art/testtiles/tileset_testtiles.png" type="Texture" id=2]
[ext_resource path="res://scripts/World.gd" type="Script" id=4]
[ext_resource path="res://scripts/Terrain.gd" type="Script" id=5]

[sub_resource type="ConvexPolygonShape2D" id=1]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=2]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=3]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=4]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=5]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=6]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=7]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=8]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=9]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=10]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=11]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=12]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=13]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=14]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=15]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=16]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=17]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=18]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=19]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=20]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=21]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=22]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=23]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=24]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=25]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=26]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=27]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=28]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=29]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=30]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=31]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=32]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=33]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=34]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=35]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=36]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=37]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=38]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=39]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=40]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=41]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=42]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=43]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=44]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=45]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=46]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=47]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=48]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=49]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=50]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=51]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=52]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=53]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="ConvexPolygonShape2D" id=54]
points = PoolVector2Array( 0, 0, 16, 0, 16, 16, 0, 16 )

[sub_resource type="TileSet" id=55]
0/name = "tileset_testtiles.png 0"
0/texture = ExtResource( 2 )
0/tex_offset = Vector2( 0, 0 )
0/modulate = Color( 1, 1, 1, 1 )
0/region = Rect2( 0, 0, 176, 80 )
0/tile_mode = 1
0/autotile/bitmask_mode = 1
0/autotile/bitmask_flags = [ Vector2( 0, 0 ), 432, Vector2( 0, 1 ), 438, Vector2( 0, 2 ), 54, Vector2( 0, 3 ), 48, Vector2( 1, 0 ), 504, Vector2( 1, 1 ), 511, Vector2( 1, 2 ), 63, Vector2( 1, 3 ), 56, Vector2( 2, 0 ), 216, Vector2( 2, 1 ), 219, Vector2( 2, 2 ), 27, Vector2( 2, 3 ), 24, Vector2( 3, 0 ), 144, Vector2( 3, 1 ), 146, Vector2( 3, 2 ), 18, Vector2( 3, 3 ), 16, Vector2( 4, 0 ), 176, Vector2( 4, 1 ), 182, Vector2( 4, 2 ), 434, Vector2( 4, 3 ), 50, Vector2( 4, 4 ), 178, Vector2( 5, 0 ), 248, Vector2( 5, 1 ), 255, Vector2( 5, 2 ), 507, Vector2( 5, 3 ), 59, Vector2( 5, 4 ), 251, Vector2( 6, 0 ), 440, Vector2( 6, 1 ), 447, Vector2( 6, 2 ), 510, Vector2( 6, 3 ), 62, Vector2( 6, 4 ), 446, Vector2( 7, 0 ), 152, Vector2( 7, 1 ), 155, Vector2( 7, 2 ), 218, Vector2( 7, 3 ), 26, Vector2( 7, 4 ), 154, Vector2( 8, 0 ), 184, Vector2( 8, 1 ), 191, Vector2( 8, 2 ), 506, Vector2( 8, 3 ), 58, Vector2( 8, 4 ), 186, Vector2( 9, 0 ), 443, Vector2( 9, 1 ), 254, Vector2( 9, 2 ), 442, Vector2( 9, 3 ), 190, Vector2( 10, 2 ), 250, Vector2( 10, 3 ), 187 ]
0/autotile/icon_coordinate = Vector2( 3, 3 )
0/autotile/tile_size = Vector2( 16, 16 )
0/autotile/spacing = 0
0/autotile/occluder_map = [  ]
0/autotile/navpoly_map = [  ]
0/autotile/priority_map = [  ]
0/autotile/z_index_map = [  ]
0/occluder_offset = Vector2( 0, 0 )
0/navigation_offset = Vector2( 0, 0 )
0/shape_offset = Vector2( 0, 0 )
0/shape_transform = Transform2D( 1, 0, 0, 1, 0, 0 )
0/shape = SubResource( 1 )
0/shape_one_way = false
0/shape_one_way_margin = 1.0
0/shapes = [ {
"autotile_coord": Vector2( 3, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 1 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 1, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 2 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 1, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 3 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 0, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 4 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 0, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 5 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 2, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 6 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 2, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 7 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 3, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 8 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 1, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 9 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 1, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 10 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 0, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 11 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 0, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 12 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 0, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 13 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 0, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 14 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 1, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 15 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 1, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 16 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 2, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 17 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 3, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 18 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 4, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 19 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 4, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 20 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 5, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 21 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 4, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 22 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 5, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 23 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 6, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 24 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 7, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 25 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 8, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 26 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 9, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 27 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 6, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 28 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 7, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 29 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 8, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 30 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 9, 1 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 31 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 4, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 32 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 5, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 33 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 6, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 34 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 7, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 35 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 8, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 36 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 9, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 37 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 10, 2 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 38 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 0, 3 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 39 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 1, 3 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 40 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 2, 3 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 41 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 3, 3 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 42 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 4, 3 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 43 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 5, 3 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 44 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 6, 3 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 45 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 7, 3 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 46 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 8, 3 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 47 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 9, 3 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 48 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 10, 3 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 49 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 8, 4 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 50 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 7, 4 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 51 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 6, 4 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 52 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 4, 4 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 53 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
}, {
"autotile_coord": Vector2( 5, 4 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 54 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
} ]
0/z_index = 0

[node name="World" type="Node2D"]
script = ExtResource( 4 )

[node name="Terrain" type="TileMap" parent="."]
position = Vector2( 0, -1 )
tile_set = SubResource( 55 )
cell_size = Vector2( 16, 16 )
format = 1
tile_data = PoolIntArray( -131073, 0, 0, -196608, 0, 2, -196589, 0, 0, -196588, 0, 2, -65537, 0, 65536, -131072, 0, 65538, -131053, 0, 65536, -131052, 0, 65538, -1, 0, 65536, -65536, 0, 131077, -65535, 0, 1, -65534, 0, 1, -65533, 0, 1, -65532, 0, 1, -65531, 0, 1, -65530, 0, 1, -65529, 0, 1, -65528, 0, 1, -65527, 0, 1, -65526, 0, 1, -65525, 0, 1, -65524, 0, 1, -65523, 0, 1, -65522, 0, 1, -65521, 0, 1, -65520, 0, 1, -65519, 0, 1, -65518, 0, 1, -65517, 0, 131078, -65516, 0, 65538, 65535, 0, 65536, 0, 0, 65541, 1, 0, 131073, 2, 0, 131073, 3, 0, 131073, 4, 0, 131073, 5, 0, 131073, 6, 0, 131073, 7, 0, 131073, 8, 0, 131073, 9, 0, 131073, 10, 0, 131073, 11, 0, 131073, 12, 0, 131073, 13, 0, 131073, 14, 0, 131073, 15, 0, 131073, 16, 0, 131073, 17, 0, 131073, 18, 0, 65542, 19, 0, 65537, 20, 0, 65538, 131071, 0, 65536, 65536, 0, 65538, 65554, 0, 65536, 65555, 0, 65537, 65556, 0, 65538, 196607, 0, 65536, 131072, 0, 65538, 131090, 0, 65536, 131091, 0, 65537, 131092, 0, 65538, 262143, 0, 65536, 196608, 0, 262149, 196609, 0, 196610, 196611, 0, 196611, 196613, 0, 196611, 196615, 0, 196611, 196617, 0, 196608, 196618, 0, 196609, 196619, 0, 196609, 196620, 0, 196609, 196621, 0, 196610, 196625, 0, 196608, 196626, 0, 196614, 196627, 0, 65542, 196628, 0, 65538, 327679, 0, 65536, 262144, 0, 65538, 262163, 0, 65536, 262164, 0, 65538, 393215, 0, 65536, 327680, 0, 65538, 327694, 0, 196611, 327698, 0, 196608, 327699, 0, 262150, 327700, 0, 65538, 458751, 0, 65536, 393216, 0, 65538, 393235, 0, 65536, 393236, 0, 65538, 524287, 0, 65536, 458752, 0, 65538, 458767, 0, 196611, 458771, 0, 65536, 458772, 0, 65538, 589823, 0, 65536, 524288, 0, 65538, 524291, 0, 3, 524293, 0, 196611, 524295, 0, 196608, 524296, 0, 196609, 524297, 0, 7, 524305, 0, 3, 524307, 0, 65536, 524308, 0, 65538, 655359, 0, 65536, 589824, 0, 65538, 589827, 0, 65539, 589833, 0, 65539, 589836, 0, 3, 589841, 0, 65539, 589843, 0, 65536, 589844, 0, 65538, 720895, 0, 65536, 655360, 0, 131077, 655361, 0, 1, 655362, 0, 1, 655363, 0, 131080, 655364, 0, 1, 655365, 0, 1, 655366, 0, 1, 655367, 0, 1, 655368, 0, 1, 655369, 0, 131080, 655370, 0, 1, 655371, 0, 1, 655372, 0, 131080, 655373, 0, 1, 655374, 0, 1, 655375, 0, 1, 655376, 0, 1, 655377, 0, 131080, 655378, 0, 1, 655379, 0, 131078, 655380, 0, 65538, 786431, 0, 131072, 720896, 0, 131073, 720897, 0, 131073, 720898, 0, 131073, 720899, 0, 131073, 720900, 0, 131073, 720901, 0, 131073, 720902, 0, 131073, 720903, 0, 131073, 720904, 0, 131073, 720905, 0, 131073, 720906, 0, 131073, 720907, 0, 131073, 720908, 0, 131073, 720909, 0, 131073, 720910, 0, 131073, 720911, 0, 131073, 720912, 0, 131073, 720913, 0, 131073, 720914, 0, 131073, 720915, 0, 131073, 720916, 0, 131074 )
script = ExtResource( 5 )
      GDST@                 PNG �PNG

   IHDR   @      ��y)   sRGB ���   �IDATX�ݖ�� D�M������0�M��d�("�*D�����OfsU���^"G� Z�@����dY�"i�{p. 0f���x�L-��$�������W�E��ٳxv(s$ԙ��W��M����*'|�� L��qUK�v=6 ס�5pzx�'��i�#0����'p?�gm]���KMa��,    IEND�B`�[remap]

importer="texture"
type="StreamTexture"
path="res://.import/racer.png-6b8ce749c55c17bb106b008670728271.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://art/racer.png"
dest_files=[ "res://.import/racer.png-6b8ce749c55c17bb106b008670728271.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
        GDST�   P              PNG �PNG

   IHDR   �   P   ����   sRGB ���  
�IDATx��]�NI�]m�C�3$ ŉ���/`�8sx%�XH��y��^p	�������"� ��Z��twUwuO���'�`g目����ojG�=������C�>|��{/���?��y;����!�V����h'�/J�u�~�:�&�j���?|VW�;�v�Ue�`�:����<�W0?>4�ch~m�k�CX_�������t-� ?�|����1��:S)r�97�~+���9�g-_�����?��b�!L[`z3w�O;�
<�݆��u�[��(ʗZ�~+�jm>��Z~�_=��_�����+�g��ܣSh(:@���\Ǐv�{���{��dCc��_�+�忥����8{[����=~�1x=���w/:�D�M��;WK��T�o����ʧ��m>�B��\���z��UL�~���|z�!��S.G��m�����D���V��������[���ZYחo����px|��?�U:p�c��L�FG_�z
o����^�zj�#4��e����n���M/��C|����Z�T)~_���ja�OT���b1��B8|݅Z>~�1� �mA|X_������D(��~_���.��E����?'�k �q)�5��
-�7��-��1)��,d.>�G;[�����ٷ&�_�_�/e��!���9\��O]_����8���V�;����[��9� ?��%�u�����>���R�[�܉�p9Q�}�R|� �g�I�I��[�BH��.P�c����������yr6�Z�}t:��aJ������9���v|_���`SCh����Nc��Ik�/ɷ�Oa����R�Rq9%�^S�6rgپ!
���R|��0���b�%����Z��27tV*0"d 9б���[!����~B��C\Jz��a��X_��i:��VO��ʯ�C�q���Y��j$D͛�'u�o���ߊ�z\z��w� �u�|&����ΤS� �;����߿�������{W<��ه e�+B��V�g�+b�
�'N��I����q=i������@�����,��s�8�������*!=/�����@J�����%� }�R�
>F���`o��S�+�n��o�S���`u�z���O� >>���ku���!����-?�?/a��=A�OO[�����'p;�1���WK �{qx!�%�ԀHz\��_�VƩFSA{��$遇B��'��m�MR��C���rj�C��oE�G�����8W!�3Q�V!O����9��Z���O��`����?�)}|�p%���`C�p��hz`#�����\ V�����V�)�]�H�?�e4��xͯ������N7Z���OoBI��~���?���o��s�R���F~�����c�?����M��o��ڐ����oz���T��z��Z���8�����g��Yx�~��_�X=��Ǖ����c�/�oz�H>�o�&?�UO;4�jn~�G��u��q�T=�����Ï��4?������X�[�6)zZI���<��(=�UϚ¯��)EC�\@�5|��6_��o��4_��C�y{[=='V6�O�|�T=�&?o��#��������w��7��WV�B R�����zV+�f~d+4z�g�b�[��O��|��k�y%�10+ϗ&i��.�F��}��?ߗ����:J�#���g-��������M=�!=�V=sx�鍁�A���_�&�<s�E��K{���c�#[����zND�������CSg�K�J޸� ��t��>>�q���<Ο��\�f��;�V`,�
�+~!�ӝ8^	|R�Ϋ���?�zh+���r䊟�~�*���^�<�]Ë�rR+���9ӫ���d/�5b^*]N>@�����?����o.Mm-����.ǷHq5�s�J����}7Χ'�ϑ�oz��|��!H�O'q��amsc�9� 1�*�sc����:)@whg��#��A�O��<;�q�ܵ����)7���~B����x#鉾��s�o`	�ԊK�k{�8��!h�'ꁵ[�Zݧ���l�7=p9�%H��cQC���Z�1z�T=3��Q`ӓK��q'$Uϙ�O���y�������gΥN��[[lՓK�{s�Q�P����ʌw�ɏ����k�_"~>}��]�������ʯ�?���{���H�����+ ���������}��*?��[�M<G���_����[�Mɯ����.�ך��r�x���]+09�G.��%=���������:?q�7~6~hx�-gh�)�?��}̏����׷M����N����˟܍`����r˴z�������)�\44=��_�4=p~�K�U`hz�X~��%�p��g���C� �	�C��N[��͍�������{��/o��A����8-�aoǸ�/?zm-�V�D=t���V����w/��`~�X�~�ۊ6f�]�V��"���V�\� ���H|z����@�w��|��%�pC�$�I����"��:DA���!��)��m1$x�����!��!���������9�gm,\������1���j��j�����V=oM�
	�G���uc�� ��k��JɖF�u`N���ϵ����_���܏���e4����~�m��zVDj~^k~ݡ����Z`�
��GU���acV!j�q�r�/�\����    IEND�B`�  [remap]

importer="texture"
type="StreamTexture"
path="res://.import/tileset_testtiles.png-4cc50338b9fc63e5ec9b0c76dec8237b.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://art/testtiles/tileset_testtiles.png"
dest_files=[ "res://.import/tileset_testtiles.png-4cc50338b9fc63e5ec9b0c76dec8237b.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
          [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST               �   PNG �PNG

   IHDR         ��a   sRGB ���   \IDAT8�cd����k��H,H��8�0k .��`&"�� x��k <\�[��
D0E$�/��;G���3Iu��E��� �u\;5�    IEND�B`�              [remap]

importer="texture"
type="StreamTexture"
path="res://.import/goal.png-d8026b4c83cd0c976a2c07258ba1a29e.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://goal.png"
dest_files=[ "res://.import/goal.png-d8026b4c83cd0c976a2c07258ba1a29e.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
               GDST@   @           9  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx�ݜytTU��?��WK*�=���%�  F����0N��݂:���Q�v��{�[�����E�ӋH���:���B�� YHB*d_*�jyo�(*M�JR!h��S�T��w�߻���ro���� N�\���D�*]��c����z��D�R�[�
5Jg��9E�|JxF׵'�a���Q���BH�~���!����w�A�b
C1�dB�.-�#��ihn�����u��B��1YSB<%�������dA�����C�$+(�����]�BR���Qsu][`
�DV����у�1�G���j�G͕IY! L1�]��� +FS�IY!IP ��|�}��*A��H��R�tQq����D`TW���p\3���M���,�fQ����d��h�m7r�U��f������.��ik�>O�;��xm��'j�u�(o}�����Q�S�-��cBc��d��rI�Ϛ�$I|]�ơ�vJkZ�9>��f����@EuC�~�2�ym�ش��U�\�KAZ4��b�4������;�X婐����@Hg@���o��W�b�x�)����3]j_��V;K����7�u����;o�������;=|��Ŗ}5��0q�$�!?��9�|�5tv�C�sHPTX@t����w�nw��۝�8�=s�p��I}�DZ-̝�ǆ�'�;=����R�PR�ۥu���u��ǻC�sH`��>�p�P ���O3R�������۝�SZ7 �p��o�P!�
��� �l��ހmT�Ƴێ�gA��gm�j����iG���B� ܦ(��cX�}4ۻB��ao��"����� ����G�7���H���æ;,NW?��[��`�r~��w�kl�d4�������YT7�P��5lF�BEc��=<�����?�:]�������G�Μ�{������n�v��%���7�eoݪ��
�QX¬)�JKb����W�[�G ��P$��k�Y:;�����{���a��&�eפ�����O�5,;����yx�b>=fc�* �z��{�fr��7��p���Ôִ�P����t^�]͑�~zs.�3����4��<IG�w�e��e��ih�/ˆ�9�H��f�?����O��.O��;!��]���x�-$E�a1ɜ�u�+7Ȃ�w�md��5���C.��\��X��1?�Nغ/�� ��~��<:k?8��X���!���[���꩓��g��:��E����>��꩓�u��A���	iI4���^v:�^l/;MC��	iI��TM-$�X�;iLH���;iI1�Zm7����P~��G�&g�|BfqV#�M������%��TM��mB�/�)����f����~3m`��������m�Ȉ�Ƽq!cr�pc�8fd���Mۨkl�}P�Л�汻��3p�̤H�>+���1D��i�aۡz�
������Z�Lz|8��.ִQ��v@�1%&���͏�������m���KH�� �p8H�4�9����/*)�aa��g�r�w��F36���(���7�fw����P��&�c����{﹏E7-f�M�).���9��$F�f r �9'1��s2).��G��{���?,�
�G��p�µ�QU�UO�����>��/�g���,�M��5�ʖ�e˃�d����/�M`�=�y=�����f�ӫQU�k'��E�F�+ =΂���
l�&���%%�������F#KY����O7>��;w���l6***B�g)�#W�/�k2�������TJ�'����=!Q@mKYYYdg��$Ib��E�j6�U�,Z�鼌Uvv6YYYԶ��}( ���ߠ#x~�s,X0�����rY��yz�	|r�6l����cN��5ϑ��KBB���5ϡ#xq�7�`=4A�o�xds)�~wO�z�^��m���n�Ds�������e|�0�u��k�ٱ:��RN��w�/!�^�<�ͣ�K1d�F����:�������ˣ����%U�Ą������l{�y����)<�G�y�`}�t��y!��O@� A� Y��sv:K�J��ՎۣQ�܃��T6y�ǯ�Zi
��<�F��1>�	c#�Ǉ��i�L��D�� �u�awe1�e&')�_�Ǝ^V�i߀4�$G�:��r��>h�hݝ������t;)�� &�@zl�Ұր��V6�T�+����0q��L���[t���N&e��Z��ˆ/����(�i啝'i�R�����?:
P].L��S��E�݅�Á�.a6�WjY$F�9P�«����V^7���1Ȓ� �b6�(����0"�k�;�@MC���N�]7 �)Q|s����QfdI���5 ��.f��#1���G���z���>)�N�>�L0T�ۘ5}��Y[�W뿼mj���n���S?�v��ْ|.FE"=�ߑ��q����������p����3�¬8�T�GZ���4ݪ�0�L�Y��jRH��.X�&�v����#�t��7y_#�[�o��V�O����^�����paV�&J�V+V��QY����f+m��(�?/������{�X��:�!:5�G�x���I����HG�%�/�LZ\8/����yLf�Æ>�X�Єǣq���$E������E�Ǣ�����gێ��s�rxO��x孏Q]n���LH����98�i�0==���O$5��o^����>6�a� �*�)?^Ca��yv&���%�5>�n�bŜL:��y�w���/��o�褨A���y,[|=1�VZ�U>,?͑���w��u5d�#�K�b�D�&�:�����l~�S\���[CrTV�$����y��;#�������6�y��3ݸ5��.�V��K���{�,-ւ� k1aB���x���	LL� ����ңl۱������!U��0L�ϴ��O\t$Yi�D�Dm��]|�m���M�3���bT�
�N_����~uiIc��M�DZI���Wgkn����C��!xSv�Pt�F��kڨ��������OKh��L����Z&ip��
ޅ���U�C�[�6��p���;uW8<n'n��nͽQ�
�gԞ�+Z	���{���G�Ĭ� �t�]�p;躆 ��.�ۣ�������^��n�ut�L �W��+ ���hO��^�w�\i� ��:9>3�=��So�2v���U1z��.�^�ߋěN���,���� �f��V�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
RSRC                    AudioStreamSample                                                                 
      resource_local_to_scene    resource_name    data    format 
   loop_mode    loop_begin 	   loop_end 	   mix_rate    stereo    script        
   local://1          AudioStreamSample          �-                                                                  ��{�A��������n�T�@�1�'�#�$�+�7�H�_�|�������#�Z�����  m � u�@�!��#�E�|!�y	,
�
�j4��]�N�~��
�	B	��:��1��({� r ���k����c����Z�����Q�����I�����@�����7����/�����&��6����?����G����P�����X����a����j����r� ���{�' � �0��8��A��I��	R
�
�[�c�l���/��'y�q�

h	�_�W��N��A| ����������u�6��������w�y�����-���3�������������E�� I8�Y�  5�F�9����k���T����������k�q�����8��������o6
����^~����	?`� �������#�C�c���>��������|�\�<� ����yX8�'Gh���
�	)K�k����������-�M�m�t�T�4����������r�P0�	���oN��1Qr�	��� �5�U�u�������������j�J�*�	��������gF&���������g� �s���������e�B�|���*�z�m��A�!���W�)�(U�:�$Q#<�	f������q�������mM���6DD������s�������&��:� �#��U�����޳�M���� 	�R�"w�B��s���>�_����/��c���"1��` ��,���ݥ�@���v��D�� �O������K�Q����"���V��&!>�n��:����3���h��	7�m#�\�
'����X����z���H�~K"�{��G����w�&���[����*�_ y�������u����������}G�w�U��]��������;��9��5����/����z
V�fm��|�����[�{�C���#?�GY���t��������O!,J}����M߂�N�����K �, M������P�~�K����{H,� Q������ Ԯ�{�G���x+�!�!V�������ݫ�w�B��*�"��&�Z��������r>�)Z#��	��*�]��>�
����n;)*$^�
����-�a�n�:����k7(�$.a������1؞�j�7���g'�%�&~���q��3ڪ��J�t��#c%���	�`���`�=���A���� ���	���� ������N������	�����������0��/�<O!"�������q�:����8���3!#w�${���'�~�.����+��~(-"��/����3��"���v� �	r9!��;����?�����j��
fE ��G����K��
��^��ZP��S���W�T����R���N�]�	_���c�I����F���C� h�
k ���n�=����;���6�!t�!	x���P��,�w�k��C,����	*������X������e�����b�������`���04�z,>�m�
���z	��Ds/�#x�^�
�	5	a���2��T���t����$���E���e�������6���V������k���K��+��
�z���Z���:��������i�� G�'�w	�
W�6���f�E��i���:�Z�{
�+�K�k�������>���^���~���.��O���o�����R���2������a���A��!��� �p���P���0�� x�M�	y
��m=��+�	W�e���
�	&	}�i �nF48P��R ����h�1�������_�.�����������2���@����]�p��Q	�z3 ����]������>��R�����)�q���� G��e�
�{3��\ �����?�����h���)�p��� �G���� e��<�4��]�� ?�����h�!���������G������e�� �;��Z]��?�� i�!�����J���������e�����<�� �Y��0�?��h!� ��O��������o��7�W�i�o�i�U�3� � �0�cL!���������e���-���(�����Q����x� ���Y���t���p���L � k E ,    , G n � � .��c�5��+}� r�h�]�S���e�o�z(��2��=��G��R �\
� f  ��r� ���}�+�����5�����@�����J�����U����_����j����t�"�1�����&�x����n����c����Y�����N�����D�����9�����/�����# u � k�`�V��K��@��(s�I��Me!��k5���\;�������������seXLC:4/,**,05;DOZgv��������hK.�����dG+����~aD'
����z]@$����wZ= � � � � s V 9    ��������q�T�7������������m�P�4������������j�M�0������������g�J�-������������c�F�)����������|�`�C�&�	���������y�\�?�"����������u�x�{�~����������������������J�������(�]�������(�Y��������>�i��������3�Y�~�������	�)�H�g������������$�;�Q�g�|���������������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "V  RSRC               [remap]

importer="wav"
type="AudioStreamSample"
path="res://.import/jumpwav.wav-e01680f9e9996f30433632851c80a6d8.sample"

[deps]

source_file="res://jumpwav.wav"
dest_files=[ "res://.import/jumpwav.wav-e01680f9e9996f30433632851c80a6d8.sample" ]

[params]

force/8_bit=false
force/mono=false
force/max_rate=false
force/max_rate_hz=44100
edit/trim=false
edit/normalize=false
edit/loop=false
compress/mode=0
          GDSC   b      �   �     ������������τ�   ������ض   ���������¶�   �������Ӷ���   ����������Ѷ   ��������Ҷ��   ����������������   ��������򶶶   ������������   ��������������   �������   ����������   �����Ŷ�   ���󶶶�   �����ᶶ   �������϶���   ��������   ��������Ѷ��   ���������Ѷ�   ������������ⶶ�    ����������������������������󶶶   ��������������������ⶶ�   ������������Ӷ��   �����������޶���   �������������Ӷ�   �������������Ӷ�   ����������������Ķ��   ��������������Ķ   ����߶��   �����Ӷ�   �����Ӷ�   ���������������Ķ���   ��������������Ķ   �����϶�   �����������Ӷ���   ���������������Ŷ���   ����׶��   ������¶   ����¶��   ������������������޶   ϶��   ����������Ķ   �����߶�   ���Ӷ���   ζ��   ���϶���   ����������������������Ҷ   �����������Ѷ���   ���������������������Ҷ�   ���ƶ���   �������������Ӷ�   �涶   �����¶�   ����¶��   ����������������Ҷ��   ���������������Ŷ���   ������������������������ض��   ��������Ӷ��   �������޶���    �����������������������������Ӷ�   ��������������������¶��   ������ٶ   �����Ӷ�   �����¶�   ����������Ѷ   ��������������ض   ����������޶   ���������Ӷ�   �������Ӷ���   �������Ӷ���   �������¶���   ��������Ҷ��   ƶ��   �������������¶�   ����������ڶ   �������Ӷ���   �������ض���   ����������ٶ   �����������Ҷ���   �����޶�   ���޶���   ������������޶��   �����Ҷ�   ����������޶   ������������޶��   ��߶   ��ƶ   �����ƶ�   �����¶�   �������ƶ���   ����������ƶ   ��������   �������ƶ���   ����������ƶ   ����������ڶ   Ƈ��   Ƅ��   ��������Ŷ��      Terrain       res://Goal-marking.tscn       res://jumpwav.wav      �     @        �>  {�G�z�?   �      x                           �?                       ui_right      ui_left       Stand         ui_up         click                     World                     Run       Jump      ?                                     #      $      %   	   *   
   /      4      9      >      C      K      L      S      X      ]      ^      _      d      i      n      s      y      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6   �   7   �   8   �   9   �   :     ;   
  <     =      >   #  ?   /  @   3  A   4  B   9  C   H  D   I  E   U  F   Y  G   Z  H   e  I   f  J   m  K   q  L   z  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T   �  U   �  V   �  W   �  X   �  Y   �  Z   �  [   �  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d   �  e     f   	  g   
  h     i   &  j   -  k   .  l   7  m   >  n   @  o   A  p   B  q   F  r   L  s   T  t   f  u   u  v   v  w   w  x   x  y     z   �  {   �  |   �  }   �  ~   �     �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �      �     �     �     �     �      �   0  �   8  �   9  �   ?  �   E  �   I  �   P  �   W  �   X  �   Y  �   Z  �   `  �   p  �   y  �   z  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �     �     �   "  �   #  �   $  �   %  �   &  �   '  �   (  �   )  �   *  �   4  �   6  �   7  �   >  �   ?  �   @  �   K  �   L  �   O  �   P  �   Y  �   ^  �   n  �   ~  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   3YYY5;�  �  PQT�  PQY5;�  �L  P�  QY5;�  �L  P�  QYYY:�  �  Y:�  �  Y:�  �  Y:�	  �  Y:�
  �  Y:�  �  Y>�  N�  R�  OYY;�  �  T�  Y;�  �	  Y;�  �	  YYY:�  �
  Y:�  �  Y:�  �  Y;�  �  Y;�  LMY;�  �  PQY;�  �  PQY;�  Y;�  �  YY;�  �  YY5;�  W�  Y5;�  W�   YY0�!  PQVY�  �"  P�  T�  QYY0�#  P�$  QV�  ;�%  �&  T�'  P�  Q�&  T�'  P�  Q�  �  �	  Y�  �  �  T�(  �
  �$  Y�  &�)  PQV�  �  �	  �  �  �  &�  V�  �*  PQ�  �  &�%  �  �  V�  �+  P�%  QY�  &�)  PQV�  &�  V�  �  T�,  �  P�  T�,  R�  R�  Q�  �  T�-  P�  Q�  (V�  &�&  T�.  P�  Q�  V�  �/  PQY�  &�  V�  �  T�,  �  P�  T�,  R�  R�	  Q�  �  &�&  T�0  P�  Q�  V�  �1  PQ�  �  �  �2  P�  R�  T�3  QYY0�4  P�5  QV�  &�  V�  &�5  T�6  P�  QV�  ;�7  �8  PQY�  �  P�7  �  QT�  PQ�  �"  P�  T�  QYY0�"  P�9  QV�  �  �9  �  &�9  �  T�  V�  �  �  �  �:  P�  Q�  Y0�*  PQV�  &�  �  T�  V�  �  �;  PQ�  �  &�)  PQ�  �  V�  �:  P�  Q�  �  ;�<  �=  P�  Q�  &�<  V�  �  T�>  P�  Q�  &�X  P�  Q�  V�  �"  P�  T�  Q�  (V�  �  �  L�  M�  �  �  �  Y0�:  P�?  QV�  �  �  T�@  PP�A  �  QT�  PQR�?  R�  Q�  �  �B  P�  QY�  &�X  P�  Q	�  V�  �"  P�  T�  Q�  .�  �  �  &�  V�  �  T�C  PQ�  �  �  T�D  PQ�  �E  PQT�F  PQT�  P�  QT�G  P�  Q�  �  T�A  �  L�  ML�  M�  Y�  �  �  �  �  L�  M�  Y0�=  P�H  QV�  ;�I  �H  L�  M�  �  ;�J  �H  L�  M�  ;�K  �L  T�M  P�I  Q�  �  �  ;�%  �  &�I  T�,  �L  T�,  �  (�  �  �+  P�%  Q�  �  �  &P�J  �  Q�I  T�(  �  	�L  T�(  V�  &�J  	�  �  V�  �1  PQ�  (V�  �/  PQ�  �  �  ;�N  �K  	�  P�J  �)  PQQ�  �  .�N  YY0�+  P�%  QV�  &�  �  V�  �  T�-  P�  QY�  �  �  �  �  T�,  �%  �  �;  PQ�  �  T�,  �5  P�  T�,  R�  R�  Q�  �  T�O  �%  	�  �  Y0�1  PQV�  &�)  PQV�  �  �  �  �  T�-  P�  Q�  �  T�(  �  �  �  �  Y0�/  PQV�  &�)  PQ�  T�(  	�  �  V�  �  T�(  �  �  YY0�B  P�P  QV�  ;�Q  LM�  )�H  �P  V�  �H  L�  M�  P�  R�  Q�  �Q  T�R  P�H  Q�  .�Q  �  Y0�S  P�P  QV�  .�P  �  &�P  V�  .LM�  �  �  ;�T  L�P  L�  MRM�  )�U  �K  P�  R�X  P�P  Q�  QV�  ;�H  �P  L�U  M�  ;�V  �H  L�  M�  ;�W  �H  L�  M�  �  ;�X  �P  L�U  �  M�  ;�Y  �X  L�  M�  ;�Z  �X  L�  M�  �  ;�[  �P  L�U  �  M�  ;�\  �[  L�  M�  ;�]  �[  L�  M�  YYYYYY�  �  &�Z  �  �W  �  V�  ,�  �  �T  T�R  P�H  Q�  �  �  �T  T�R  P�P  L�  MQ�  �  .�T  YY0�^  P�_  R�`  QV�  ;�a  L�  �  P�_  T�,  �  R�_  T�(  �  QR�  �  P�_  T�,  �  R�_  T�(  �  QR�  �  P�_  T�,  �  R�_  T�(  �  QR�  �  P�_  T�,  �  R�_  T�(  �  QR�  M�  )�H  �a  V�  &�`  �H  V�  .�  �  .�	  Y`     GDSC   G   
   �   �     ������ƶ   ������ƶ   ����������������   ���������䶶   ����Ӷ��   �������Ӷ���   ����������޶   �����϶�   ����������Ѷ   ����¶��   ���ڶ���   ���������¶�   ���Ҷ���   �����������������Ŷ�   �������������Ŷ�   �����߶�   �����������򶶶   ζ��   ϶��   �������¶���   ����   �����¶�   ������������޶��   ��������۶��   �������Ŷ���   �������϶���   ������¶   ��ƶ   ��������������   ����������������ƶ��   ������������������߶   ̶��   ��������������   ���������޶�   �������������Ŷ�   ���Ŷ���   ��������ض��   �������Ķ���   ������������Ŷ��   ��������������򶶶�   ������������ƶ��   �����Ҷ�   ��������������߶   ��������������򶶶�   ����������������Ӷ��   �������������������������¶�   ����������������Ӷ��   ��¶   ����������Ӷ   ����������   �������Ŷ���   ����������򶶶�   ���������   ض��   �����������ƶ���   ��������Ŷ��   ���������������������ڶ�   ���ض���   �ƶ�   �������������¶�   ���¶���   ����������¶   ����¶��   �����������¶���   Ƈ��   Ƅ��   ����������ٶ   ������������¶��   �����������϶���   ����¶��   ��������������������Ŷ��      res://scripts/binheap.gd     @@                                     �������?                                                          	   (   
   )      /      0      6      8      9      J      K      L      Q      Z      [      \      a      b      c      s      t      u      ~      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2     3     4     5     6     7     8   !  9   "  :   7  ;   @  <   A  =   D  >   E  ?   T  @   \  A   d  B   e  C   n  D   o  E   q  F   r  G   s  H   y  I     J   �  K   �  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T   �  U   �  V   �  W   �  X   �  Y   �  Z   �  [   �  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d     e     f     g     h     i     j   "  k   #  l   ,  m   /  n   0  o   ?  p   @  q   A  r   B  s   C  t   I  u   J  v   ]  w   ^  x   w  y   ~  z     {   �  |   �  }   �  ~   �     �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   	  �     �   !  �   "  �   +  �   2  �   3  �   6  �   7  �   D  �   L  �   M  �   W  �   X  �   ^  �   i  �   t  �   ~  �     �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   3YYY;�  �L  PQYY:�  �  Y:�  �  T�  YY8P�  Q;�  �  P�  R�  QYY;�  LMYY0�  PQV�  -�  Y0�  P�	  R�
  R�  ]R�  �  QV�  Y�  &�  V�  �  �  P�  PQQ�  �  �  ;�  �  �  �  �  ;�  �  P�	  T�  R�	  T�  R�  QY�  �  ;�  �  T�  PQ�  �  T�  PL�  P�	  R�
  QRL�  R�  MMQ�  �  �  ;�  NO�  �  �  ;�  NO�  �  L�  M�  Y�  *�  T�  PQV�  �  ;�  �  T�  PQL�  M�  ;�  �  L�  M�  ;�  �  L�  M�  ;�  �  T�  �  ;�   �  P�  T�  R�  T�  Q�  �  &�   �
  V�  �  �  ;�!  LL�  P�  T�  R�  T�  QR�  MM�  �  ;�"  �  T�#  PQ�  �  *�  �"  V�  �  �  L�  M�  �  �  L�  M�  �  ;�$  L�  P�  T�  R�  T�  QR�  L�  MM�  �!  T�  P�  R�$  Q�  �  .�!  �  �  )�%  �&  P�   R�  R�  R�  QV�  ;�'  �%  L�  M�  ;�(  �%  L�  M�  �  &P�'  �  QV�  �  ,�  �  �  &�(  �  V�  &�  �  V�  �  �  �  �  �%  T�)  P�  Q�  (V�  �  �%  T�)  P�  Q�  (V�  �  �%  T�)  P�  Q�  �  ;�*  �%  L�  M�  ;�+  �  P�'  T�  R�'  T�  R�*  Q�  �  �  �  ;�,  �  L�  M�-  P�  R�+  Q�  �  ;�.  �  T�/  P�+  R]Q�  &�,  	�.  V�  �  �  �  L�+  M�  �  �  L�+  M�,  �  �  ;�0  �,  �  P�'  R�
  QY�  ;�1  L�+  R�(  MY�  &�  T�2  P�1  QV�  �  T�  PL�0  R�1  MQY�  �  .LMYY0�-  P�3  R�4  QV�  .�  YY0�&  P�5  V�  R�6  R�  R�  QV�  �  �  �  �  ;�7  LM�  �  ;�8  �6  �  P�  &�6  �  �  (�  Q�  �  ;�9  L�  P�5  T�  R�5  T�  �  QR�3  P�  R�8  QM�  �7  T�)  P�9  Q�  �  &�6  	�  V�  ;�:  L�  P�5  T�  R�5  T�  �  QR�8  M�  �7  T�)  P�:  Q�  �  ;�;  �  &�6  	�  �  (�	  �  �  &�6  �;  �  V�  ;�<  L�  P�5  T�  �  R�5  T�  QR�  M�  ;�=  �  P�5  T�  �  R�5  T�  �  Q�  &�=  �  V�  �  �<  L�  M�6  �  �  �7  T�)  P�<  Q�  �  ;�>  L�  P�5  T�  �  R�5  T�  QR�  M�  ;�?  �  P�5  T�  �  R�5  T�  �  Q�  &�?  �  V�  �  �>  L�  M�6  �  �  �7  T�)  P�>  Q�  �  .�7  YY0�  P�@  V�  R�A  V�  QV�  .�@  T�B  P�A  QYY0�  P�C  LMQV�  �  ;�D  LM�  )�  �K  P�  T�  QV�  )�  �K  P�  T�  QV�  ;�E  �  P�  R�  QY�  &�E  �C  V�  ,�  �  �D  T�)  P�E  Q�  �  .�D  YY0�F  P�E  QV�  .�E  T�  	�  �E  T�  	�  �E  T�  �  T�  �E  T�  �  T�  Y`   GDSC            S      ���ӄ�   ����Ķ��   �����Ķ�   ��������Ŷ��   �����϶�   ߶��   �߶�   �������Ӷ���   ��������Ҷ��   �����Ҷ�   �������ض���      res://Racer.tscn   	      (                                                                   	      
         (      1      6      =      L      M      N      O      P      Q      3YY5;�  �L  PQYY;�  Y;�  LMYYY0�  PQV�  �  )�  �K  P�  QV�  ;�  �  T�  PQ�  �  P�  Q�  �  T�	  P�  Q�  �  T�
  �  P�  R�  �  �  Q�  YYYYY`               GDSC         F   u     ���Ӷ���   �������¶���   ����������Ӷ   ����¶��   �����¶�   ݶ��   �����Ҷ�   �����ƶ�   ߶��   ��ƶ   �������ض���   �ն�   �������Ҷ���   ��ƶ   �����ڶ�   �������ݶ���   �������Ŷ���   ��ڶ   ���������¶�   ���۶���   �������϶���                                                                     	               	      
                      '      (      )      *      1      5      :      ;      B      E      M      a      j      v      }      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,      -     .     /     0     1     2     3   (  4   .  5   2  6   7  7   :  8   ;  9   B  :   G  ;   H  <   N  =   R  >   V  ?   X  @   a  A   d  B   g  C   h  D   n  E   s  F   3YYYYY;�  Y;�  YY0�  PQV�  �  LLMM�  �  YY0�  P�  QV�  �  �  �  �  T�  P�  Q�  �  �  �  �  P�  QYY0�  P�  QV�  ;�	  �  *�  �  V�  &�  L�  MLM	�  L�  �  MLMV�  �	  �  L�  �  M�  �  L�  �  M�  L�  M�  �  L�  M�	  �  �  �  �  YY0�
  P�  QV�  ;�	  �  *P�  �  Q
�  V�  ;�  �  P�  Q�  &�  L�  MLM�  L�  MLMV�  �	  �  L�  M�  �  L�  M�  L�  M�  �  L�  M�	  �  �  �  YY0�  P�  QV�  &�  �  �  �  V�  .�  �  �  (V�  &�  L�  �  MLM	�  L�  �  �  MLMV�  .�  �  �  (V�  .�  �  �  YY0�  PQV�  ;�  �  L�  M�  �  L�  M�  L�  M�  �  T�  PQ�  �  �  �  �
  P�  Q�  .�  YY0�  P�  QV�  ;�  �  �  �  )�  �  V�  &�  V�  �  �  �  ,�  &�  L�  M�  V�  .�  �  .�  YY0�  PQV�  .�  	�  Y` [remap]

path="res://scripts/Racer.gdc"
        [remap]

path="res://scripts/Terrain.gdc"
      [remap]

path="res://scripts/World.gdc"
        [remap]

path="res://scripts/binheap.gdc"
      �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name      	   sidetrack      application/run/main_scene         res://World.tscn   application/config/icon         res://icon.png     display/window/size/width      @     display/window/size/height      �      display/window/size/test_width            display/window/size/test_height      �     display/window/stretch/mode         2d     display/window/stretch/aspect         keep   input/ui_up(              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   Z      unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script         input/click�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script      $   rendering/quality/driver/driver_name         GLES2   %   rendering/vram_compression/import_etc         &   rendering/vram_compression/import_etc2          )   rendering/environment/default_environment          res://default_env.tres            