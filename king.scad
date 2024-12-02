// 分割を細かくする
$fn = 100;

// 土台の下
r1 = 12;
// 真ん中の円柱の太さ
r2 = 5.5;
// キングの頭の下部の半径
r3 = 4;
// キングの頭の上部の半径
r4 = 7;
// 土台の高さ
h1 = 10;
// 円柱の高さ
h2 = 15;
// キングの頭の高さ
h3 = 8;
// 十字架の大きさ
cross_size = 2;

union() {
// 土台の円錐台
cylinder(r1=r1, r2=r2, h=h1);
// 真ん中の円柱
translate([0, 0, h1]) {
    cylinder(r=r2, h=h2);
}
// 頭
translate([0, 0, h1 + h2]) {
    cylinder(r1=r3, r2=r4, h=h3);
}
// 十字架
// 縦の棒
translate([
    0,
    0,
    h1 + h2 + h3 + cross_size * 1.5
]) {
    cube(
        [
            cross_size,
            cross_size,
            cross_size * 3
        ],
        center=true
    );
}
// 横の棒
translate([
    0,
    0,
    h1 + h2 + h3 + cross_size * 1.5
]) {
    cube(
        [
            cross_size,
            cross_size * 3,
            cross_size
        ],
        center=true
    );
}
}