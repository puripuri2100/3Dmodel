// 分割を細かくする
$fn = 100;

// 土台の下
r1 = 10;
// 真ん中の円柱の太さ
r2 = 4;
// 球の大きさ
r3 = 7;
// 土台の高さ
h1 = 8;
// 円柱の高さ
h2 = 10;
// 球がのめり込む長さ
h3 = 1;

union() {
    // 土台の円錐台
    cylinder(r1=r1, r2=r2, h=h1);
    // 真ん中の円柱
    translate([0, 0, h1]) {
        cylinder(r=r2, h=h2);
    }
    // 球
    translate([0, 0, h1 + h2 + r3 - h3]) {
        sphere(r3);
    }
}